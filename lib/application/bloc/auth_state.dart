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

class AuthSuccessActionState extends AuthActionState {}

class AuthErrorActionState extends AuthActionState {}
