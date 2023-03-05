import 'package:artisanmill_group5capstoneproject/domain/blocs/chat_bloc/chat_bloc.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/calendar/calendar.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/chat/chat_detail_screen.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/chat/chat_screen.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/home/home_screen.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/onboarding/splash_screen.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/profile/edit_profile.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/search/artisan_profile_detail.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/settings/security_settings.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/settings/settings_screen.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/home/user_section_navigation.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/onboarding/account_chooser.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/onboarding/complete_artisan_profile_screen.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/onboarding/onboarding_screen.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/profile/profile_screen.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/search/search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../presentation/features/onboarding/complete_user_profile_screen.dart';

class AppRouter {
  final _rootNavKey = GlobalKey<NavigatorState>();
  final _shellNavKey = GlobalKey<NavigatorState>();
  late final router = GoRouter(
    initialLocation: '/home',
    navigatorKey: _rootNavKey,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/onboarding',
        name: 'onboarding',
        builder: (context, state) => const OnBoardingScreen(),
      ),
      GoRoute(
        path: '/account-chooser',
        name: 'account-chooser',
        builder: (context, state) {
          final phoneNumber = state.queryParams['phone'];

          return AccountChooserScreen(phoneNumber: phoneNumber);
        },
      ),
      GoRoute(
        path: '/complete-user-profile',
        name: 'complete-user-profile',
        builder: (context, state) {
          final phoneNumber = state.queryParams['phone'];

          return CompleteUserProfileScreen(phoneNumber: phoneNumber);
        },
      ),
      GoRoute(
        path: '/complete-artisan-profile',
        name: 'complete-artisan-profile',
        builder: (context, state) {
          final phoneNumber = state.queryParams['phone'];

          return CompleteArtisanProfileScreen(phoneNumber: phoneNumber);
        },
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
              routes: [
                GoRoute(
                    path: 'chat-details/:id',
                    name: 'chat-details',
                    builder: (context, state) {
                      final chatId = state.params['id'] ?? '';
                      return ChatDetailScreen(chatId: chatId);
                    }
                ),
              ],
              builder: (context, state) {
                return BlocProvider(
                  create: (context) => ChatBloc(),
                  child: const ChatTab(),
                );
              },
            ),
            GoRoute(
              path: '/search',
              name: 'search',
              routes: [
                GoRoute(
                    path: 'artisan-profile/:id',
                    name: 'artisan-profile',
                    builder: (context, state) {
                      final artisanId = state.params['id'] ?? '';
                      return ArtisanProfileDetails(userId: artisanId);
                    })
              ],
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
              routes: [
                GoRoute(
                    path: 'edit-profile',
                    name: 'edit-profile',
                    builder: (context, state) => const EditProfileScreen())
              ],
              builder: (context, state) {
                return const ProfileTab();
              },
            ),
            GoRoute(
              parentNavigatorKey: _shellNavKey,
              path: '/settings',
              name: 'settings',
              routes: [
                GoRoute(
                    path: 'security',
                    name: 'security',
                    builder: (context, state) {
                      return const SecuritySettings();
                    })
              ],
              builder: (context, state) {
                return const SettingsScreen();
              },
            ),
          ])
    ],
  );
}
