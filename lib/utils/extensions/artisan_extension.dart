import 'package:artisanmill_group5capstoneproject/data/models/artisan/artisan.dart';

extension ArtisanExtension on ArtisanCategory {

  String get category {
    switch(this) {
      case ArtisanCategory.makeupArtist:
        return 'Makeup Artists';
      case ArtisanCategory.mechanics:
        return 'Mechanics';
      case ArtisanCategory.painters:
        return 'Painters';
      case ArtisanCategory.hairStylists:
        return 'Hair Stylists';
      case ArtisanCategory.plumbers:
        return 'Plumbers';
      case ArtisanCategory.cleaning:
        return 'Cleaning';
      case ArtisanCategory.electrical:
        return 'Electrical';
    }
  }
}