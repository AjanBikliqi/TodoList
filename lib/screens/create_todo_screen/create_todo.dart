import 'package:flutter/material.dart';
import 'package:todolist/screens/create_todo_screen/create_todo_item.dart';

import '../todoList_screen/todoList.dart';
import 'create_todo_model.dart';

class CreateTodo extends StatefulWidget {
  const CreateTodo({Key? key}) : super(key: key);

  @override
  State<CreateTodo> createState() => _CreateTodoState();
}

final TextEditingController createTodoController = TextEditingController();
final List<CreatedTodoModel> createdTodos = [];

class _CreateTodoState extends State<CreateTodo> {
  void createTodo(String name) {
    setState(() {
      createdTodos.add(CreatedTodoModel(name: name, checked: false));
    });
    createTodoController.clear();
  }

  createTodoDialog() {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add a new todo item'),
          content: TextField(
            controller: createTodoController,
            decoration: const InputDecoration(hintText: 'Type your new todo'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Add'),
              onPressed: () {
                Navigator.of(context).pop();
                createTodo(createTodoController.text);
              },
            ),
          ],
        );
      },
    );
  }

  void onCreatedTodoTapped(CreatedTodoModel todo) {
    setState(() {
      todo.checked = !todo.checked;
    });
  }

  @override
  void dispose() {
    super.dispose();
    createTodoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Todo'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8.0),
              children: createdTodos.map((CreatedTodoModel? todo) {
                return Column(
                  children: [
                    CreateTodoItem(
                      todo: todo!,
                      onCreatedTodoTapped: onCreatedTodoTapped,
                      id: todo.name[0],
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TodoList(
                    todos: createdTodos,
                  ),
                ),
              );
            },
            child: const Text('Go to todos'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => createTodoDialog(),
        tooltip: 'Add Item',
        child: const Icon(Icons.add),
      ),
    );
  }
}
