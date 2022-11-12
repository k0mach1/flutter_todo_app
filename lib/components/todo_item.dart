import 'package:flutter/material.dart';
import 'package:flutter_todo_app/models/todo.dart';

typedef OnTodoItemDismissedCallback = void Function();

class TodoItem extends StatefulWidget {
  final Todo todo;
  final OnTodoItemDismissedCallback onTodoItemDismissed;

  const TodoItem({
    super.key,
    required this.todo,
    required this.onTodoItemDismissed });

  @override
  State<StatefulWidget> createState() {
    return TodoItemState();
  }
}

class TodoItemState extends State<TodoItem> {

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(widget.todo.title),
      background: Container(
        color: Colors.red,
      ),
      child: ListTile(
        leading: IconButton(
          icon: widget.todo.getIcon(),
          onPressed: () {
            switch (widget.todo.status) {
              case TodoStatus.notYet:
                setState(() {
                  widget.todo.setStatus(TodoStatus.done);
                });
                break;
              case TodoStatus.done:
                setState(() {
                  widget.todo.setStatus(TodoStatus.notYet);
                });
                break;
            }
          }
        ),
        title: Text(widget.todo.title),
      ),
      onDismissed: (direction) {
        widget.onTodoItemDismissed();
      },
    );
  }

}