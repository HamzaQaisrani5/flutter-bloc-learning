import 'package:fl_bloc/todo_list/cubit/task_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  // final taskCubit = TaskCubit();
  @override
  Widget build(BuildContext context) {
    // final taskCubit = BlocProvider.of<TaskCubit>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Todo List')),
      body: BlocBuilder<TaskCubit, List<String>?>(
        // bloc: taskCubit,
        builder: (_, state) {
          if (state!.isEmpty) {
            return Center(child: Text('Not tasks yet. . . '));
          }
          return ListView.builder(
            itemCount: state.length,
            itemBuilder: (_, index) {
              final task = state[index];
              return ListTile(title: Text(task));
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add-todo');
        },
        tooltip: 'Add Todo',
        child: const Icon(Icons.add),
      ),
    );
  }
}
