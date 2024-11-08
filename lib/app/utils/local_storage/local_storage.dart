// import 'package:get_storage/get_storage.dart';
//
// class LocalStorage {
//   final _box = GetStorage();
//
//   static final LocalStorage _instance = LocalStorage._internal();
//
//   factory LocalStorage() => _instance;
//
//   LocalStorage._internal();
//
//   Future<void> saveData(String key, dynamic value) async => _box.write(key, value);
//
//   dynamic getData(String key) => _box.read(key);
//
//   Future<void> removeData(String key) async => _box.remove(key);
//
//   Future<void> clearAll() async => _box.erase();
//
// }