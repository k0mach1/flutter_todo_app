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

  static DateTime defaultDeadline() {
    DateTime now = DateTime.now();
    return DateTime(now.year, now.month, now.day + 1);
  }

  String getDeadlineString() {
    DateFormat format = DateFormat('MM/dd');
    return format.format(deadline);
  }
}
