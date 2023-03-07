import 'package:artisanmill_group5capstoneproject/utils/assets/assets.gen.dart';
import 'package:flutter/material.dart';

class UserNavItem {
  UserNavItem({
    required this.title,
    required this.iconPath,
    required this.initialLocation,
  });

  final String title;
  final String iconPath;
  final String initialLocation;

  static List<UserNavItem> navItems = [
    UserNavItem(
      title: 'Home',
      iconPath: Assets.icons.homeIcon.path,
      initialLocation: '/user-home',
    ),
    UserNavItem(
      title: 'Chat',
      iconPath: Assets.icons.chatIcon.path,
      initialLocation: '/user-chat'
    ),
    UserNavItem(
      title: 'Search',
      iconPath: Assets.icons.searchIcon.path,
      initialLocation: '/search'
    ),
    UserNavItem(
      title: 'Calendar',
      iconPath: Assets.icons.calendarIcon.path,
      initialLocation: '/calendar',
    ),
    UserNavItem(
      title: 'Profile',
      iconPath: Assets.icons.profileIcon.path,
      initialLocation: '/user-profile',
    ),

  ];
}
