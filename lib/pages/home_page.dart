import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Machida Todo App'),
      ),
      floatingActionButton:  FloatingActionButton.extended(
        onPressed: () { return; },
        icon: const Icon(Icons.add),
        label: Text('Add Todo'),
      ),
    );
  }
}