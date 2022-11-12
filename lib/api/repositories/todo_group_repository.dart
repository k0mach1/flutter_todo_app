import 'dart:convert';

import 'package:flutter_todo_app/api/apiclient.dart';
import 'package:flutter_todo_app/models/todo.dart';

abstract class TodoGroupRepository {
  Future<List<Todo>> getTodos();
}

class TodoGroupRepositoryImpl implements TodoGroupRepository {
  TodoGroupRepositoryImpl({ required this.apiClient });

  final ApiClient apiClient;

  static const endPoint = '/';

  @override
  Future<List<Todo>> getTodos() async {
    final responseBody = await apiClient.get(endPoint);
    try {
      final decodedJson = json.decode(responseBody) as List<dynamic>;
      return decodedJson
          .map((dynamic itemJson) =>
          Todo.fromJson(itemJson as Map<String, dynamic>))
          .toList();
    } on Exception catch (error) {
      throw Exception('Json decode error: $error');
    }
  }
}