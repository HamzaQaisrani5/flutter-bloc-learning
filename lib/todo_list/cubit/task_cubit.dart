import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class TaskCubit extends Cubit<List<String>?> {
  TaskCubit() : super([]);

  // List<String> tasks = [];
  void addTask({required String task}) {
    if (task.isEmpty) {
      addError('Fields can\'t be empty');
      return;
    }
    // log('Tasks List before: $state');
    emit([...state!, task]);
    // log('Tasks List after: $state');
  }

  @override
  void onChange(Change<List<String>?> change) {
    super.onChange(change);
    print('Change<List<String>?>: $change');
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    log('$error');
  }
}
