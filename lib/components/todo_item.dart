import 'package:flutter/material.dart';

typedef OnTodoItemDismissedCallback = void Function();

class TodoItem extends StatelessWidget {
  final String title;
  final OnTodoItemDismissedCallback onTodoItemDismissed;

  const TodoItem({ Key? key, required this.title, required this.onTodoItemDismissed }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(title),
      background: Container(
        color: Colors.red,
      ),
      child: ListTile(
        leading: const Icon(Icons.check_box_outline_blank),
        title: Text(title),
      ),
      onDismissed: (direction) {
        onTodoItemDismissed();
      },
    );
    
  }

}