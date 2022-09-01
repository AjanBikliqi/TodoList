import 'package:flutter/material.dart';
import 'package:todolist/screens/todoList_screen/todo_list_model.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({
    Key? key,
    required this.todo,
    this.id,
  }) : super(key: key);

  final TaskModel todo;
  final String? id;

  TextStyle? todoTextStyle(bool checked) {
    if (!checked) return null;

    return const TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.indigoAccent,
        child: Text(
          id!,
        ),
      ),
      title: Text(todo.title),
    );
  }
}
