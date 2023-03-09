import 'package:artisanmill_group5capstoneproject/data/models/artisan/artisan.dart';
import 'package:artisanmill_group5capstoneproject/data/models/user/user.dart';
import 'package:artisanmill_group5capstoneproject/utils/exceptions/user_exceptions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer' as dev;

class FirebaseArtisanHelper {
  static final FirebaseArtisanHelper _shared =
      FirebaseArtisanHelper._sharedInstance();

  FirebaseArtisanHelper._sharedInstance();

  factory FirebaseArtisanHelper() => _shared;

  final User? currentUser = FirebaseAuth.instance.currentUser;

  CollectionReference artisansRef =
      FirebaseFirestore.instance.collection('artisans');


  Future<bool> userIsArtisan(String userId) async {
    final doc = await artisansRef.doc(userId).get();
    return doc.exists;
  }

  Future<DocumentSnapshot> artisanDoc(String userId) async {
    final doc = await artisansRef.doc(userId).get();
    return doc;
  }

  Future<void> createArtisanProfile(ArtisanDto artisan) async {
    try {
      await artisansRef.doc(artisan.id).set(artisan.toJson());
    } catch (e) {
      dev.log(e.toString());
      throw CouldNotUpdateUserException();
    }
  }

  Future<DocumentSnapshot> fetchArtisanProfile(String artisanId) async {
    final artisanDoc = await artisansRef.doc(artisanId).get();
    return artisanDoc;
  }

  Future<QuerySnapshot?> fetchArtisansInCategory(String category) async {
    final QuerySnapshot snapshot =
        await artisansRef.where('category', isEqualTo: category).get();
    return snapshot;
  }

  Future<QuerySnapshot> fetchAllArtisan() async {
    final QuerySnapshot snapshot =
    await artisansRef.get();
    return snapshot;
  }

  Future<QuerySnapshot> fetchAllArtisanByLocation(String location) async {
    final QuerySnapshot snapshot = await artisansRef.where('state', isEqualTo: location).get();
    return snapshot;
  }

  Future<QuerySnapshot> fetchAllArtisanByServices(String services) async {
    final QuerySnapshot snapshot = await artisansRef.where('occupation', isEqualTo: '$services\\uf8ff').get();
    return snapshot;
  }
}
