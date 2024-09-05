import 'package:get/get.dart';
import 'package:todo_list_app/models/todoModel.dart';

class TodoController extends GetxController {
  var todos = <Todomodel>[].obs;

  void addTodo(String _title) {
    todos.add(
      Todomodel(title: _title),
    );
  }

  void todoStatus(int index) {
    var todo = todos[index];
    todo.isCompleted = !todo.isCompleted;
    todos[index] = todo;
  }

  void deleteTodo(int index) {
    todos.removeAt(index);
  }
}
