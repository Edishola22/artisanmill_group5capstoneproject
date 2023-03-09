

import 'package:artisanmill_group5capstoneproject/data/models/artisan/artisan.dart';

abstract class UserNavigationEvent {
}

class NavigateToHomeTabEvent extends UserNavigationEvent {

}

class NavigateToChatTabEvent extends UserNavigationEvent {

}
class NavigateToSearchTabEvent extends UserNavigationEvent {
  final String? location;

  NavigateToSearchTabEvent(this.location);

}
class NavigateToCalendarTabEvent extends UserNavigationEvent {
  final ArtisanDto? artisan;

  NavigateToCalendarTabEvent(this.artisan);

}
class NavigateToProfileTabEvent extends UserNavigationEvent {

}