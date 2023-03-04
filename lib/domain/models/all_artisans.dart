import 'package:artisanmill_group5capstoneproject/data/models/artisan/artisan.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'all_artisans.freezed.dart';

@freezed
class AllArtisans with _$AllArtisans{

  factory AllArtisans({
    required final List<ArtisanDto> makeupArtist,
    required final List<ArtisanDto> mechanics,
    required final List<ArtisanDto> painters,
    required final List<ArtisanDto> hairStylists,
    required final List<ArtisanDto> plumbers,
    required final List<ArtisanDto> cleaners,
    required final List<ArtisanDto> electricians,
  }) = _AllArtisans;
}
