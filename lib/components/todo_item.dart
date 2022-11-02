import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  final String title;

  const TodoItem({ Key? key, required this.title }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.check_box_outline_blank),
      title: Text(title),
    );
  }

}