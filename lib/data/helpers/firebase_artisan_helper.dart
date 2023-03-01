import 'package:artisanmill_group5capstoneproject/data/models/user/user.dart';
import 'package:artisanmill_group5capstoneproject/utils/exceptions/user_exceptions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseUserHelper {

  static final FirebaseUserHelper _shared = FirebaseUserHelper._sharedInstance();

  FirebaseUserHelper._sharedInstance();

  factory FirebaseUserHelper() => _shared;

  final User? currentUser = FirebaseAuth.instance.currentUser;


  CollectionReference usersRef = FirebaseFirestore.instance.collection('users');

  Future<void> createUserProfile(UserDto userDto) async {
    try {
     final user =  userDto.copyWith(
        id: currentUser?.uid,
       email: currentUser!.email!,
      );
      await usersRef.doc(user.id).set(user.toJson());
    }
    catch (e) {
      throw CouldNotUpdateUserException();
    }

  }
}