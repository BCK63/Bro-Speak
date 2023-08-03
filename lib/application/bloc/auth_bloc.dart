import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bro_speak/application/repository/auth_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthRepository repo;
  FlutterSecureStorage storage = const FlutterSecureStorage();
  bool? isAuthenticate;
  String? accessToken;
  AuthBloc(this.repo) : super(AuthInitial()) {
    on<AuthInitialEvent>(authInitialEvent);
    on<SignUpButtonPressedEvent>(signUpButtonPressedEvent);
    on<AdminSignUpButtonPressedEvent>(adminSignUpButtonPressedEvent);
    on<LogInButtonPressedEvent>(logInButtonPressedEvent);
    on<AdminLogInButtonPressedEvent>(adminLogInButtonPressedEvent);
    on<UserLoginEvent>(userLoginEvent);
    // on<AdminLoginEvent>(userLoginEvent);
    on<UserLogoutEvent>(userLogoutEvent);
    checkAccessToken();
  }

  FutureOr<void> authInitialEvent(
      AuthInitialEvent event, Emitter<AuthState> emit) {
    emit(AuthInitial());
  }

    FutureOr<void> adminSignUpButtonPressedEvent(AdminSignUpButtonPressedEvent event, Emitter<AuthState> emit) async{
    emit(AdminSignUpLoadingState());
    var response = await repo.adminSignUpServices(event.name, event.email, event.password, event.token);
    if(response == 'admin signup success'){
      emit(AdminSignUpSuccessActionState());
      emit(AdminSignUpSuccessState());
    }else if(response == 'Email Not Matching with Invited Mail'){
      emit(AdminError1ActionState());
    }else{
      emit(AdminError2ActionState());
    }
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
    } else if (response ==
        "The request returned an invalid status code of 404.") {
      emit(LogInErrorState());
    } else if (response ==
        "The request returned an invalid status code of 401.") {
      emit(LoginErrorActionState());
    }
  }

  FutureOr<void> adminLogInButtonPressedEvent(
      AdminLogInButtonPressedEvent event, Emitter<AuthState> emit) async {
    emit(AdminLogInLoadingState());
    var response = await repo.adminLogInServices(
      event.email,
      event.password,
    );

    if (response == "admin login success") {
      emit(AdminLogInSuccessActionState());
      await Future.delayed(const Duration(seconds: 1));
      emit(AdminLogInSuccessState());
    } else if (response ==
        "The request returned an invalid status code of 404.") {
      emit(AdminLogInErrorState());
    } else if (response ==
        "The request returned an invalid status code of 401.") {
      emit(AdminLoginErrorActionState());
    }
  }

  FutureOr<void> userLoginEvent(
      UserLoginEvent event, Emitter<AuthState> emit) async {
    isAuthenticate = true;
    accessToken = await storage.read(key: "access_token");
  }

  FutureOr<void> userLogoutEvent(
      UserLogoutEvent event, Emitter<AuthState> emit) async {
    isAuthenticate = false;
    storage.delete(key: "access_token");
    accessToken = null;
  }

  Future<void> checkAccessToken() async {
    accessToken = await storage.read(key: "access_token");
    if (accessToken != null) {
      emit(UserAuthenticated());
    } else {
      emit(UserUnAuthenticated());
    }
  }


}
