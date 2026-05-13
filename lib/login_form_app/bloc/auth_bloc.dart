import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthRequested>((event, emit) async {
      try {
        if (event.password.length >= 6 &&
            event.email.isNotEmpty &&
            event.password.isNotEmpty) {
          await Future.delayed(Duration(seconds: 1), () {
            emit(AuthSuccess(successMsg: 'Success '));
          });
          // emit(AuthSuccess(successMsg: 'Login Completed'));
        } else {
          emit(AuthError(errorMsg: 'Something went Wrong'));
        }
      } catch (e) {
        emit(AuthError(errorMsg: e.toString()));
      }
    });
  }
}
