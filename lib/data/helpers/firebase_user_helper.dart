import 'package:artisanmill_group5capstoneproject/data/models/user.dart';
import 'package:artisanmill_group5capstoneproject/utils/exceptions/user_exceptions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseUserHelper {

  static final FirebaseUserHelper _shared = FirebaseUserHelper._sharedInstance();

  FirebaseUserHelper._sharedInstance();

  factory FirebaseUserHelper() => _shared;


  CollectionReference usersRef = FirebaseFirestore.instance.collection('users');

  Future<void> createUserProfile(UserDto user) async {
    try {
      await usersRef.doc(user.id).set(user.toJson());
    }
    catch (e) {
      throw CouldNotUpdateUserException();
    }

  }
}