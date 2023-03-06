import 'package:artisanmill_group5capstoneproject/data/models/user/user.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/artisan_bloc/artisan_bloc.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/auth_bloc/auth_bloc.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/auth_bloc/auth_state.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/chat_bloc/chat_bloc.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/user_bloc/user_bloc.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/calendar/calendar.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/chat/chat_detail_screen.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/chat/chat_screen.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/home/home_screen.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/home/log_out_screen.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/onboarding/login_screen.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/onboarding/sign_up_screen.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/onboarding/splash_screen.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/search/artisan_profile_detail.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/settings/security_settings.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/settings/settings_screen.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/home/user_navigation_section_.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/onboarding/account_chooser.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/onboarding/complete_artisan_profile_screen.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/onboarding/onboarding_screen.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/search/search_screen.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/user_profile/edit_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'dart:developer' as dev;

import '../presentation/features/onboarding/complete_user_profile_screen.dart';
import '../presentation/features/user_profile/user_profile_screen.dart';

class AppRouter {
  final _rootNavKey = GlobalKey<NavigatorState>();
  final _shellNavKey = GlobalKey<NavigatorState>();
  late final router = GoRouter(
    initialLocation: '/',
    navigatorKey: _rootNavKey,
    debugLogDiagnostics: true,
    redirect: (context, state) {
      dev.log('redirect called');
      final authBloc = BlocProvider.of<AuthBloc>(context);
      final isNotLoggedIn = authBloc.state == AuthState.unauthenticated();
      final isOnboardingScreen = state.location == '/onboarding';
      final isAccountChooserScreen = state.location == '/account-chooser';
      final isCompleteProfileScreen =
          state.location == '/complete-user-profile';
      final isLoginScreen = state.location == '/login';
      final isRegisterScreen = state.location == '/register';
      final isLogoutScreen = state.location == '/home/logout';

      if (isNotLoggedIn &&
          (!isOnboardingScreen &&
              !isAccountChooserScreen &&
              !isCompleteProfileScreen &&
              !isLogoutScreen &&
              !isLoginScreen &&
              !isRegisterScreen)) {
        return '/login';
      }
      return null;
    },
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

          return BlocProvider(
            create: (context) => UserBloc(),
            child: CompleteUserProfileScreen(phoneNumber: phoneNumber),
          );
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
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) {
          //final phoneNumber = state.queryParams['phone'];

          return const LoginScreen();
        },
      ),
      GoRoute(
        path: '/register',
        name: 'register',
        builder: (context, state) {
          //final phoneNumber = state.queryParams['phone'];

          return const SignUpScreen();
        },
      ),
      ShellRoute(
          navigatorKey: _shellNavKey,
          builder: (context, state, child) {
            return UserScaffoldWithNavBar(child: child);
          },
          routes: [
            GoRoute(
              path: '/user-home',
              name: 'user-home',
              routes: [
                GoRoute(
                    path: 'logout',
                    name: 'logout',
                    builder: (context, state) => const LogoutScreen())
              ],
              builder: (context, state) {
                return const HomeTab();
              },
            ),
            GoRoute(
              path: '/chat',
              name: 'chat',
              routes: [
                GoRoute(
                    path: 'chat-details',
                    name: 'chat-details',
                    builder: (context, state) {
                      final chatId = state.queryParams['chatId'];
                      final userId = state.queryParams['userId'];
                      return BlocProvider(
                        create: (context) => ChatBloc(),
                        child: ChatDetailScreen(
                          chatId: chatId,
                          userId: userId,
                        ),
                      );
                    }),
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
                      return BlocProvider(
                        create: (context) => ArtisanBloc(),
                        child: ArtisanProfileDetails(userId: artisanId),
                      );
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
              path: '/user-profile',
              name: 'user-profile',
              routes: [
                GoRoute(
                    path: 'user-edit-profile',
                    name: 'user-edit-profile',
                    builder: (context, state) {
                      final user = state.extra as UserDto;
                      return UserEditProfileScreen(user: user);
                    })
              ],
              builder: (context, state) {
                return BlocProvider(
                  create: (context) => UserBloc(),
                  child: const ProfileTab(),
                );
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
