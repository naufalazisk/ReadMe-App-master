import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';

import '../models/user.dart';

class Authentication with ChangeNotifier {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  String displayName = "";
  String email = "";
  String imageUrl = "";
  String uid = "";

  UserAttributes? _userFromFirebase(auth.User? user) {
    if (user == null) {
      return null;
    }
    return UserAttributes(user.uid, user.email);
  }

  Stream<UserAttributes?>? get user {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

  Future<UserAttributes?> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    getUserDetail();
    return _userFromFirebase(credential.user);
  }

  Future<UserAttributes?> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    getUserDetail();
    return _userFromFirebase(credential.user);
  }

  Future<void> updateUserData(
      String name, String email, String imageUrl) async {
    _firebaseAuth.currentUser!.updateDisplayName(name);
    _firebaseAuth.currentUser!.updateEmail(email);
    _firebaseAuth.currentUser!.updatePhotoURL(imageUrl);
    _firebaseAuth.currentUser!.reload();
    displayName = name;
    imageUrl = imageUrl;
    email = email;

    notifyListeners();
  }

  Future<void> getUserDetail() async {
    uid = await _firebaseAuth.currentUser!.uid;
    displayName = await _firebaseAuth.currentUser!.displayName ?? "NN";
    imageUrl = await _firebaseAuth.currentUser!.photoURL ?? "NN";
    email = await _firebaseAuth.currentUser!.email ?? "NN";
    notifyListeners();
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}
