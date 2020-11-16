import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  FirebaseApp firebaseApp;
  User firebaseUser;
  FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn = new GoogleSignIn();

  AuthService() {
    initlizeFirebaseApp();
  }

  Future<void> initlizeFirebaseApp() async {
    firebaseApp = await Firebase.initializeApp();
    firebaseAuth = FirebaseAuth.instance;
  }

  Future<String> checkUserLoggedIn() async {
    if (firebaseApp == null) {
      await initlizeFirebaseApp();
    }
    if (firebaseAuth == null) {
      firebaseAuth = FirebaseAuth.instance;
    }
    if (firebaseAuth.currentUser == null) {
      return '/login';
    } else {
      firebaseUser = firebaseAuth.currentUser;

      return '/home';
    }
  }

  FutureOr<User> loginGoogle() async {
    final googleUser = await googleSignIn.signIn();
    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final userCredentialData =
        await FirebaseAuth.instance.signInWithCredential(credential);
    firebaseUser = userCredentialData.user;
    return firebaseUser;
  }

  void signOut() async {
    await firebaseAuth.signOut();
    Get.offAllNamed("login");
  }
}
