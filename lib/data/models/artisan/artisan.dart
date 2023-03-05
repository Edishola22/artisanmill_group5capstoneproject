import 'package:freezed_annotation/freezed_annotation.dart';

part 'artisan.g.dart';

part 'artisan.freezed.dart';

enum ArtisanCategory {
  makeupArtist,
  mechanics,
  painters,
  hairStylists,
  plumbers,
  cleaning,
  electrical,
}

@freezed
class ArtisanDto with _$ArtisanDto {
  factory ArtisanDto({
    final String? id,
    final String? email,
    final String? phoneNumber,
    final String? businessName,
    final String? occupation,
    final String? businessDescription,
    final String? state,
    final String? category,
    final String? imageUrl,
  }) = _ArtisanDto;

  factory ArtisanDto.fromJson(Map<String, dynamic> json) =>
      _$ArtisanDtoFromJson(json);

}


