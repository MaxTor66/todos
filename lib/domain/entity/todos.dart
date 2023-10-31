import 'package:json_annotation/json_annotation.dart';
import 'todo.dart';
part 'todos.g.dart';

@JsonSerializable(explicitToJson: true)
class Todos {
  List<Todo> listOfTodos;
  int total;
  int skip;
  int limit;

  Todos(this.listOfTodos, this.skip, this.total, this.limit);

  factory Todos.fromJson(Map<String, dynamic> json) => _$TodosFromJson(json);
}
