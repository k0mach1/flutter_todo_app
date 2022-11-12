import 'package:flutter/material.dart';
import 'package:flutter_todo_app/models/todo_group.dart';

typedef OnTodoGroupItemTappedCallback = void Function(TodoGroup todoGroup);

class TodoGroupItem extends StatelessWidget {
  final TodoGroup todoGroup;
  final OnTodoGroupItemTappedCallback onTapped;

  const TodoGroupItem({
    Key? key,
    required this.todoGroup,
    required this.onTapped
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: todoGroup.icon,
      title: Text(todoGroup.title),
      onTap: () {
        onTapped(todoGroup) ;
      },
    );
  }
}