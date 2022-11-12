import 'package:flutter/cupertino.dart';
import 'package:flutter_todo_app/models/todo.dart';

class TodoGroup {
  Icon icon;
  String title;
  List<Todo> todos;

  TodoGroup({ required this.icon, required this.title, required this.todos });

  void add(Todo todo) {
    todos.add(todo);
  }

  void removeAt(int index) {
    todos.removeAt(index);
  }

  bool isEmpty() {
    return todos.isEmpty;
  }

  static TodoGroup createSampleInstance(Icon icon, String title) {
    return TodoGroup(
        icon: icon,
        title: title,
        todos:  [
          Todo(
              title: 'Todo 1',
              status: TodoStatus.notYet,
              deadline: DateTime.now(),
              isStared: true),
          Todo(
              title: 'Todo 2',
              status: TodoStatus.notYet,
              deadline: DateTime.now(),
              isStared: true),
          Todo(
              title: 'Todo 3',
              status: TodoStatus.notYet,
              deadline: DateTime.now(),
              isStared: true),
        ]);
  }
}