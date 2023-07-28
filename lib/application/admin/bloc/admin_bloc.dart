import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bro_speak/application/admin/repository/admin_repository.dart';
import 'package:equatable/equatable.dart';

part 'admin_event.dart';
part 'admin_state.dart';

class AdminBloc extends Bloc<AdminEvent, AdminState> {
  AdminRepository adminRepo;
  AdminBloc(this.adminRepo) : super(AdminInitial()) {
    on<AdminInitialEvent>(authInitialEvent);
    on<AdminInviteConfirmButtonClickedEvent>(adminInviteConfirmButtonClicked);
   
  }

  FutureOr<void> authInitialEvent(
      AdminInitialEvent event, Emitter<AdminState> emit) {
    emit(AdminInitial());
  }

  FutureOr<void> adminInviteConfirmButtonClicked(
      AdminInviteConfirmButtonClickedEvent event, Emitter<AdminState> emit) async {
    emit(AdminInvitationLoadingState());
    final response = await adminRepo.adminInvitationService(event.email);
    if(response == 'success'){
      emit(AdminInvitatinoSuccessState());
      emit(AdminInvitatinoSuccessActionState());
    }else if(response == 'Something went wrong!'){
      emit(AdminInvitation2FailedState());
    }else if(response == 'The request returned an invalid status code of 400.'){
      emit(AdminInvitation1FailedState());
    }
  }


}
