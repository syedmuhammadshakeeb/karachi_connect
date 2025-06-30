import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karachi_connect/bloc/investor_bloc.dart/investor_event.dart';
import 'package:karachi_connect/bloc/investor_bloc.dart/investor_state.dart';
import 'package:karachi_connect/services/investor_service.dart';

class InvestorBloc extends Bloc<InvestorEvent, InvestorState> {
  InvestorBloc() : super(InvestorState()) {
    on<GetInvestorEvent>(getInvestorList);
  }

  InvestorService investorService = InvestorService();

  // get investor List
  Future<void> getInvestorList(
      GetInvestorEvent event, Emitter<InvestorState> emit) async {
    if (state.investorData != null) {
      emit(state.copyWith(isLoading: false));
    } else {
      emit(state.copyWith(isLoading: true));
    }
    try {
      final investorList = await investorService.getInvestorApi();
      emit(state.copyWith(investorData: investorList, isLoading: false));
      print(
          "investor name and role ${state.investorData?.first.name} ${state.investorData?.first.role}");
    } catch (e) {
      log("Error fetching investor data: $e");
      emit(state.copyWith(isLoading: false));
    }
  }
}
