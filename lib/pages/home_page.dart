import 'package:flutter/material.dart';
import 'package:flutter_todo_app/models/todo_group.dart';
import 'package:flutter_todo_app/pages/todo_group_page.dart';

import '../components/todo_group_list.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {

  final List<TodoGroup> _todoGroups = [
    TodoGroup.createSampleInstance(Icon(Icons.sunny), 'Today'),
    TodoGroup.createSampleInstance(Icon(Icons.star), 'Important'),
    TodoGroup.createSampleInstance(Icon(Icons.calendar_month), 'Scheduled')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Machida Todo App'),
      ),
      body: TodoGroupList(
        todoGroups: _todoGroups,
        onItemTapped: (TodoGroup todoGroup) {
          Navigator.push(
            context,
              MaterialPageRoute(
                  builder: (context) => TodoGroupPage(todoGroup: todoGroup)
              )
          );
        },
      ),
    );
  }
}