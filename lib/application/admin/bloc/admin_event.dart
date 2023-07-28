part of 'admin_bloc.dart';

abstract class AdminEvent extends Equatable {
  const AdminEvent();

  @override
  List<Object> get props => [];
}

class AdminInitialEvent extends AdminEvent {}

class AdminInviteConfirmButtonClickedEvent extends AdminEvent {
  final String email;
  const AdminInviteConfirmButtonClickedEvent(
    this.email,
  );
}
