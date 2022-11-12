import 'package:flutter/material.dart';
import 'package:flutter_todo_app/api/apiclient.dart';
import 'package:flutter_todo_app/api/repositories/todo_group_repository.dart';
import 'package:flutter_todo_app/components/todo_group_empty_view.dart';
import 'package:flutter_todo_app/models/todo.dart';
import 'package:flutter_todo_app/models/todo_group.dart';
import 'package:flutter_todo_app/components/add_todo_modal.dart';
import 'package:flutter_todo_app/components/todo_list.dart';

class TodoGroupPage extends StatefulWidget {
  TodoGroup todoGroup;
  List<Todo> todos = [];

  TodoGroupPage({ super.key,  required this.todoGroup });

  @override
  State<StatefulWidget> createState() {
    return TodoGroupPageState();
  }
}

class TodoGroupPageState extends State<TodoGroupPage> {
  
  TodoGroupRepository todoGroupRepository = TodoGroupRepositoryImpl(apiClient: ApiClientImpl());

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
        title: Text(widget.todoGroup.title),
      ),
      body: widget.todos.isEmpty ? const TodoGroupEmptyView() : TodoList(
        todos: widget.todos,
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

  @override
  void initState() {
    getTodos();

    super.initState();
  }

  void getTodos() async {
    List<Todo> fetchedTodos = await todoGroupRepository.getTodos();

    setState(() {
      widget.todos = fetchedTodos;
    });
  }
}