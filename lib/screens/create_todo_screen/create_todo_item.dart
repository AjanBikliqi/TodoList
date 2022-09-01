import 'package:flutter/material.dart';

import 'create_todo_model.dart';

class CreateTodoItem extends StatelessWidget {
  const CreateTodoItem({
    Key? key,
    required this.todo,
    this.onCreatedTodoTapped,
    this.id,
  }) : super(key: key);

  final CreatedTodoModel todo;
  final Function(CreatedTodoModel todo)? onCreatedTodoTapped;
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
      onTap: () {
        onCreatedTodoTapped!(todo);
      },
      leading: CircleAvatar(
        child: Text(
          id!,
        ),
      ),
      title: Text(
        todo.name,
        style: todoTextStyle(todo.checked),
      ),
    );
  }
}
