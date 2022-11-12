import 'package:flutter/material.dart';
import 'package:flutter_todo_app/models/todo.dart';
import 'package:flutter_todo_app/components/add_todo_modal.dart';
import 'package:flutter_todo_app/components/todo_list.dart';
import 'package:flutter_todo_app/models/todo_group.dart';

class TodoGroupPage extends StatefulWidget {
  TodoGroup todoGroup;

  TodoGroupPage({ super.key,  required this.todoGroup });

  @override
  State<StatefulWidget> createState() {
    return TodoGroupPageState();
  }
}

class TodoGroupPageState extends State<TodoGroupPage> {

  void showAddTodoModal() async {
    var result = await showDialog(
      context: context,
      builder: (_) { return AddTodoModal(); },
    );
    setState(() {
      addTodo(result);
    });
  }

  void addTodo(Object? result) {
    if (result == null) { return; }

    try {
      Todo todo = result as Todo;
      widget.todoGroup.add(todo);
    } catch(e) {
      debugPrint(e.toString());
    }
  }

  void removeTodo(int index) {
    widget.todoGroup.removeAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Machida Todo App'),
      ),
      body: TodoList(
        todos: widget.todoGroup.todos,
        onTodoItemDismissed: (int index) {
          setState(() {
            removeTodo(index);
          });
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: showAddTodoModal,
        icon: const Icon(Icons.add),
        label: const Text('Add Todo'),
      ),
    );
  }
}