import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:loja_virtual/App/domain/models/result_firebase.dart';
import 'package:loja_virtual/App/domain/models/user.dart';
import 'package:loja_virtual/shared/helpers/firebase_errors.dart';
import 'firebase_auth_I.dart';

class FireBaseAuthImpl implements FirebaseAuthI {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<Result> getCurrentUser() async {
    try {
      FirebaseUser user = await _auth.currentUser();
      return Result(item: user);
    } on PlatformException catch (e) {
      return Result(item: e.code);
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
  Future<VoidResult> signOut() async {
    try {
      await _auth.signOut();
      return VoidResult();
    } on PlatformException catch (e) {
      return VoidResult(errorMessage: getErrorString(e.code));
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
