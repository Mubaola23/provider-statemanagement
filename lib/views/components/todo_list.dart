import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoly/controller/todo_view_controller.dart';
import 'package:todoly/views/components/todo_item.dart';

class TodoList extends StatelessWidget {
  const TodoList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<TodoViewController>();

    return ListView.builder(
      shrinkWrap: true,
      itemCount: controller.todoItems.length,
      itemBuilder: (context, index) {
        return TodoItem(
          todoText: controller.todoItems[index].title,
          isSelected: controller.todoItems[index].isCompleted,
          onChanged: (bool? value) {
            controller.toggleTodoItem(index);
          },
          promptRemoveTodoItem: () {
            controller.removeTodoItem(index);
            Navigator.of(context).pop();
          },
        );
      },
    );
  }
}
