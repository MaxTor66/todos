import '../data_provider/data_todos_provider.dart';
import 'home_todos_events.dart';
import 'home_todos_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvents, HomeState> {
  HomeBloc(this.dataTodosProvider) : super(HomeInitial()) {
    on<OnLoadHomePageEvent>((event, emit) async {
      try {
        var jsonTodosFromServer = await dataTodosProvider.getHttp();
        final todos = await dataTodosProvider.decodeTodosData(jsonTodosFromServer);
        emit(HomeLoadedSuccessState(todos));
      } catch (e) {
        emit(HomeLoadedErrorState(exception: e));
      }
    });
  }

  DataTodosProvider dataTodosProvider;
}
