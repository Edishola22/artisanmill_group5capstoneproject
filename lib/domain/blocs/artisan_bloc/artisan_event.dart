import 'package:artisanmill_group5capstoneproject/data/models/artisan/artisan.dart';
import 'package:artisanmill_group5capstoneproject/data/models/user/user.dart';

abstract class ArtisanEvent {}

class CreateArtisanDocumentEvent extends ArtisanEvent {
  final String businessName;
  final String? phone;
  final String state;
  final String occupation;
  final String businessDescription;
  final ArtisanCategory? category;
  final String? email;
  final String? userId;

  CreateArtisanDocumentEvent({
    required this.businessName,
    this.category,
    this.phone,
    this.email,
    this.userId,
    required this.occupation,
    required this.state,
    required this.businessDescription,
  });
}

class FetchArtisansForACategoryEvent extends ArtisanEvent {
  String category;

  FetchArtisansForACategoryEvent({
    required this.category,
  });
}

class FetchArtisanProfileEvent extends ArtisanEvent {
  String artisanId;

  FetchArtisanProfileEvent({
    required this.artisanId,
  });
}

class FetchAllArtisansEvent extends ArtisanEvent {
}

class FetchAllArtisansByLocationEvent extends ArtisanEvent {
  final String location;

  FetchAllArtisansByLocationEvent({required this.location});
}

class FetchAllArtisansByServicesEvent extends ArtisanEvent {
  final String services;

  FetchAllArtisansByServicesEvent({required this.services});
}

class UpdateArtisanDocumentEvent extends ArtisanEvent {
  final ArtisanDto artisan;

  UpdateArtisanDocumentEvent({required this.artisan});
}
