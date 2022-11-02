import 'package:flutter/material.dart';
import 'package:flutter_todo_app/components/add_todo_modal.dart';
import 'package:flutter_todo_app/components/todo_list.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {

  List<String> _todos = ['TODO 1', 'TODO 2', 'TODO 3'];

  void showAddTodoModal() async {
    var result = await showDialog(
      context: context,
      builder: (_) { return AddTodoModal(); },
    );
    setState(() {
      addTodo(result);
    });
  }

  void addTodo(Object? result) {
    String todo = (result ?? 'null') as String;
    if (todo.isNotEmpty) {
      _todos.add(todo);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Machida Todo App'),
      ),
      body: TodoList(todos: _todos),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: showAddTodoModal,
        icon: const Icon(Icons.add),
        label: Text('Add Todo'),
      ),
    );
  }
}