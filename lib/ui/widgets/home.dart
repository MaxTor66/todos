import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:todos/domain/blocs/home_todos_events.dart';
import 'package:todos/domain/blocs/home_todos_states.dart';
import 'package:todos/domain/data_provider/data_todos_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/blocs/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
late final HomeBloc homeBloc;
@override
  void initState() {


  homeBloc = HomeBloc(GetIt.I<DataTodosProvider>());
  homeBloc.add(OnLoadHomePageEvent());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    PageController controller = PageController();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Todos'),
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          bloc: homeBloc,
          builder: (BuildContext context, state) {
            if (state is HomeLoadedSuccessState) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  physics: const ClampingScrollPhysics(),
                  controller: controller,
                  separatorBuilder: (context, index) => Container(
                    height: 0.3,
                    color: Colors.grey,
                  ),
                  itemCount: state.todos.listOfTodos.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                width: 24,
                                alignment: Alignment.center,
                                margin: const EdgeInsets.only(right: 6),
                                child: Text(
                                  state.todos.listOfTodos[index].id.toString(),
                                  style: const TextStyle(fontSize: 16),
                                )),
                            Expanded(
                                child: Text(
                              state.todos.listOfTodos[index].todo,
                              style: const TextStyle(fontSize: 16),
                            )),
                            const SizedBox(
                              width: 8,
                            ),
                            Container(
                                alignment: Alignment.centerRight,
                                child: state.todos.listOfTodos[index].completed !=
                                        true
                                    ? const Icon(Icons.close, color: Colors.red)
                                    : Icon(
                                        Icons.done,
                                        color: Colors.green,
                                      ))
                          ]),
                    );
                  },
                ),
              );
            }
            if (state is HomeLoadedErrorState) {
              return Center(
                child: Text(state.exception.toString()),
              );
            }

            return const Center(child: CircularProgressIndicator());
          },
        )
        );
  }
}
