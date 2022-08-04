import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:app/models/user.dart';

enum AccountType { member, business }

AccountType stringToAccountType(String accountType) {
  switch (accountType) {
    case 'member':
      return AccountType.member;
    case 'business':
      return AccountType.business;
    default:
      throw Exception('Invalid accountType cannot convert "$accountType"');
  }
}

final controller = StreamController<UserObject?>.broadcast();

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  AuthenticationService(this._firebaseAuth, this._firestore);

  Stream<UserObject?> get authStateChanges => controller.stream;
  static UserObject? userObject;

  static Future<UserObject?> init() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      controller.sink.add(null);
      return null;
    }

    final doc = FirebaseFirestore.instance.collection('users').doc(user.uid);
    final data = await doc.get();

    userObject = UserObject(
      fullName: user.displayName!,
      email: user.email!,
      accountType: stringToAccountType(data.get('accountType')),
      dateOfBirth: data.get('dateOfBirth'),
      referralCode: data.get('referralCode'),
      userCredential: user,
    );

    controller.sink.add(userObject);
    return userObject;
  }

  bool isUserLoggedIn() {
    return _firebaseAuth.currentUser != null;
  }

  Future<UserObject?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final user = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final doc = _firestore.collection('users').doc(user.user?.uid);
      final data = await doc.get();

      userObject = UserObject(
        fullName: user.user!.displayName!,
        email: user.user!.email!,
        accountType: stringToAccountType(data.get('accountType')),
        dateOfBirth: data.get('dateOfBirth'),
        referralCode: data.get('referralCode'),
        userCredential: user.user,
      );

      controller.sink.add(userObject);
      return userObject;
    } on FirebaseAuthException {
      rethrow;
    }
  }

  Future<UserObject?> signUp({
    required String email,
    required String password,
    required String displayName,
    required String dateOfBirth,
    required String referralCode,
    required AccountType accountType,
    required String? category,
  }) async {
    try {
      final user = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await user.user?.updateDisplayName(displayName);
      final doc = _firestore.collection('users').doc(user.user?.uid);

      await doc.set({
        'dateOfBirth': dateOfBirth,
        'referralCode': referralCode,
        'accountType': accountType.name,
        'category': category,
      });

      userObject = UserObject(
        fullName: displayName,
        email: email,
        accountType: accountType,
        dateOfBirth: dateOfBirth,
        referralCode: referralCode,
        userCredential: user.user,
      );

      controller.sink.add(userObject);
      return userObject;
    } on Exception {
      rethrow;
    }
  }

  Future<bool> signOut() async {
    try {
      await _firebaseAuth.signOut();
      controller.sink.add(null);
      return true;
    } on FirebaseAuthException {
      rethrow;
    }
  }

  Future<UserObject?> getUser() async {
    if (userObject != null) {
      return userObject;
    }

    try {
      final user = _firebaseAuth.currentUser;
      final doc = _firestore.collection('users').doc(user?.uid);
      final data = await doc.get();

      userObject = UserObject(
        fullName: user!.displayName!,
        email: user.email!,
        accountType: stringToAccountType(data.get('accountType')),
        dateOfBirth: data.get('dateOfBirth'),
        referralCode: data.get('referralCode'),
        userCredential: user,
      );

      controller.sink.add(userObject);
      return userObject;
    } on Exception {
      return null;
    }
  }

  void sendPasswordResetEmail(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException {
      rethrow;
    }
  }

  String handleFirebaseError(error) {
    if (error is FirebaseAuthException) {
      return error.message.toString();
    }

    return error.toString();
  }
}
