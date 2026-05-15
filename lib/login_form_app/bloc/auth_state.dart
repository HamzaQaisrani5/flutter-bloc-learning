part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState{}

final class AuthSuccess extends AuthState {
   String successMsg;
  final String? userMail;

  AuthSuccess({required this.successMsg, this.userMail});
}

final class AuthError extends AuthState {
  final String errorMsg;

  AuthError({required this.errorMsg});
}
