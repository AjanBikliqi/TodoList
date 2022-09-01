import 'dart:async';
import 'package:flutter/material.dart';
import 'package:todolist/screens/todoList_screen/todo_items.dart';
import 'package:todolist/screens/todoList_screen/todo_list_model.dart';

import '../create_todo_screen/create_todo_model.dart';
import '../create_todo_screen/create_todo_item.dart';
import 'getTodos.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key? key, required this.todos}) : super(key: key);

  final List<CreatedTodoModel> todos;

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  late Future<List<TaskModel>> futureGetTask;

  @override
  void initState() {
    super.initState();
    futureGetTask = getTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Todo List"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          widget.todos.isEmpty
              ? const SizedBox.shrink()
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: widget.todos.map((CreatedTodoModel? todo) {
                      return CreateTodoItem(
                        todo: todo!,
                        id: todo.name[0],
                      );
                    }).toList(),
                  ),
                ),
          widget.todos.isEmpty
              ? const SizedBox.shrink()
              : const Divider(
                  thickness: 3,
                ),
          Expanded(
            child: FutureBuilder<List<TaskModel>>(
              future: futureGetTask,
              builder: (context, taskSnap) {
                if (taskSnap.hasData) {
                  return ListView.builder(
                    itemCount: taskSnap.data?.length,
                    itemBuilder: (context, index) {
                      var taskIndex = taskSnap.data![index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          color: Colors.white,
                          child: TodoItem(
                            todo: taskIndex,
                            id: taskIndex.id.toString(),
                          ),
                        ),
                      );
                    },
                  );
                } else if (taskSnap.hasError) {
                  return const Center(child: Text('Error'));
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
