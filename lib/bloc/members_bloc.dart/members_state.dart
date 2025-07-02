import 'package:karachi_connect/model/user_model/user_model.dart';

class MembersState {
  final List<UserModel>? membersData;
  final bool? isLoading;
  MembersState({this.membersData, this.isLoading});
  MembersState copyWith({
    List<UserModel>? membersData,
    bool? isLoading,
  }) {
    return MembersState(
      membersData: membersData ?? this.membersData,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
