part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthSuccess extends AuthState {
  final String successMsg;

  AuthSuccess({required this.successMsg});
}

final class AuthError extends AuthState {
  final String errorMsg;

  AuthError({required this.errorMsg});

}
