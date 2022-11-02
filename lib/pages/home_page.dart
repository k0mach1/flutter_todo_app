import 'package:flutter/material.dart';

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
            ListTile(
              leading: const Icon(Icons.check_box_outline_blank),
              title: Text('Todo 1'),
            ),
            ListTile(
              leading: const Icon(Icons.check_box_outline_blank),
              title: Text('Todo 2'),
            ),
            ListTile(
              leading: const Icon(Icons.check_box_outline_blank),
              title: Text('Todo 3'),
            )
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