import 'package:artisanmill_group5capstoneproject/domain/blocs/user_navigation_bloc/user_navigation_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'user_navigation_state.dart';

class UserNavigationBloc extends Bloc<UserNavigationEvent, UserNavState> {


  UserNavigationBloc(): super(UserNavState(index: 0)) {
    on<NavigateToHomeTabEvent>((event, emit) {
      emit(UserNavState(index: 0));
    });

    on<NavigateToChatTabEvent>((event, emit) {
      emit(UserNavState(index: 1));
    });

    on<NavigateToSearchTabEvent>((event, emit) {
      emit(UserNavState(index: 2, location: event.location));
    });

    on<NavigateToCalendarTabEvent>((event, emit) {
      emit(UserNavState(index: 3, artisan: event.artisan));
    });

    on<NavigateToProfileTabEvent>((event, emit) {
      emit(UserNavState(index: 4));
    });


  }
}