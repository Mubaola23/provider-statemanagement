import 'package:flutter/material.dart';
import 'package:todoly/model/_model.dart';
import 'package:todoly/service/storage/local_storage_service.dart';

class TodoViewController extends ChangeNotifier {
  TodoViewController() {
    initState();
  }
  List<TodoModel> todoItems = [];

  final LocalStorageService _storgeService = LocalStorageService();
  LocalStorageService get storageService => _storgeService;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController textEditingController = TextEditingController();

  initState() {
    todoItems = _storgeService.getTodoList() ?? [];
    _storgeService.uploadAndDeletePendingTodoList();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    todoItems.clear();
    super.dispose();
  }

  void addTodoItem() {
    if (textEditingController.text.isEmpty) return;
    todoItems.add(
      TodoModel(title: textEditingController.text),
    );
    _storgeService.cacheTodoList(todoItems);
    textEditingController.text = '';
    notifyListeners();
  }

  void toggleTodoItem(index) {
    todoItems[index].isCompleted = !todoItems[index].isCompleted;
    notifyListeners();

    _storgeService.cacheTodoList(todoItems);
  }

  void removeTodoItem(int index) {
    todoItems.removeAt(index);
    notifyListeners();

    _storgeService.cacheTodoList(todoItems);
  }
}
