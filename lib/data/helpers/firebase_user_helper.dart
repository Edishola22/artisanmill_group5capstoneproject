import 'dart:io';

import 'package:artisanmill_group5capstoneproject/data/models/user/user.dart';
import 'package:artisanmill_group5capstoneproject/utils/exceptions/user_exceptions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseUserHelper {

  static final FirebaseUserHelper _shared = FirebaseUserHelper._sharedInstance();

  FirebaseUserHelper._sharedInstance();

  factory FirebaseUserHelper() => _shared;

  final User? currentUser = FirebaseAuth.instance.currentUser;


  CollectionReference usersRef = FirebaseFirestore.instance.collection('users');

  String get userId => currentUser!.uid;

  Future<void> createUserProfile(UserDto userDto) async {
    try {
     final user =  userDto.copyWith(
        id: currentUser?.uid,
       email: currentUser!.email!,
       country: '',
      );
      await usersRef.doc(user.id).set(user.toJson());
    }
    catch (e) {
      throw CouldNotUpdateUserException();
    }
  }

  Future<DocumentSnapshot> fetchUserDetails(String userId) async {
    final doc = await usersRef.doc(userId).get();
    return doc;
  }

  Future<void> updateUserDetails(UserDto user) async {
    await usersRef.doc(user.id).update(user.toJson());
  }

  Future<void> uploadProfilePicture(File image, String name) async {
    final filename = DateTime.now().millisecondsSinceEpoch.toString() + name;
    final storageRef= FirebaseStorage.instance.ref('users').child(filename);
    await storageRef.putFile(image);
  }
}