import 'package:artisanmill_group5capstoneproject/data/models/artisan/artisan.dart';
import 'package:artisanmill_group5capstoneproject/data/models/user/user.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/artisan_bloc/artisan_bloc.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/auth_bloc/auth_bloc.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/auth_bloc/auth_state.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/chat_bloc/chat_bloc.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/user_bloc/user_bloc.dart';
import 'package:artisanmill_group5capstoneproject/domain/models/chat_users.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/artisan/activity/activity_tab.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/artisan/artisan_navigation_section.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/artisan/chat/artisan_chat_detail_screen.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/artisan/chat/artisan_chat_screen.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/artisan/home/artisan_home_tab.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/artisan/more/more_tab.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/artisan/profile/artisan_edit_profile.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/artisan/profile/artisan_profile_tab.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/log_out/log_out_screen.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/users/calendar/scheduling_screen.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/users/chat/user_chat_detail_screen.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/users/chat/user_chat_screen.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/users/home/home_screen.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/onboarding/login_screen.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/onboarding/sign_up_screen.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/onboarding/splash_screen.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/settings/security_settings.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/settings/settings_screen.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/users/user_navigation_section_.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/onboarding/account_chooser.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/onboarding/complete_artisan_profile_screen.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/onboarding/onboarding_screen.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/users/search/artisan_profile_detail.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/users/search/search_screen.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/users/user_profile/user_edit_profile.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/users/user_profile/user_profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'dart:developer' as dev;
import '../presentation/features/onboarding/complete_user_profile_screen.dart';

class AppRouter {
  final _rootNavKey = GlobalKey<NavigatorState>();
  final _userShellNavKey = GlobalKey<NavigatorState>();
  final _artisanShellNavKey = GlobalKey<NavigatorState>();
  late final router = GoRouter(
    initialLocation: '/',
    navigatorKey: _rootNavKey,
    debugLogDiagnostics: true,
    redirect: (context, state) {
      final authBloc = BlocProvider.of<AuthBloc>(context);
      final isNotLoggedIn = authBloc.state == AuthState.unauthenticated();
      final isOnboardingScreen = state.location == '/onboarding';
      final isAccountChooserScreen = state.location == '/account-chooser';
      final isCompleteProfileScreen =
          state.location == '/complete-user-profile';
      final isCompleteArtisanProfileScreen =
          state.location == '/complete-artisan-profile';
      final isLoginScreen = state.location == '/login';
      final isRegisterScreen = state.location == '/register';
      final isLogoutScreen = state.location == 'logout';

      if (isNotLoggedIn &&
          (!isOnboardingScreen &&
              !isAccountChooserScreen &&
              !isCompleteProfileScreen &&
              !isCompleteArtisanProfileScreen &&
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

          return AccountChooserScreen(
            phoneNumber: phoneNumber,
          );
        },
      ),
      GoRoute(
        path: '/complete-user-profile',
        name: 'complete-user-profile',
        builder: (context, state) {
          final phoneNumber = state.queryParams['phone'];

          return BlocProvider(
            create: (context) => UserBloc(),
            child: CompleteUserProfileScreen(
              phoneNumber: phoneNumber,
            ),
          );
        },
      ),
      GoRoute(
        path: '/complete-artisan-profile',
        name: 'complete-artisan-profile',
        builder: (context, state) {
          final phoneNumber = state.queryParams['phone'];
          return CompleteArtisanProfileScreen(
            phoneNumber: phoneNumber,
          );
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
      GoRoute(
          path: '/logout',
          name: 'logout',
          builder: (context, state) => const LogoutScreen()),
      ShellRoute(
          navigatorKey: _userShellNavKey,
          builder: (context, state, child) {
            return UserScaffoldWithNavBar(child: child);
          },
          routes: [
            GoRoute(
              path: '/user-home',
              name: 'user-home',
              builder: (context, state) {
                return const UserHomeTab();
              },
            ),
            GoRoute(
              path: '/user-chat',
              name: 'user-chat',
              routes: [
                GoRoute(
                    path: 'user-chat-details',
                    name: 'user-chat-details',
                    builder: (context, state) {
                      final chatId = state.queryParams['chatId'];
                      final chatUsers = state.extra as ChatUsers?;
                      return BlocProvider(
                        create: (context) => ChatBloc(),
                        child: UserChatDetailScreen(
                          chatId: chatId,
                          chatUsers: chatUsers,
                        ),
                      );
                    }),
              ],
              builder: (context, state) {
                return BlocProvider(
                  create: (context) => ChatBloc(),
                  child: const UserChatTab(),
                );
              },
            ),
            GoRoute(
              path: '/search',
              name: 'search',
              routes: [
                GoRoute(
                    path: 'user-artisan-profile/:id',
                    name: 'user-artisan-profile',
                    builder: (context, state) {
                      final artisanId = state.params['id'] ?? '';
                      return BlocProvider(
                        create: (context) => ArtisanBloc(),
                        child: ArtisanProfileDetails(userId: artisanId),
                      );
                    })
              ],
              builder: (context, state) {
                final location = state.queryParams['location'];
                dev.log('Location type is ${location.runtimeType.toString()}');
                return SearchTab(location: location);
              },
            ),
            GoRoute(
              path: '/calendar',
              name: 'calendar',
              builder: (context, state) {
                final artisan = state.extra as ArtisanDto?;
                return SchedulingTab(artisan: artisan);
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
                  child: const UserProfileTab(),
                );
              },
            ),
          ]),
      ShellRoute(
          navigatorKey: _artisanShellNavKey,
          builder: (context, state, child) {
            return ArtisanScaffoldWithNavBar(child: child);
          },
          routes: [
            GoRoute(
              path: '/artisan-home',
              name: 'artisan-home',
              builder: (context, state) {
                return const ArtisanHomeTab();
              },
            ),
            GoRoute(
              path: '/artisan-chat',
              name: 'artisan-chat',
              routes: [
                GoRoute(
                    path: 'artisan-chat-details',
                    name: 'artisan-chat-details',
                    builder: (context, state) {
                      final chatId = state.queryParams['chatId'];
                      final chatUsers = state.extra as ChatUsers;
                      return BlocProvider(
                        create: (context) => ChatBloc(),
                        child: ArtisanChatDetailScreen(
                          chatId: chatId,
                          chatUsers: chatUsers,
                        ),
                      );
                    }),
              ],
              builder: (context, state) {
                return BlocProvider(
                  create: (context) => ChatBloc(),
                  child: const ArtisanChatTab(),
                );
              },
            ),
            GoRoute(
              path: '/activity',
              name: 'activity',
              builder: (context, state) {
                return const ActivityTab();
              },
            ),
            GoRoute(
              path: '/artisan-profile',
              name: 'artisan-profile',
              routes: [
                GoRoute(
                    path: 'artisan-edit-profile',
                    name: 'artisan-edit-profile',
                    builder: (context, state) {
                      final user = state.extra as UserDto;
                      return ArtisanEditProfileScreen(user: user);
                    })
              ],
              builder: (context, state) {
                return BlocProvider(
                  create: (context) => UserBloc(),
                  lazy: false,
                  child: const ArtisanProfileTab(),
                );
              },
            ),
            GoRoute(
              path: '/more',
              name: 'more',
              builder: (context, state) {
                return const MoreTab();
              },
            ),
          ]),
      GoRoute(
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
    ],
  );
}
