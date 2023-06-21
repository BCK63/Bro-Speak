import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bro_speak/application/bloc/repository/auth_repo.dart';
import 'package:equatable/equatable.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthRepository repo;
  AuthBloc(this.repo) : super(AuthInitial()) {
    on<AuthInitialtEvent>(authInitialtEvent);
    on<LoginButtonPressedEvent>(loginButtonPressedEvent);
  }

  FutureOr<void> authInitialtEvent(
      AuthInitialtEvent event, Emitter<AuthState> emit) {
    emit(AuthInitial());
  }

  FutureOr<void> loginButtonPressedEvent(
      LoginButtonPressedEvent event, Emitter<AuthState> emit) async {
    emit(SignUpLoadingState());
    var response = await repo.signUpService(
        event.email, event.name, event.password, event.batch);

    if (response == 'success') {
     
      emit(UserSignUpSuccessState());
       emit(AuthSuccessActionState());
    } else if(response == "The request returned an invalid status code of 400."){
      emit(AuthErrorActionState());
    }
  }
}
