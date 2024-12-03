import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

part 'secure_storage_key.dart';

class SecureStorage {
  final _box = const FlutterSecureStorage();

  static final SecureStorage _instance = SecureStorage._internal();

  factory SecureStorage() => _instance;

  SecureStorage._internal();

  /// Saves data to local storage with the given [key] and [value].
  Future<void> write({required String key, required String value}) async {
    try {
      await _box.write(key: key, value: value);
    } catch (e) {
      // Handle error (e.g., log it)
      debugPrint('Error saving data: $e');
    }
  }

  /// Retrieves data from local storage for the given [key].
  /// Returns null if the key does not exist.
  Future<String> read({required String key}) async {
    try {
      return await _box.read(key: key) ?? '';
    } catch (e) {
      // Handle error (e.g., log it)
      debugPrint('Error retrieving data: $e');
      return ''; // Return '' in case of error
    }
  }

  /// Removes data from local storage for the given [key].
  Future<void> remove({required String key}) async {
    try {
      await _box.delete(key: key);
    } catch (e) {
      // Handle error (e.g., log it)
      debugPrint('Error removing data: $e');
    }
  }

  /// Clears all data from local storage.
  Future<void> clearAll() async {
    try {
      await _box.deleteAll();
    } catch (e) {
      // Handle error (e.g., log it)
      debugPrint('Error clearing all data: $e');
    }
  }
}
