import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'domain/data_provider/data_todos_provider.dart';
import 'ui/my_app.dart';

void main() async {
  GetIt.instance.registerSingleton<DataTodosProvider>(DataTodosProvider());
  GetIt.I<DataTodosProvider>().dio;
  runApp(const MyApp());
}
