import 'package:artisanmill_group5capstoneproject/presentation/features/calendar/calendar.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/chat/chat_screen.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/home/home_screen.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/settings/settings_screen.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/home/user_section_navigation.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/onboarding/account_chooser.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/onboarding/complete_artisan_profile_screen.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/onboarding/onboarding_screen.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/profile/profile_screen.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/search/search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../presentation/features/onboarding/complete_user_profile_screen.dart';

class AppRouter {

  final _rootNavKey = GlobalKey<NavigatorState>();
  final _shellNavKey = GlobalKey<NavigatorState>();
  late final router = GoRouter(
    initialLocation: '/',
    navigatorKey: _rootNavKey,
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const OnBoardingScreen(),
      ),
      GoRoute(
        path: '/account-chooser',
        name: 'account-chooser',
        builder: (context, state) => const AccountChooserScreen(),
      ),
      GoRoute(
        path: '/complete-user-profile',
        name: 'complete-user-profile',
        builder: (context, state) => const CompleteUserProfileScreen(),
      ),
      GoRoute(
        path: '/complete-artisan-profile',
        name: 'complete-artisan-profile',
        builder: (context, state) => const CompleteArtisanProfileScreen(),
      ),
      ShellRoute(
        navigatorKey: _shellNavKey,
        builder: (context, state, child) {
          return ScaffoldWithNavBar(child: child);
        },
        routes: [
          GoRoute(
            path: '/home',
            name: 'home',
            builder: (context, state) {
              return const HomeTab();
            },
          ),
          GoRoute(
            path: '/chat',
            name: 'chat',
            builder: (context, state) {
              return const ChatTab();
            },
          ),
          GoRoute(
            path: '/search',
            name: 'search',
            builder: (context, state) {
              return const SearchTab();
            },
          ),
          GoRoute(
            path: '/calendar',
            name: 'calendar',
            builder: (context, state) {
              return const CalendarTab();
            },
          ),
          GoRoute(
            path: '/profile',
            name: 'profile',
            builder: (context, state) {
              return const ProfileTab();
            },
          ),
          GoRoute(
            parentNavigatorKey: _shellNavKey,
            path: '/settings',
            name: 'settings',
            builder: (context, state) {
              return const SettingsScreen();
            },
          ),
        ]
      )
    ],
  );
}
