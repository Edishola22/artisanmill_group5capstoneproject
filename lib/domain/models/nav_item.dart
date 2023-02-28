import 'package:artisanmill_group5capstoneproject/utils/assets/assets.gen.dart';
import 'package:flutter/material.dart';

class NavItem {
  NavItem({
    required this.title,
    required this.iconPath,
    required this.initialLocation,
  });

  final String title;
  final String iconPath;
  final String initialLocation;

  static List<NavItem> navItems = [
    NavItem(
      title: 'Home',
      iconPath: Assets.icons.homeIcon.path,
      initialLocation: '/home',
    ),
    NavItem(
      title: 'Chat',
      iconPath: Assets.icons.chatIcon.path,
      initialLocation: '/chat'
    ),
    NavItem(
      title: 'Search',
      iconPath: Assets.icons.searchIcon.path,
      initialLocation: '/search'
    ),
    NavItem(
      title: 'Calendar',
      iconPath: Assets.icons.calendarIcon.path,
      initialLocation: '/calendar',
    ),
    NavItem(
      title: 'Profile',
      iconPath: Assets.icons.profileIcon.path,
      initialLocation: '/profile',
    ),

  ];
}
