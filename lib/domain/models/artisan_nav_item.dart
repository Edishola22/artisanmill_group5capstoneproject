import 'package:artisanmill_group5capstoneproject/utils/assets/assets.gen.dart';

class ArtisanNavItem {
  ArtisanNavItem({
    required this.title,
    required this.iconPath,
    required this.initialLocation,
  });

  final String title;
  final String iconPath;
  final String initialLocation;

  static List<ArtisanNavItem> navItems = [
    ArtisanNavItem(
      title: 'Home',
      iconPath: Assets.icons.homeIcon.path,
      initialLocation: '/artisan-home',
    ),
    ArtisanNavItem(
      title: 'Chat',
      iconPath: Assets.icons.chatIcon.path,
      initialLocation: '/artisan-chat'
    ),
    ArtisanNavItem(
      title: 'Activity',
      iconPath: Assets.icons.activity.path,
      initialLocation: '/activity'
    ),
    ArtisanNavItem(
      title: 'Profile',
      iconPath: Assets.icons.profileIcon.path,
      initialLocation: '/artisan-profile',
    ),
    ArtisanNavItem(
      title: 'More',
      iconPath: Assets.icons.horizontalMore.path,
      initialLocation: '/more',
    ),

  ];
}
