import 'package:artisanmill_group5capstoneproject/utils/assets/assets.gen.dart';

class OnboardingItem {
  final String title;
  final String imagePath;

  OnboardingItem({
    required this.title,
    required this.imagePath,
  });

  static List<OnboardingItem> items = [
    OnboardingItem(
      title: 'Find Service Providers\n Closest to You',
      imagePath: Assets.images.serviceProviders.path,
    ),
    OnboardingItem(
      title: 'Book The Service of\n Qualified Artisans',
      imagePath: Assets.images.qualifiedArtisans.path,
    ),
  ];
}
