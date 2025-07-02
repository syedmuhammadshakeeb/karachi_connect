abstract class MembersEvent {
  const MembersEvent();
}

class GetInvestorEvent extends MembersEvent {
  final String? searchQuery;

  GetInvestorEvent({this.searchQuery});
}
