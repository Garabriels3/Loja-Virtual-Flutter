import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:loja_virtual/helpers/firebase_errors.dart';
import 'package:loja_virtual/models/result_firebase.dart';
import 'package:loja_virtual/models/user.dart';
import 'package:loja_virtual/service/firebaseAuth/firebase_auth_I.dart';

class FireBaseAuthImpl implements FirebaseAuthI {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future<String> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
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
      AuthResult result = await auth.signInWithEmailAndPassword(
          email: userRequest.email, password: userRequest.password);
      FirebaseUser user = result.user;
      return VoidResult(userId: user.uid);
    } on PlatformException catch (e) {
      return VoidResult(errorMessage: getErrorString(e.code));
    }
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<void> signUp({User user, Function onFail, Function onSuccess}) async {
    try {
      final AuthResult result = await auth.createUserWithEmailAndPassword(
          email: user.email, password: user.password);
      onSuccess(result.user.uid);
    } on PlatformException catch (e) {
      onFail(getErrorString(e.code));
    }
  }
}
