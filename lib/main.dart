import 'package:flutter/material.dart';
import 'package:todolist/screens/create_todo_screen/create_todo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Todo List',
      debugShowCheckedModeBanner: false,
      home: CreateTodo(),
    );
  }
}
