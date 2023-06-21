import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bro_speak/application/repository/auth_repo.dart';
import 'package:equatable/equatable.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthRepository repo;
  AuthBloc(this.repo) : super(AuthInitial()) {
    on<AuthInitialEvent>(authInitialEvent);
    on<SignUpButtonPressedEvent>(signUpButtonPressedEvent);

    on<LogInButtonPressedEvent>(logInButtonPressedEvent);
  }

  FutureOr<void> authInitialEvent(
      AuthInitialEvent event, Emitter<AuthState> emit) {
    emit(AuthInitial());
  }

  FutureOr<void> signUpButtonPressedEvent(
      SignUpButtonPressedEvent event, Emitter<AuthState> emit) async {
    emit(SignUpLoadingState());
    var response = await repo.signUpService(
        event.email, event.name, event.password, event.batch);

    if (response == 'success') {
      emit(UserSignUpSuccessState());
      emit(SignUpSuccessActionState());
    } else if (response ==
        "The request returned an invalid status code of 400.") {
      emit(AuthErrorActionState());
    }
  }

  FutureOr<void> logInButtonPressedEvent(
      LogInButtonPressedEvent event, Emitter<AuthState> emit) async {
    emit(LogInLoadingState());
    var response = await repo.logInServices(
      event.email,
      event.password,
    );

    if (response == "success") {
      emit(LogInSuccessState());
      emit(LogInSuccessActionState());
    } else if (response == "User not found") {
      emit(LogInErrorState());
    } else if (response == "Invalid email or password") {
      emit(LogInErrorState());
    }
  }
}
