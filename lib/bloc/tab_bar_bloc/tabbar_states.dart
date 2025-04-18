class TabbarStates {
  final int tabValue;
  TabbarStates({this.tabValue =0});
  TabbarStates copyWith({int? tabValue}) {
    return TabbarStates(
      tabValue: tabValue ?? this.tabValue,
    );
  }
}
