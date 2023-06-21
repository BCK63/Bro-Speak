part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthInitialEvent extends AuthEvent {}

class SignUpButtonPressedEvent extends AuthEvent {
  final String name;
  final String batch;
  final String email;
  final String password;

  const SignUpButtonPressedEvent(
      this.name, this.batch, this.email, this.password);
}

class LogInButtonPressedEvent extends AuthEvent {
  final String email;
  final String password;

  const LogInButtonPressedEvent(this.email, this.password);
}
