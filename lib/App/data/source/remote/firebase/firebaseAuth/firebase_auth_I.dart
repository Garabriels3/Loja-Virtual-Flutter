import 'package:loja_virtual/app/domain/models/result_firebase.dart';
import 'package:loja_virtual/app/domain/models/user.dart';

abstract class FirebaseAuthI {
  Future<VoidResult> signIn({User userRequest});

  Future<VoidResult> signUp({User userRequest});

  Future<void> resetPassword(String email);

  Future<Result> getCurrentUser();

  Future<void> sendEmailVerification();

  Future<VoidResult> signOut();

  Future<bool> isEmailVerified();
}
