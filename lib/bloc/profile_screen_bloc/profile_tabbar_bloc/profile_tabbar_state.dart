class ProfileTabbarState {
  final int? index;

  ProfileTabbarState({this.index});

  ProfileTabbarState copyWith({int? index}) {
    return ProfileTabbarState(index: index ?? this.index);
  }
}