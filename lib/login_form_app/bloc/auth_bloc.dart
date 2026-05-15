import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthRequested>(_onAuthRequested);

    // sign out
    on<SignoutRequest>(_onSignoutRequest);
  }

  // @override
  // void onError(Object error, StackTrace stackTrace) {
  //   // TODO: implement onError
  //   super.onError(error, stackTrace);
  //   log('$error');
  // }

  // @override
  // void onChange(Change<AuthState> change) {
  //   super.onChange(change);
  //   log(' AuthState: $change');
  // }

  // @override
  // void onTransition(Transition<AuthEvent, AuthState> transition) {
  //   super.onTransition(transition);
  //   log(
  //     'Transition currentState: ${transition.currentState.runtimeType}, Transition Event:  ${transition.event.runtimeType}, Transition nextState: ${transition.nextState.runtimeType}',
  //   );
  // }

  void _onAuthRequested(AuthRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      if (event.email.isNotEmpty && event.password.isNotEmpty) {
        await Future.delayed(Duration(seconds: 1));
        emit(AuthSuccess(successMsg: 'Success ', userMail: event.email));
      } else {
        emit(AuthError(errorMsg: 'Something went Wrong'));
      }
    } catch (e) {
      emit(AuthError(errorMsg: e.toString()));
      // rethrow;
    }
  }

  void _onSignoutRequest(SignoutRequest event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await Future.delayed(Duration(seconds: 1));
      emit(AuthInitial());
    } catch (e) {
      emit(AuthError(errorMsg: e.toString()));
    }
  }
}
