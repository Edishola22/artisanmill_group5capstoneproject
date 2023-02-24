import 'package:artisanmill_group5capstoneproject/presentation/features/onboarding/account_chooser.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/onboarding/complete_artisan_profile_screen.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/onboarding/onboarding_screen.dart';
import 'package:go_router/go_router.dart';

import '../presentation/features/onboarding/complete_user_profile_screen.dart';

class AppRouter {
  late final router = GoRouter(
    initialLocation: '/',
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
        builder: (context, state) => CompleteUserProfileScreen(),
      ),
      GoRoute(
        path: '/complete-artisan-profile',
        name: 'complete-artisan-profile',
        builder: (context, state) => const CompleteArtisanProfileScreen(),
      ),
    ],
  );
}
