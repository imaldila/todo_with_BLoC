import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/blocs/todos/todos_bloc.dart';

import 'models/todos_model.dart';
import 'screens/home_screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => TodosBloc()
              ..add(LoadTodos(todos: [
                Todo(
                  id: '1',
                  task: 'Sample To Do 1',
                  description: 'This is todo Test 1',
                ),
                Todo(
                  id: '2',
                  task: 'Sample To Do 2',
                  description: 'This is todo Test 2',
                ),
              ]))),
      ],
      child: MaterialApp(
        title: 'BloC Pattern - Todos',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: const Color(0xFF000A1F),
          appBarTheme: const AppBarTheme(
            color: Color(0xFF000A1F),
          ),
          // elevatedButtonTheme: ElevatedButtonThemeData(
          //   style: ElevatedButton.styleFrom(
          //     primary: const Color(0xFF000A1F)
          //   )
          // )
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
