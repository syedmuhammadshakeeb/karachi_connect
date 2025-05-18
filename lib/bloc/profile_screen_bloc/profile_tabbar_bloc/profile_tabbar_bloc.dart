import 'package:bloc/bloc.dart';
import 'package:karachi_connect/bloc/profile_screen_bloc/profile_tabbar_bloc/profile_tabbar_events.dart';
import 'package:karachi_connect/bloc/profile_screen_bloc/profile_tabbar_bloc/profile_tabbar_state.dart';

class ProfileTabbarBloc extends Bloc<ProfileTabbarEvents, ProfileTabbarState> {
  ProfileTabbarBloc() :super(ProfileTabbarState()){
    on<ProfileTabbar>(profileTabValue);
  }

  int? profileTabValue(ProfileTabbar event,Emitter<ProfileTabbarState> emit){
    emit(state.copyWith(index: event.index));
    return event.index;
  }
}