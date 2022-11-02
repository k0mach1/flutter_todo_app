import 'package:flutter/material.dart';
import 'package:flutter_todo_app/components/todo_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Machida Todo App'),
      ),
      body: Container(
        child: ListView(
          children: [
            TodoItem(title: 'TODO 1'),
            TodoItem(title: 'TODO 2'),
            TodoItem(title: 'TODO 3'),
          ],
        ),
      ),
      floatingActionButton:  FloatingActionButton.extended(
        onPressed: () { return; },
        icon: const Icon(Icons.add),
        label: Text('Add Todo'),
      ),
    );
  }
}