// ignore_for_file: no_leading_underscores_for_local_identifiers, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_app/controllers/constants.dart';
import 'package:todo_list_app/controllers/theme_controller.dart';
import 'package:todo_list_app/controllers/todo_controller.dart';
import 'package:todo_list_app/models/todoModel.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});
  final TextEditingController _TodoName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ThemeController _themecontroller = Get.find();
    TodoController _todoController = Get.find();

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "HI ${constants.instance.user_Name}",
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.blue,
          actions: [
            Obx(() => IconButton(
                  onPressed: () {
                    _themecontroller.toggleTheme();
                  },
                  icon: Icon(_themecontroller.IsDark.value
                      ? Icons.dark_mode
                      : Icons.light_mode),
                )),
          ],
          bottom: TabBar(
            labelColor: Colors.green, // Selected tab color
            unselectedLabelColor: Colors.red, // Unselected tab color
            indicator: BoxDecoration(
              color: Colors.green, // Green color for selected tab indicator
              borderRadius: BorderRadius.circular(10),
            ),
            tabs: const [
              Tab(
                child: Text(
                  "All Todos",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Tab(
                child: Text(
                  "Completed",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Tab(
                child: Text(
                  "In progress",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Tab(
                child: Text(
                  "Not Started",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
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
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      if (_TodoName.text.isNotEmpty) {
                        _todoController.addTodo(_TodoName.text);
                        _TodoName.clear();
                      }
                    },
                    child: const Text("Add TODO"),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Obx(
                () => TabBarView(
                  children: [
                    _buildTodoList(_todoController.todos, _todoController,
                        emptyImage: 'assets/addtask.jpg'),
                    _buildTodoList(
                        _todoController.todos
                            .where((todo) => todo.isCompleted)
                            .toList(),
                        _todoController,
                        emptyImage: 'assets/nothing.jpg'),
                    _buildTodoList(
                        _todoController.todos
                            .where((todo) =>
                                todo.isInProgress && !todo.isCompleted)
                            .toList(),
                        _todoController,
                        emptyImage: 'assets/nothing.jpg'),
                    _buildTodoList(
                        _todoController.todos
                            .where((todo) =>
                                !todo.isCompleted && !todo.isInProgress)
                            .toList(),
                        _todoController,
                        emptyImage: 'assets/nothing.jpg'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTodoList(List<TodoModel> todos, TodoController _todoControllerr,
      {required String emptyImage}) {
    if (todos.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(emptyImage, height: 200),
            const SizedBox(height: 20),
            const Text(
              "No Todos Here!",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
    } else {
      return ListView.builder(
        itemCount: todos.length,
        itemBuilder: (BuildContext context, index) {
          final _todo = todos[index];
          Color tileColor;
          bool _iscomplete = false;
          if (_todo.isCompleted) {
            _iscomplete = true;
            tileColor = Colors.green; // Completed todos are green
          } else if (_todo.isInProgress) {
            tileColor = Colors.blue; // In-progress todos are blue
          } else {
            tileColor = Colors.red; // Not started todos are red
          }
          return Card(
            color: tileColor.withOpacity(0.3),
            child: ListTile(
              title: Text(_todo.title),
              leading: Checkbox(
                value: _todo.isCompleted,
                onChanged: (value) {
                  _todoControllerr.todoStatus(index);
                },
              ),
              trailing: IconButton(
                onPressed: () {
                  _todoControllerr.deleteTodo(index);
                },
                icon: const Icon(Icons.delete),
              ),
              subtitle: Row(
                children: [
                  _iscomplete
                      ? const Text("Task Is Completed")
                      : const Text("In Progress"),
                  _iscomplete
                      ? Container()
                      : Switch(
                          value: _todo.isInProgress,
                          onChanged: (value) {
                            _todoControllerr.markInProgress(index);
                          },
                        ),
                ],
              ),
            ),
          );
        },
      );
    }
  }
}
