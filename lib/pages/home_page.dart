import 'package:flutter/material.dart';
import 'package:flutter_todo_app/components/todo_list.dart';

class HomePage extends StatelessWidget {

  List<String> todos = ['TODO 1', 'TODO 2', 'TODO 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Machida Todo App'),
      ),
      body: TodoList(todos: todos),
      floatingActionButton:  FloatingActionButton.extended(
        onPressed: () { return; },
        icon: const Icon(Icons.add),
        label: Text('Add Todo'),
      ),
    );
  }
}