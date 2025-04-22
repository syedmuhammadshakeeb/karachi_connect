import 'package:bloc/bloc.dart';
import 'package:karachi_connect/bloc/visilibilty_icon_bloc/visibility_state.dart';
import 'package:karachi_connect/bloc/visilibilty_icon_bloc/visiblity_event.dart';

class VisibilityBloc extends Bloc<VisiblityEvent, VisibilityState> {
  VisibilityBloc() : super(VisibilityState()) {
    on<IsVisiblePassword>(isvisible);
  }

  isvisible(IsVisiblePassword event, Emitter<VisibilityState> emit) {
    emit(state.copyWith(isVisible: !state.isVisible));
  }
}
