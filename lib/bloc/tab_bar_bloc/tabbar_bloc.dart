import 'package:bloc/bloc.dart';
import 'package:karachi_connect/bloc/tab_bar_bloc/tabbar_events.dart';
import 'package:karachi_connect/bloc/tab_bar_bloc/tabbar_states.dart';

class TabbarBloc extends Bloc<TabbarEvents, TabbarStates> {
  TabbarBloc() : super(TabbarStates()) {
    on<TabValueSelector>(tabValueSelector);
  }

  int tabValueSelector(TabValueSelector event, Emitter<TabbarStates> emit) {
    emit(state.copyWith(tabValue: event.index));
    return event.index;
  }
}