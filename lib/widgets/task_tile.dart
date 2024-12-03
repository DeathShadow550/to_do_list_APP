import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String title; // Title of the task
  final bool isCompleted; // Whether the task is completed
  final Function(bool?)? onCheckboxChanged; // Callback when checkbox is toggled
  final Function()? onDelete; // Callback to delete the task

  TaskTile({
    required this.title,
    required this.isCompleted,
    required this.onCheckboxChanged,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: isCompleted,
        onChanged: onCheckboxChanged,
      ),
      title: Text(
        title,
        style: TextStyle(
          decoration: isCompleted ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete, color: Colors.red),
        onPressed: onDelete,
      ),
    );
  }
}
