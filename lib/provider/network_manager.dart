part of '../super_repository.dart';

class NetworkManager {
  static NetworkManager? _instance;

  static NetworkManager get instance {
    if (_instance == null) init();
    return _instance!;
  }

  final Connectivity _connectivity = Connectivity();

  bool _hasConnection = false;

  bool get hasConnection => _hasConnection;

  static Future<void> init() async {
    _instance ??= NetworkManager();
    await _instance!.checkAndListen();
  }

  Future<void> checkAndListen() async {
    try {
      await _updateState(await _connectivity.checkConnectivity());
      _connectivity.onConnectivityChanged.listen(_updateState);
    } catch (exception) {
      _hasConnection = false;
      throw Exceptions.fromEnumeration(ExceptionTypes.connection);
    }
  }

  Future<void> _updateState(ConnectivityResult result) async {
    if (result != ConnectivityResult.none) {
      _hasConnection = await checkUserConnection();
    } else {
      _hasConnection = false;
      throw Exceptions.fromEnumeration(ExceptionTypes.connection);
    }
    if (!_hasConnection) {
      throw Exceptions.fromEnumeration(ExceptionTypes.connection);
    }
  }

  Future<bool> checkUserConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) return true;
      return false;
    } on SocketException catch (_) {
      return false;
    }
  }
}
