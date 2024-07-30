import 'package:flutter/material.dart';

class AddTaskTodo extends StatelessWidget {
  final Function addTodoItem;
  final GlobalKey<FormState> formKey;
  final TextEditingController textEditingController;
  const AddTaskTodo({
    super.key,
    required this.addTodoItem,
    required this.formKey,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
        padding: const EdgeInsets.all(16),
        // constraints:
        //     BoxConstraints(maxHeight: MediaQuery.of(context).size.height / 4),
        child: Column(
          children: [
            TextFormField(
              autofocus: true,
              onFieldSubmitted: (val) {
                addTodoItem();
                Navigator.pop(context);
              },
              controller: textEditingController,
              decoration: const InputDecoration(
                hintText: 'Task here...',
              ),
            ),
            GestureDetector(
              onTap: () {
                if ((formKey.currentState?.validate() ?? false)) {
                  addTodoItem();
                  Navigator.pop(context);
                }
              },
              child: Container(
                margin: const EdgeInsets.only(top: 40),
                color: Colors.blueGrey,
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      'Add Task',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
