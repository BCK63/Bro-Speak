part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthInitialtEvent extends AuthEvent{}
class LoginButtonPressedEvent extends AuthEvent{
  final String name ;
  final String batch;
  final String email;
  final String password;

  const LoginButtonPressedEvent(this.name, this.batch, this.email, this.password);
}

