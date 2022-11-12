import 'package:flutter/material.dart';
import 'package:flutter_todo_app/components/todo_item.dart';
import 'package:flutter_todo_app/models/todo.dart';

typedef OnTodoItemDismissedCallback = void Function(int index);

class TodoList extends StatelessWidget {
  final List<Todo> todos;
  final OnTodoItemDismissedCallback onTodoItemDismissed;

  const TodoList({ Key? key, required this.todos, required this.onTodoItemDismissed }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        var todo = todos.elementAt(index);
        return TodoItem(
          title: todo.title,
          onTodoItemDismissed: () {
            onTodoItemDismissed(index);
          },);
      },
    );
  }

}