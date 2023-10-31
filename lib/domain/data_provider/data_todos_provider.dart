import 'package:dio/dio.dart';
import 'package:todos/domain/entity/todos_json_decoder.dart';
import '../entity/todos.dart';

class DataTodosProvider {

  final dio = Dio();
  static const String url = "https://dummyjson.com/todos";

  Future<String> getHttp() async {
    String jsonString = "";
    try {
      final responseDio = await dio.get(
        url,
        queryParameters: {},
      );

      jsonString = responseDio.toString();

    } catch (e) {
      throw 'There is no connection';
    }

    return jsonString;
  }

  Future<Todos> decodeTodosData(String loadedTodos) async {
    JsonTodosDecoder decoder = JsonTodosDecoder();
    var todos = decoder.decode(loadedTodos);
    return todos;
  }
}
