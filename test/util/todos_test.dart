import 'package:flutter_test/flutter_test.dart';
import 'package:todos/domain/data_provider/data_todos_provider.dart';
import 'package:todos/domain/entity/todo.dart';
import 'package:todos/domain/entity/todos.dart';
main(){

  test("decodeTodosData from json", () async {
    String json='''{"todos":[{"id":1,"todo":"Do something nice for someone I care about","completed":true,"userId":26},{"id":2,"todo":"Memorize the fifty states and their capitals","completed":false,"userId":48}],"total":150,"skip":0,"limit":30}''';

    DataTodosProvider dataTodosProvider=DataTodosProvider();

    final todos=await dataTodosProvider.decodeTodosData(json);
    Todos testTodos=Todos([Todo(1, 'Do something nice for someone I care about', true, 26), Todo(2, 'Memorize the fifty states and their capitals', false, 48)], 0, 150, 30);
    expect(todos.listOfTodos.first.todo, equals(testTodos.listOfTodos.first.todo));
    //expect(todos.listOfTodos.first.todo==testTodos.listOfTodos.first.todo, true);


  }





  );


}