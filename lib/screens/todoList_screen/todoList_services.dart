import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:todolist/screens/todoList_screen/todo_list_model.dart';

class TodoServices {
  static Future<List<TaskModel>> getTodos() async {
    Uri uri = Uri.parse('https://jsonplaceholder.typicode.com/todos');
    final response = await http.get(
      uri,
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      // as list because it would be List<dynamic> but we need Future<List<TaskMode>>
      final result = json.map((e) {
        return TaskModel(
          id: e['id'],
          userId: e['userId'],
          title: e["title"],
          completed: e["completed"],
        );
      }).toList();
      return result;
    } else {
      throw Exception('Failed to load tasks');
    }
  }
}
