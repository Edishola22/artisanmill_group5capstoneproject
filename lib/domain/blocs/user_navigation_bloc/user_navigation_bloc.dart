import 'package:artisanmill_group5capstoneproject/domain/blocs/user_navigation_bloc/user_navigation_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserNavigationBloc extends Bloc<UserNavigationEvent, int> {


  UserNavigationBloc(): super(0) {
    on<NavigateToHomeTabEvent>((event, emit) {
      emit(0);
    });

    on<NavigateToChatTabEvent>((event, emit) {
      emit(1);
    });

    on<NavigateToSearchTabEvent>((event, emit) {
      emit(2);
    });

    on<NavigateToCalendarTabEvent>((event, emit) {
      emit(3);
    });

    on<NavigateToProfileTabEvent>((event, emit) {
      emit(4);
    });


  }
}