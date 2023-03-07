import 'package:artisanmill_group5capstoneproject/domain/blocs/artisan_navigation_bloc/artisan_navigation_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArtisanNavigationBloc extends Bloc<ArtisanNavigationEvent, int> {


  ArtisanNavigationBloc(): super(0) {
    on<NavigateToHomeTabEvent>((event, emit) {
      emit(0);
    });

    on<NavigateToChatTabEvent>((event, emit) {
      emit(1);
    });

    on<NavigateToActivityTabEvent>((event, emit) {
      emit(2);
    });

    on<NavigateToProfileTabEvent>((event, emit) {
      emit(3);
    });

    on<NavigateToMoreTabEvent>((event, emit) {
      emit(4);
    });


  }
}