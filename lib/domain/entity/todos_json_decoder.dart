import 'dart:convert';
import 'package:todos/domain/entity/todos.dart';

class JsonTodosDecoder {
  Todos decode(String jsonString) {
    print(jsonString);
    final Map<String, dynamic> json = jsonDecode(jsonString);
    final todos = Todos.fromJson(json);
    return todos;
  }
}
