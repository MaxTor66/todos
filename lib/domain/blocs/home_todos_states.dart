import '../entity/todos.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadedSuccessState extends HomeState {
  Todos todos;

  HomeLoadedSuccessState(this.todos);
}

class HomeLoadingSuccessState extends HomeState {}

class HomeLoadedErrorState extends HomeState {
  final Object? exception;

  HomeLoadedErrorState({this.exception});
}
