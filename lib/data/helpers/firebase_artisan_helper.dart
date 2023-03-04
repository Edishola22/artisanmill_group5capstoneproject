import 'package:artisanmill_group5capstoneproject/data/models/artisan/artisan.dart';
import 'package:artisanmill_group5capstoneproject/data/models/user/user.dart';
import 'package:artisanmill_group5capstoneproject/utils/exceptions/user_exceptions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseArtisanHelper {
  static final FirebaseArtisanHelper _shared =
      FirebaseArtisanHelper._sharedInstance();

  FirebaseArtisanHelper._sharedInstance();

  factory FirebaseArtisanHelper() => _shared;

  final User? currentUser = FirebaseAuth.instance.currentUser;

  CollectionReference artisansRef =
      FirebaseFirestore.instance.collection('artisans');

  Future<void> createArtisanProfile(ArtisanDto artisanDto) async {
    try {
      final artisan = artisanDto.copyWith(
        id: currentUser?.uid,
        email: currentUser!.email!,
      );
      await artisansRef.doc(artisan.id).set(artisan.toJson());
    } catch (e) {
      throw CouldNotUpdateUserException();
    }
  }

  Future<QuerySnapshot?> fetchArtisansInCategory(String category) async {
    final QuerySnapshot snapshot =
        await artisansRef.where('category', isEqualTo: category).get();
    return snapshot;
  }

  Future<QuerySnapshot?> fetchAllArtisan() async {
    final QuerySnapshot snapshot =
    await artisansRef.get();
    return snapshot;
  }
}
