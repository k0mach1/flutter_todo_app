import 'package:flutter/material.dart';
import 'package:flutter_todo_app/components/todo_group_item.dart';
import 'package:flutter_todo_app/models/todo_group.dart';

typedef OnTodoGroupItemTappedCallback = void Function(TodoGroup todoGroup);

class TodoGroupList extends StatelessWidget {
  final List<TodoGroup> todoGroups;
  final OnTodoGroupItemTappedCallback onItemTapped;

  const TodoGroupList({
    Key? key,
    required this.todoGroups,
    required this.onItemTapped
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todoGroups.length,
      itemBuilder: (context, index) {
        var todoGroup = todoGroups.elementAt(index);
        return TodoGroupItem(
          todoGroup: todoGroup,
          onTapped: (TodoGroup todoGroup) {
            onItemTapped(todoGroup);
          },
        );
      },
    );
  }

}