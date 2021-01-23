import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:loja_virtual/helpers/firebase_errors.dart';
import 'package:loja_virtual/models/result_firebase.dart';
import 'package:loja_virtual/models/user.dart';
import 'package:loja_virtual/service/firebaseAuth/firebase_auth_I.dart';

class FireBaseAuthImpl implements FirebaseAuthI {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<void> getCurrentUser({Function onFail, Function onSuccess}) async {
    try {
      FirebaseUser user = await _auth.currentUser();
      onSuccess(user);
    } on PlatformException catch (e) {
      return onFail(errorMessage: getErrorString(e.code));
    }
  }

  @override
  Future<bool> isEmailVerified() {
    // TODO: implement isEmailVerified
    throw UnimplementedError();
  }

  @override
  Future<void> resetPassword(String email) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<void> sendEmailVerification() {
    // TODO: implement sendEmailVerification
    throw UnimplementedError();
  }

  @override
  Future<VoidResult> signIn({User userRequest}) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: userRequest.email, password: userRequest.password);
      FirebaseUser user = result.user;
      return VoidResult(userId: user.uid);
    } on PlatformException catch (e) {
      return VoidResult(errorMessage: getErrorString(e.code));
    }
  }

  @override
  Future<void> signOut({Function onFail, Function onSuccess}) {
    try {
      _auth.signOut();
      onSuccess();
    } on PlatformException catch (e) {
        onFail(error: getErrorString(e.code));
    }
  }

  @override
  Future<VoidResult> signUp({User userRequest}) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: userRequest.email, password: userRequest.password);
      FirebaseUser user = result.user;
      return VoidResult(userId: user.uid);
    } on PlatformException catch (e) {
      return VoidResult(errorMessage: getErrorString(e.code));
    }
  }
}
