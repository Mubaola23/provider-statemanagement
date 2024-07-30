import 'dart:convert';
import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoly/service/storage/storage_keys.dart';

class StorageRepository {
  Future<void> write<T>({
    required String key,
    required T value,
  }) async {
    try {
      final writeBox = Hive.box<T>(AppStorageKeys.appBox);
      await writeBox
          .put(key, value)
          .then((val) => log('write $key ==> $value'));
    } catch (ex) {
      await Hive.openBox<T>(AppStorageKeys.appBox);
      await write<T>(key: key, value: value);
    }
  }

  T? read<T>({
    required String key,
  }) {
    final readBox = Hive.box<T>(AppStorageKeys.appBox);
    final res = readBox.get(
      key,
    );
    log('read $key ==> ${jsonEncode(res)}');
    return res;
  }

  Future<dynamic> delete({
    required String key,
  }) async {
    final readBox = Hive.box<dynamic>(AppStorageKeys.appBox);
    await readBox
        .delete(
          key,
        )
        .then((value) => log('deleted ==>$key '));
  }
}
