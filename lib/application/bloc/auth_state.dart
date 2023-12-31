part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

abstract class AuthActionState extends AuthState {}

class AuthInitial extends AuthState {}

class SignUpLoadingState extends AuthState {}

class UserSignUpSuccessState extends AuthState {}

class SignUpErrorsState extends AuthState {
  final String message;

  const SignUpErrorsState(this.message);
}

class SignUpSuccessActionState extends AuthActionState {}

class LogInLoadingState extends AuthActionState {}

class LogInSuccessState extends AuthState {}

class LogInSuccessActionState extends AuthActionState {}

class LogInErrorState extends AuthActionState {}

class LoginErrorActionState extends AuthActionState {}

class AuthErrorActionState extends AuthActionState {}

class UserAuthenticated extends AuthState {}

class UserUnAuthenticated extends AuthState {}

class AdminLogInSuccessState extends AuthState {}
class AdminLogInLoadingState extends AuthActionState {}

class AdminLogInSuccessActionState extends AuthActionState {}

class AdminLogInErrorState extends AuthActionState {}

class AdminLoginErrorActionState extends AuthActionState {}

// admin

class AdminSignUpSuccessState extends AuthState {}

class AdminSignUpSuccessActionState extends AuthActionState {}

class AdminError1ActionState extends AuthActionState {}
class AdminError2ActionState extends AuthActionState {}


class AdminSignUpLoadingState extends AuthState {}

// class AuthErrorActionState extends AuthActionState {}
