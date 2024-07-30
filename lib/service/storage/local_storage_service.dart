import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todoly/model/_model.dart';
import 'package:todoly/model/todo_model.dart';
import 'package:todoly/reposotory/storage_repository.dart';
import 'package:todoly/service/storage/storage_keys.dart';

class LocalStorageService {
  // final ApiService _apiService = ApiService();
  Future<void> initializeHive() async {
    final dir = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(dir.path);

    await Hive.openBox<dynamic>(
      AppStorageKeys.appBox,
    );
  }

  List<TodoModel>? getTodoList() {
    final res = StorageRepository().read<dynamic>(
      key: AppStorageKeys.todoListKey,
    );

    return res == null
        ? null
        : List<TodoModel>.from(
            json.decode(res).map(
                  (data) => TodoModel.fromJson(data),
                ),
          );
  }

  dynamic deleteTodos() {
    StorageRepository().delete(
      key: AppStorageKeys.todoListKey,
    );
  }

  Future<void> cacheTodoList(dynamic val) async {
    await StorageRepository().write<dynamic>(
        key: AppStorageKeys.todoListKey, value: jsonEncode(val));
    unawaited(cachePendingTodoList(val));
    log('saved todos');
  }

  Future<void> cachePendingTodoList(dynamic val) async {
    await StorageRepository().write<dynamic>(
        key: AppStorageKeys.pendingUploadkey, value: jsonEncode(val));
    log('saved pendingTodos');
  }

  void uploadAndDeletePendingTodoList() async {
    final res = StorageRepository().read<dynamic>(
      key: AppStorageKeys.pendingUploadkey,
    );

    res == null
        ? null
        : List<TodoModel>.from(
            json.decode(res).map(
                  (data) => TodoModel.fromJson(data),
                ),
          );

    if (res != null && res.isNotEmpty) {
      try {
        /// await perform Api upload here
        // / await _apiService.post('/upload', body: res.toJson(),);
        ///then delete
        StorageRepository().delete(key: AppStorageKeys.pendingUploadkey);
      } on Error catch (e) {
        log('Error: $e');
      }
    }
  }
}
