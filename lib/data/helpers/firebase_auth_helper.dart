import 'package:artisanmill_group5capstoneproject/utils/exceptions/auth_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:developer' as dev;

class FirebaseAuthHelper {

  static final FirebaseAuthHelper _instance = FirebaseAuthHelper._sharedInstance();

  FirebaseAuthHelper._sharedInstance();

  factory FirebaseAuthHelper() => _instance;



  Future<void> createUserWithEmailAndPassword(
      {required String email, required String password,}) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    }
    on FirebaseAuthException catch(e) {
      if(e.code == 'weak-password') {
        throw WeakPassWordException();
      } else if(e.code == 'email-already-in-use') {
        throw EmailAlreadyInUseException();
      }
    }
    catch (e) {
      throw GenericAuthException();
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount?  account = await GoogleSignIn(
        scopes: [
          'profile',
          'email',
        ],
      ).signIn();

      final GoogleSignInAuthentication? googleAuth = await account?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
    }
    catch (e) {
      dev.log(e.toString());
      throw GenericAuthException();
    }
  }
}