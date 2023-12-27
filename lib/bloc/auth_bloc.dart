import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequested>(_onAuthLoginRequested);

    on<AuthLogoutRequested>(_onAuthLogoutRequested);
  }

  FutureOr<void> _onAuthLogoutRequested(
      AuthLogoutRequested event, Emitter<AuthState> emit) async {
    emit(AuthInProgress());
    try {
      await Future.delayed(const Duration(seconds: 2), () {
        return emit(AuthInitial());
      });
    } catch (e) {
      emit(AuthFailure(errorMessage: e.toString()));
    }
  }

  FutureOr<void> _onAuthLoginRequested(
      AuthLoginRequested event, Emitter<AuthState> emit) async {
    emit(AuthInProgress());
    try {
      final email = event.email;
      final password = event.password;
      if (password.length < 6) {
        return emit(AuthFailure(
            errorMessage: 'Password must be at least 6 characters long.'));
      }

      await Future.delayed(const Duration(seconds: 2), () {
        return emit(AuthSuccess(message: '$email - $password'));
      });
    } catch (e) {
      emit(AuthFailure(errorMessage: e.toString()));
    }
  }
}
