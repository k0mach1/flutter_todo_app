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
    required this.description
  });
}
