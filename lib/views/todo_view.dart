import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoly/controller/todo_view_controller.dart';
import 'package:todoly/shared/_shared.dart';
import 'package:todoly/views/components/_componenets.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<TodoViewController>();
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return AddTaskTodo(
                  formKey: controller.formKey,
                  textEditingController: controller.textEditingController,
                  addTodoItem: () => controller.addTodoItem(),
                );
              });
        },
        backgroundColor: Colors.blueGrey,
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            floating: false,
            pinned: true,
            centerTitle: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Container(
                  padding: const EdgeInsets.only(left: 16.0),
                  color: Colors.blueGrey,
                  child: const AppLogo(text: 'Todo')),
              background: Container(
                color: Colors.blueGrey,
              ),
            ),
          ),
          const SliverFillRemaining(
            child: TodoList(),
          )
        ],
      ),
    );
  }
}
