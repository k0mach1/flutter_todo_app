import 'package:flutter/material.dart';
import 'package:flutter_todo_app/models/todo.dart';
import 'package:flutter_todo_app/components/add_todo_modal.dart';
import 'package:flutter_todo_app/components/todo_list.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {

  final List<Todo> _todos = [
    Todo(
        title: 'Todo 1',
        status: TodoStatus.notYet,
        deadline: DateTime.now(),
        isStared: true),
    Todo(
        title: 'Todo 2',
        status: TodoStatus.notYet,
        deadline: DateTime.now(),
        isStared: true),
    Todo(
        title: 'Todo 3',
        status: TodoStatus.notYet,
        deadline: DateTime.now(),
        isStared: true),
  ];

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
      _todos.add(todo);
    } catch(e) {
      debugPrint(e.toString());
    }
  }

  void removeTodo(int index) {
    _todos.removeAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Machida Todo App'),
      ),
      body: TodoList(
        todos: _todos,
        onTodoItemDismissed: (int index) {
          setState(() {
            removeTodo(index);
          });
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: showAddTodoModal,
        icon: const Icon(Icons.add),
        label: Text('Add Todo'),
      ),
    );
  }
}