import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum TodoStatus {
  notYet,
  done
}

class Todo {
  String title;
  TodoStatus status;
  DateTime deadline;
  bool isStared;
  String? description;

  Todo({
    required this.title,
    required this.status,
    required this.deadline,
    required this.isStared,
    this.description
  });

  static Todo createEmpty() {
    return Todo(
        title: '',
        status: TodoStatus.notYet,
        deadline: defaultDeadline(),
        isStared: false);
  }

  static Todo fromJson(Map<String, dynamic> json) {
    return Todo(
      title: json['title'],
      status: TodoStatus.values.byName(json['status']),
      deadline: DateTime.parse(json['deadline']),
      isStared: json['is_stared']
    );
  }

  static DateTime defaultDeadline() {
    DateTime now = DateTime.now();
    return DateTime(now.year, now.month, now.day + 1);
  }

  String getDeadlineString() {
    DateFormat format = DateFormat('MM/dd');
    return format.format(deadline);
  }

  Icon getIcon() {
    switch(status) {
      case TodoStatus.notYet:
        return const Icon(Icons.check_box_outline_blank);
      case TodoStatus.done:
        return const Icon(Icons.check_box);
    }
  }

  void setStatus(TodoStatus status) {
    this.status = status;
  }
}
