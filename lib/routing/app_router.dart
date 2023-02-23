import 'package:artisanmill_group5capstoneproject/presentation/features/onboarding/onboarding_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  late final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const OnBoardingScreen(),
      ),
    ],
  );
}
