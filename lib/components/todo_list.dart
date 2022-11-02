import 'package:flutter/material.dart';
import 'package:flutter_todo_app/components/todo_item.dart';


class TodoList extends StatelessWidget {
  final List<String> todos;

  const TodoList({ Key? key, required this.todos }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        var todo = todos.elementAt(index);
        return TodoItem(title: todo);
      },
    );
  }

}