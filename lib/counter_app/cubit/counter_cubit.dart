import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() {
    log('Before: $state');
    emit(state + 1);
    log('After: $state');
  }

  void decrement() {
    if (state == 0) {
      emit(state);
    } else {
      log('Before: $state');
      emit(state - 1);
      log('After: $state');
    }
  }
}
