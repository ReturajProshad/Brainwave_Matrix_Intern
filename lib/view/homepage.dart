import 'package:flutter/material.dart';
import 'package:todo_list_app/controllers/constants.dart';
import 'package:todo_list_app/controllers/theme_controller.dart';
import 'package:get/get.dart';
import 'package:todo_list_app/controllers/todo_controller.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});
  TextEditingController _TodoName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ThemeController _themecontroller = Get.find();
    TodoController _todoController = Get.find();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("HI ${constants.instance.user_Name}"),
        backgroundColor: Colors.blue,
        actions: [
          Obx(() => IconButton(
                onPressed: () {
                  _themecontroller.toggleTheme();
                },
                icon: Icon(_themecontroller.IsDark.value
                    ? Icons.dark_mode
                    : Icons.light_mode),
              ))
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _TodoName,
                    decoration: InputDecoration(
                      labelText: "Enter Todo Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: ElevatedButton(
                    onPressed: () {
                      if (!_TodoName.text.isEmpty) {
                        _todoController.addTodo(_TodoName.text);
                        _TodoName.clear();
                      }
                    },
                    child: Text("Add TODO"),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() => ListView.builder(
                itemCount: _todoController.todos.length,
                itemBuilder: (BuildContext context, index) {
                  final _todo = _todoController.todos[index];
                  return Card(
                    child: ListTile(
                      title: Text(_todo.title),
                      leading: Checkbox(
                        value: _todo.isCompleted,
                        onChanged: (value) {
                          _todoController.todoStatus(index);
                        },
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          _todoController.deleteTodo(index);
                        },
                        icon: Icon(Icons.delete),
                      ),
                    ),
                  );
                })),
          ),
        ],
      ),
    );
  }
}
