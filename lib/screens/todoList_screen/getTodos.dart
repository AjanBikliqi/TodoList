import 'package:todolist/screens/todoList_screen/todoList_services.dart';
import 'package:todolist/screens/todoList_screen/todo_list_model.dart';

Future<List<TaskModel>> getTodos() async {
  var result = await TodoServices.getTodos();
  return result;
}
