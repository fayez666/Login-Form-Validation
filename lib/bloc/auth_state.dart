part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthSuccess extends AuthState {
  final String message;

  AuthSuccess({
    required this.message ,
  });
}

final class AuthFailure extends AuthState {
  final String errorMessage;

  AuthFailure({
    required this.errorMessage,
  });
}

final class AuthInProgress extends AuthState {}