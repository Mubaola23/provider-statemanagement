import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todoly/model/_model.dart';

import 'handlers/path_provider_mock.mocks.dart';

void main() async {
  await MockLocalStorageService().initializeHive();
  group('DashboardViewController', () {
    late MockTodoViewController controller;
    late MockLocalStorageService mockLocalStorageService;

    setUp(() {
      mockLocalStorageService = MockLocalStorageService();
      controller = MockTodoViewController();
      // controller.storageService = mockLocalStorageService;
      controller.todoItems = [TodoModel(title: 'Test Todo')];
    });

    test('initializes with stored todo items', () {
      when(mockLocalStorageService.getTodoList())
          .thenReturn([TodoModel(title: 'Stored Todo')]);

      // controller.initState();

      expect(controller.todoItems.length, 1);
      expect(controller.todoItems.first.title, 'Stored Todo');
    });

    test('adds a todo item', () {
      controller.textEditingController.text = 'New Todo';
      controller.addTodoItem();

      verify(mockLocalStorageService.cacheTodoList('')).called(1);
      expect(controller.todoItems.length, 2);
      expect(controller.todoItems.last.title, 'New Todo');
      expect(controller.textEditingController.text, '');
    });

    test('toggles a todo item', () {
      controller.toggleTodoItem(0);

      verify(mockLocalStorageService.getTodoList()).called(1);
      expect(controller.todoItems[0].isCompleted, isTrue);
    });

    test('removes a todo item', () {
      controller.removeTodoItem(0);

      verify(mockLocalStorageService.getTodoList()).called(1);
      expect(controller.todoItems.length, 0);
    });
  });
}
