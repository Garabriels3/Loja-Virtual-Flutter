import 'package:loja_virtual/models/result_firebase.dart';
import 'package:loja_virtual/models/user.dart';

abstract class FirebaseAuthI {
  Future<VoidResult> signIn({User userRequest});

  Future<VoidResult> signUp({User userRequest});

  Future<void> resetPassword(String email);

  Future<void> getCurrentUser({Function onFail, Function onSuccess});

  Future<void> sendEmailVerification();

  Future<void> signOut();

  Future<bool> isEmailVerified();
}
