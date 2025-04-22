class VisibilityState {
  final bool isVisible;
  VisibilityState({this.isVisible = false});
  VisibilityState copyWith({bool? isVisible}) =>
      VisibilityState(isVisible: isVisible ?? this.isVisible);
}
