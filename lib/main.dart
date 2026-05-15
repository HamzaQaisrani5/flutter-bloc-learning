import 'package:fl_bloc/app_bloc_observer.dart';
import 'package:fl_bloc/counter_app/bloc/counter_bloc.dart';
import 'package:fl_bloc/counter_app/cubit/counter_cubit.dart';
import 'package:fl_bloc/login_form_app/bloc/auth_bloc.dart';
import 'package:fl_bloc/login_form_app/pages/login_page.dart';
import 'package:fl_bloc/todo_list/add_todo_page.dart';
import 'package:fl_bloc/todo_list/cubit/task_cubit.dart';
import 'package:fl_bloc/weather_app/data/data_source/weather_api.dart';
import 'package:fl_bloc/weather_app/data/repos/api_data_handling.dart';
import 'package:fl_bloc/weather_app/presentation/bloc/weather_bloc.dart';
import 'package:fl_bloc/weather_app/presentation/screens/weather_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => ApiDataHandling(WeatherApi()),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => CounterCubit()),
          BlocProvider(create: (_) => CounterBloc()),
          BlocProvider(create: (_) => TaskCubit()),
          BlocProvider(create: (_) => AuthBloc()),
          BlocProvider(create: (_)=> WeatherBloc(context.read<ApiDataHandling>()))
        ],
      
        child: MaterialApp(
          initialRoute: '/',
          routes: {'/': (_) => WeatherScreen(), '/add-todo': (_) => AddTodoPage()},
          title: 'Flutter Demo',
          theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      
          // home: TodoList()  //const MyHomePage(title: 'Flutter Demo Home Page'),
        ),
      ),
    );
  }
}
