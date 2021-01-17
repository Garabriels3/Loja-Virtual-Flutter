import 'package:loja_virtual/models/result_firebase.dart';
import 'package:loja_virtual/models/user.dart';

abstract class FirebaseAuthI {
  Future<VoidResult> signIn({User userRequest});

  Future<void> signUp({User user, Function onFail, Function onSuccess});

  Future<void> resetPassword(String email);

  Future<String> getCurrentUser();

  Future<void> sendEmailVerification();

  Future<void> signOut();

  Future<bool> isEmailVerified();
}
