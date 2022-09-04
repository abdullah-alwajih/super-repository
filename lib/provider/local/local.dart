part of '../../super_repository.dart';

class Local {
  static Local? _instance;

  static Local get instance {
    if (_instance == null) init();
    return _instance!;
  }

  static Future<void> init() async {
    _instance ??= Local();
    await GetStorage.init();
  }

  final GetStorage _storage = GetStorage();

  void create({required String key, required dynamic value}) async =>
      await _storage.write(key, value);

  void insert({required String key, required dynamic value}) async =>
      await _storage.write(key, (read(key: key) as List)..add(value));

  dynamic read({required String key}) {
    if (_storage.hasData(key)) return _storage.read(key);
  }

  void delete({required String key}) {
    if (_storage.hasData(key)) _storage.remove(key);
  }

   Future<void> clean() async => await _storage.erase();
}

// class LocalOfModel<T> {
//   static LocalOfModel? _instance;
//   static  late GetStorage _storage;
//   static LocalOfModel get instance {
//     if (_instance == null) init();
//     return _instance!;
//   }
//
//   static Future<void> init<T>() async {
//     _instance ??= LocalOfModel();
//     await GetStorage.init(T.runtimeType.toString());
//     _storage = GetStorage(T.runtimeType.toString());
//   }
//
//
//   void createOfModel({required String key, required T value}) async =>
//       await _storage.write(key, value);
//
//   dynamic read({required String key}) {
//     if (_storage.hasData(key)) return _storage.read<T>(key);
//     throw Exceptions.fromEnumeration(ExceptionTypes.connection);
//   }
//
//   void delete({required String key}) {
//     if (_storage.hasData(key)) _storage.remove(key);
//   }
//
//
//
//   /// Please be aware that calling this function will delete all the data in the cache
//   void clean() async {
//     _storage.erase();
//   }
// }
