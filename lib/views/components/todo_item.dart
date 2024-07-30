import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  final String todoText;
  final bool isSelected;
  final void Function() promptRemoveTodoItem;
  final void Function(bool?) onChanged;

  const TodoItem({
    super.key,
    required this.todoText,
    required this.promptRemoveTodoItem,
    required this.isSelected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(todoText),
      confirmDismiss: (direction) {
        return showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Are you sure you want to delete this task?'),
                actions: [
                  ElevatedButton(
                    child: const Text('Cancle'),
                    onPressed: () => Navigator.of(context).pop(false),
                  ),
                  ElevatedButton(
                      onPressed: promptRemoveTodoItem,
                      child: const Text('Mark as done')),
                ],
              );
            });
      },
      onDismissed: (direction) {},
      background: Container(
        color: Colors.red,
      ),
      direction: DismissDirection.endToStart,
      child: Container(
        margin: const EdgeInsets.all(16),
        color: Colors.white,
        padding: const EdgeInsets.all(20),
        child: ListTile(
          title: Text(todoText),
          trailing: Checkbox.adaptive(value: isSelected, onChanged: onChanged),
          // trailing: GestureDetector(
          //     onTap: promptRemoveTodoItem,
          //     child: const Icon(
          //       Icons.delete,
          //       color: Colors.red,
          // )),
        ),
      ),
    );
  }
}
