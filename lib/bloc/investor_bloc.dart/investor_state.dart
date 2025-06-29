
import 'package:karachi_connect/model/user_model/user_model.dart';

class InvestorState {
  final List<UserModel>? investorData;
  final bool? isLoading;
  InvestorState({this.investorData, this.isLoading});
  InvestorState copyWith({
    List<UserModel>? investorData,
    bool? isLoading,
  }) {
    return InvestorState(
      investorData: investorData ?? this.investorData,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
