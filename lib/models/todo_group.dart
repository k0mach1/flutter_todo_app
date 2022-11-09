import 'package:flutter/cupertino.dart';
import 'package:flutter_todo_app/models/todo.dart';

class TodoGroup {
  Icon icon;
  String title;
  List<Todo> todos;

  TodoGroup({ required this.icon, required this.title, required this.todos });
}