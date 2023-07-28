part of 'admin_bloc.dart';

abstract class AdminState extends Equatable {
  const AdminState();
  
  @override
  List<Object> get props => [];
}
abstract class AdminActonState extends AdminState {}

class AdminInitial extends AdminState {}

class AdminInvitationLoadingState extends AdminState{}

class AdminInvitatinoSuccessState extends AdminState{}
class AdminInvitatinoSuccessActionState extends AdminActonState{}
class AdminInvitation2FailedState extends AdminActonState{}
class AdminInvitation1FailedState extends AdminActonState{}


