import 'package:artisanmill_group5capstoneproject/data/helpers/firebase_artisan_helper.dart';
import 'package:artisanmill_group5capstoneproject/data/helpers/shared_prefs_helper.dart';
import 'package:artisanmill_group5capstoneproject/data/models/artisan/artisan.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/artisan_bloc/artisan_event.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/artisan_bloc/artisan_state.dart';
import 'package:artisanmill_group5capstoneproject/domain/models/all_artisans.dart';
import 'package:bloc/bloc.dart';
import 'dart:developer' as dev;
import 'package:cloud_firestore/cloud_firestore.dart';

class ArtisanBloc extends Bloc<ArtisanEvent, ArtisanState> {
  ArtisanBloc() : super(ArtisanState.uninitiated()) {
    on<CreateArtisanDocumentEvent>(onCreateArtisanDocument);

    on<UpdateArtisanDocumentEvent>(onUpdateArtisanDocument);

    on<FetchAllArtisansEvent>(onFetchAllArtisans);

    on<FetchAllArtisansByLocationEvent>(onFetchAllArtisansByLocation);

    on<FetchAllArtisansByServicesEvent>(onFetchAllArtisansByServices);

    on<FetchArtisanProfileEvent>(onFetchArtisanProfile);
  }

  final FirebaseArtisanHelper artisanHelper = FirebaseArtisanHelper();

  final AppPreferences preferences = AppPreferences();

  void onFetchArtisanProfile(
    FetchArtisanProfileEvent event,
    Emitter<ArtisanState> emit,
  ) async {
    emit(ArtisanState.loading());
    try {
      final DocumentSnapshot<dynamic> artisanDoc =
          await artisanHelper.fetchArtisanProfile(event.artisanId);
      var artisan = ArtisanDto.fromJson(artisanDoc.data());
      artisan = artisan.copyWith(id: artisanDoc.id);
      emit(ArtisanState.success(artisan));
    } catch (e) {
      dev.log(e.toString());
      emit(ArtisanState.error('Error occurred while fetching profile'));
    }
  }

  void onCreateArtisanDocument(
    CreateArtisanDocumentEvent event,
    Emitter<ArtisanState> emit,
  ) async {
    emit(ArtisanState.loading());
    try {
      final userId = await preferences.getUserId();
      final userEmail = await preferences.getUserEmail();
      final ArtisanDto artisan = ArtisanDto(
        phoneNumber: event.phone,
        businessName: event.businessName,
        occupation: event.occupation,
        state: event.state,
        businessDescription: event.businessDescription,
        category: event.category?.name,
        id: userId,
        email: userEmail,
      );
      await artisanHelper.createArtisanProfile(artisan);
      preferences.setUserType(UserType.artisan);
      emit(ArtisanState.success(null));
    } catch (e) {
      dev.log(e.toString());
      emit(ArtisanState.error('Failed to create artisan profile'));
    }
  }

  void onFetchAllArtisans(
    FetchAllArtisansEvent event,
    Emitter<ArtisanState> emit,
  ) async {
    emit(ArtisanState.loading());
    try {
      final snapshots = await artisanHelper.fetchAllArtisan();
      final allArtisans = snapshots.docs.map((dynamic docSnapshot) {
        var artisan = ArtisanDto.fromJson(docSnapshot.data());
        artisan = artisan.copyWith(id: docSnapshot.id);
        return artisan;
      }).toList();

      final makeUpArtists = allArtisans
          .where((element) =>
              element.category == ArtisanCategory.makeupArtist.name)
          .toList();

      final mechanics = allArtisans
          .where(
              (element) => element.category == ArtisanCategory.mechanics.name)
          .toList();

      final painters = allArtisans
          .where((element) => element.category == ArtisanCategory.painters.name)
          .toList();

      final hairStylists = allArtisans
          .where((element) =>
              element.category == ArtisanCategory.hairStylists.name)
          .toList();

      final plumbers = allArtisans
          .where((element) => element.category == ArtisanCategory.plumbers.name)
          .toList();

      final cleaners = allArtisans
          .where((element) => element.category == ArtisanCategory.cleaning.name)
          .toList();

      final electricians = allArtisans
          .where(
              (element) => element.category == ArtisanCategory.mechanics.name)
          .toList();

      final allArtisansResult = AllArtisans(
        makeupArtist: makeUpArtists ?? [],
        mechanics: mechanics ?? [],
        painters: painters ?? [],
        hairStylists: hairStylists ?? [],
        plumbers: plumbers ?? [],
        cleaners: cleaners ?? [],
        electricians: electricians ?? [],
      );

      emit(ArtisanState.success(allArtisansResult));
    } catch (e) {
      dev.log(e.toString());
      emit(ArtisanState.error('Error occurred while fetching category'));
    }
  }

  void onFetchAllArtisansByLocation(
    FetchAllArtisansByLocationEvent event,
    Emitter<ArtisanState> emit,
  ) async {
    emit(ArtisanState.loading());
    try {
      final snapshots =
          await artisanHelper.fetchAllArtisanByLocation(event.location);
      final allArtisans = snapshots.docs.map((dynamic docSnapshot) {
        var artisan = ArtisanDto.fromJson(docSnapshot.data());
        artisan = artisan.copyWith(id: docSnapshot.id);
        return artisan;
      }).toList();

      final makeUpArtists = allArtisans
          .where((element) =>
              element.category == ArtisanCategory.makeupArtist.name)
          .toList();

      final mechanics = allArtisans
          .where(
              (element) => element.category == ArtisanCategory.mechanics.name)
          .toList();

      final painters = allArtisans
          .where((element) => element.category == ArtisanCategory.painters.name)
          .toList();

      final hairStylists = allArtisans
          .where((element) =>
              element.category == ArtisanCategory.hairStylists.name)
          .toList();

      final plumbers = allArtisans
          .where((element) => element.category == ArtisanCategory.plumbers.name)
          .toList();

      final cleaners = allArtisans
          .where((element) => element.category == ArtisanCategory.cleaning.name)
          .toList();

      final electricians = allArtisans
          .where(
              (element) => element.category == ArtisanCategory.mechanics.name)
          .toList();

      final allArtisansResult = AllArtisans(
        makeupArtist: makeUpArtists ?? [],
        mechanics: mechanics ?? [],
        painters: painters ?? [],
        hairStylists: hairStylists ?? [],
        plumbers: plumbers ?? [],
        cleaners: cleaners ?? [],
        electricians: electricians ?? [],
      );

      emit(ArtisanState.success(allArtisansResult));
    } catch (e) {
      dev.log(e.toString());
      emit(ArtisanState.error('Error occurred while fetching category'));
    }
  }

  void onFetchAllArtisansByServices(
    FetchAllArtisansByServicesEvent event,
    Emitter<ArtisanState> emit,
  ) async {
    emit(ArtisanState.loading());
    try {
      final snapshots =
          await artisanHelper.fetchAllArtisanByServices(event.services);
      final allArtisans = snapshots.docs.map((dynamic docSnapshot) {
        var artisan = ArtisanDto.fromJson(docSnapshot.data());
        artisan = artisan.copyWith(id: docSnapshot.id);
        return artisan;
      }).toList();

      final makeUpArtists = allArtisans
          .where((element) =>
              element.category == ArtisanCategory.makeupArtist.name)
          .toList();

      final mechanics = allArtisans
          .where(
              (element) => element.category == ArtisanCategory.mechanics.name)
          .toList();

      final painters = allArtisans
          .where((element) => element.category == ArtisanCategory.painters.name)
          .toList();

      final hairStylists = allArtisans
          .where((element) =>
              element.category == ArtisanCategory.hairStylists.name)
          .toList();

      final plumbers = allArtisans
          .where((element) => element.category == ArtisanCategory.plumbers.name)
          .toList();

      final cleaners = allArtisans
          .where((element) => element.category == ArtisanCategory.cleaning.name)
          .toList();

      final electricians = allArtisans
          .where(
              (element) => element.category == ArtisanCategory.mechanics.name)
          .toList();

      final allArtisansResult = AllArtisans(
        makeupArtist: makeUpArtists ?? [],
        mechanics: mechanics ?? [],
        painters: painters ?? [],
        hairStylists: hairStylists ?? [],
        plumbers: plumbers ?? [],
        cleaners: cleaners ?? [],
        electricians: electricians ?? [],
      );

      emit(ArtisanState.success(allArtisansResult));
    } catch (e) {
      dev.log(e.toString());
      emit(ArtisanState.error('Error occurred while fetching category'));
    }
  }

  void onUpdateArtisanDocument(
    UpdateArtisanDocumentEvent event,
    Emitter<ArtisanState> emit,
  ) {}
}
