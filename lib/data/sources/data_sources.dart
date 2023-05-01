part of '../../super_repository.dart';

class DataProvider {
  static DataProvider? _instance;

  static DataProvider get instance {
    if (_instance == null) init();
    return _instance!;
  }

  static Future<void> init() async {
    _instance ??= DataProvider();
    await Local.init();
    await NetworkManager.init();
  }

  Remote get remote => Remote.instance;

  Local get local => Local.instance;


  bool get remoteConnection => NetworkManager.instance.hasConnection;

  Future<dynamic> update(
      {required Request request, required bool shouldCache}) async {
    try {
      var response = remote.send(request: request, method: HttpMethod.put);

      if (response.toString().isEmpty) {
        throw Exceptions.fromEnumeration(ExceptionTypes.process);
      }

      return response;
    } catch (exception) {
      rethrow;
    }
  }

  Future<dynamic> insert(
      {required Request request, required bool shouldCache}) async {
    try {
      dynamic response;
      if (remoteConnection) {
        response = await remote.send(method: HttpMethod.post, request: request);

        if (response.toString().isEmpty) {
          throw Exceptions.fromEnumeration(ExceptionTypes.process);
        }
        if (shouldCache) {
          local.create(
              key: request.urlQuery + request.data, value: request.data);
        }

        return response;
      } else if (shouldCache) {
        request.data == local.read(key: request.urlQuery + request.data)
            ? response = local.read(key: request.urlQuery + request.data)
            : throw const ConflictException();
        if (response != null) return response;
        throw Exceptions.fromEnumeration(ExceptionTypes.connection);
      } else {
        throw Exceptions.fromEnumeration(ExceptionTypes.connection);
      }
    } catch (exception) {
      rethrow;
    }
  }

  Future<void> delete(
      {required Request request, required bool shouldCache}) async {
    try {
      var response = remote.send(request: request, method: HttpMethod.delete);

      if (response.toString().isEmpty) {
        throw Exceptions.fromEnumeration(ExceptionTypes.process);
      }
    } catch (exception) {
      rethrow;
    }
  }

  Future<dynamic> get(
      {required Request request, required bool shouldCache}) async {
    try {
      dynamic response;
      if (remoteConnection) {
        response = await remote.send(request: request, method: HttpMethod.get);

        if (response == null) {
          throw Exceptions.fromEnumeration(ExceptionTypes.connection);
        }

        if (shouldCache) {
          local.create(key: request.urlQuery, value: response);
        }
      } else if (shouldCache) {
        response = local.read(key: request.urlQuery);
        if (response == null) {
          throw Exceptions.fromEnumeration(ExceptionTypes.connection);
        }
      } else {
        throw Exceptions.fromEnumeration(ExceptionTypes.connection);
      }

      return response;
    } catch (exception) {
      rethrow;
    }
  }
}
