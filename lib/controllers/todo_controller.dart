import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:todo_list_app/controllers/constants.dart';
import 'package:todo_list_app/models/todoModel.dart';

class TodoController extends GetxController {
  var todos = <TodoModel>[].obs;
  late Box<TodoModel> todoBox;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    todoBox = Hive.box<TodoModel>(constants.instance.todosHive);
    todos.addAll(todoBox.values);
  }

  void addTodo(String _title) {
    final newTodo = TodoModel(title: _title);
    todos.add(newTodo);
    todoBox.add(newTodo);
  }

  void todoStatus(int index) {
    todos[index].isCompleted = !todos[index].isCompleted;
    todos[index].save(); // Update Hive data
    todos.refresh();
  }

  void deleteTodo(int index) {
    todoBox.deleteAt(index); // Remove from Hive
    todos.removeAt(index); //
  }
}
