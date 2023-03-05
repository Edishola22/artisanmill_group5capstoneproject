import 'package:artisanmill_group5capstoneproject/data/helpers/firebase_artisan_helper.dart';
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

    on<FetchArtisanProfileEvent>(onFetchArtisanProfile);
  }

  final FirebaseArtisanHelper artisanHelper = FirebaseArtisanHelper();

  void onFetchArtisanProfile(FetchArtisanProfileEvent event,
      Emitter<ArtisanState> emit,) async {
    emit(ArtisanState.loading());
    try {
      final DocumentSnapshot<dynamic> artisanDoc = await artisanHelper.fetchArtisanProfile(event.artisanId);
      final artisan = ArtisanDto.fromJson(artisanDoc.data());
      emit(ArtisanState.success(artisan));
    } catch(e) {
      dev.log(e.toString());
      emit(ArtisanState.error('Error occurred while fetching profile'));
    }
  }

  void onCreateArtisanDocument(CreateArtisanDocumentEvent event,
      Emitter<ArtisanState> emit,) async {
    emit(ArtisanState.loading());
    try {
      final ArtisanDto artisan = ArtisanDto(
        phoneNumber: event.phone,
        businessName: event.businessName,
        occupation: event.occupation,
        state: event.state,
        businessDescription: event.businessDescription,
        category: event.category?.name,
      );
      await artisanHelper.createArtisanProfile(artisan);
      emit(ArtisanState.success(null));
    } catch (_) {
      emit(ArtisanState.error('Failed to create artisan profile'));
    }
  }

  void onFetchAllArtisans(FetchAllArtisansEvent event,
      Emitter<ArtisanState> emit,) async {
    emit(ArtisanState.loading());
    try {
      // final categories = [
      //   artisanHelper.fetchArtisansInCategory(
      //     ArtisanCategory.makeupArtist.name,
      //   ),
      //   artisanHelper.fetchArtisansInCategory(
      //     ArtisanCategory.mechanics.name,
      //   ),
      //   artisanHelper.fetchArtisansInCategory(
      //     ArtisanCategory.painters.name,
      //   ),
      //   artisanHelper.fetchArtisansInCategory(
      //     ArtisanCategory.hairStylists.name,
      //   ),
      //   artisanHelper.fetchArtisansInCategory(
      //     ArtisanCategory.plumbers.name,
      //   ),
      //   artisanHelper.fetchArtisansInCategory(
      //     ArtisanCategory.cleaning.name,
      //   ),
      //   artisanHelper.fetchArtisansInCategory(
      //     ArtisanCategory.electrical.name,
      //   )
      // ];

      final snapshots = await artisanHelper.fetchAllArtisan();
      final allArtisans = snapshots?.docs.map((dynamic docSnapshot) {
        var artisan = ArtisanDto.fromJson(docSnapshot.data());
        artisan = artisan.copyWith(
          id: docSnapshot.id
        );
        return artisan;
      }).toList();

      final makeUpArtists = allArtisans
          ?.where((element) =>
      element.category == ArtisanCategory.makeupArtist.name)
          .toList();

      final mechanics = allArtisans
          ?.where(
              (element) => element.category == ArtisanCategory.mechanics.name)
          .toList();

      final painters = allArtisans
          ?.where(
              (element) => element.category == ArtisanCategory.painters.name)
          .toList();

      final hairStylists = allArtisans
          ?.where((element) =>
      element.category == ArtisanCategory.hairStylists.name)
          .toList();

      final plumbers = allArtisans
          ?.where(
              (element) => element.category == ArtisanCategory.plumbers.name)
          .toList();

      final cleaners = allArtisans
          ?.where(
              (element) => element.category == ArtisanCategory.cleaning.name)
          .toList();

      final electricians = allArtisans
          ?.where(
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

      // Future.forEach(categories, (categories) async {
      //   final snapshots = await categories;
      //   final artisanList = snapshots?.docs.map((dynamic docSnapshot) {
      //     final artisan = ArtisanDto.fromJson(docSnapshot.data());
      //     return artisan;
      //   }).toList();
      // });

      emit(ArtisanState.success(allArtisansResult));
    } catch (e) {
      dev.log(e.toString());
      emit(ArtisanState.error('Error occurred while fetching category'));
    }
  }

  void onUpdateArtisanDocument(UpdateArtisanDocumentEvent event,
      Emitter<ArtisanState> emit,) {}
}
