// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import '../../global/toast.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential crendential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return crendential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        showToast(message: "The email address is already in use");
      } else {
        showToast(message: "An error occurred ${e.code}");
      }
    }
    return null;
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential crendential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return crendential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        showToast(message: "Invalid email or password");
      } else {
        showToast(message: "An error occurred: ${e.code}");
      }
    }
    return null;
  }
}
