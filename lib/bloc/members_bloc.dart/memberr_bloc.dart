import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karachi_connect/bloc/members_bloc.dart/members_event.dart';
import 'package:karachi_connect/bloc/members_bloc.dart/members_state.dart';
import 'package:karachi_connect/services/members_service.dart';

class MembersBloc extends Bloc<MembersEvent, MembersState> {
  MembersBloc() : super(MembersState()) {
    on<GetInvestorEvent>(getMembersList);
  }

  MembersService investorService = MembersService();

  // get investor List
  Future<void> getMembersList(
      GetInvestorEvent event, Emitter<MembersState> emit) async {
    if (state.membersData != null) {
      emit(state.copyWith(isLoading: false));
    } else {
      emit(state.copyWith(isLoading: true));
    }
    try {
      final membersList = await investorService.getMembersApi(
        search: event.searchQuery,
      );
      emit(state.copyWith(membersData: membersList, isLoading: false));
      print(
          "investor name and role ${state.membersData?.first.name} ${state.membersData?.first.role}");
    } catch (e) {
      log("Error fetching investor data: $e");
      emit(state.copyWith(isLoading: false));
    }
  }
}
