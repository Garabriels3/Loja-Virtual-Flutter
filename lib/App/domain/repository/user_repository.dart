import 'package:loja_virtual/app/domain/models/result_firebase.dart';
import 'package:loja_virtual/app/domain/models/user.dart';

abstract class UserRepository {
  Future<Result> getCurrentUserUid();
  Future<Result> getCurrentUserStore({String uid});
  Future<VoidResult> signOut();
  Future<VoidResult> signIn({User user});
  Future<VoidResult> signUp({User user});
  Future<VoidResult> createUserStore({String userUid, User user});
}
