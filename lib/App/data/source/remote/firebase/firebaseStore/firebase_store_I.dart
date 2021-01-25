import 'package:loja_virtual/app/domain/models/result_firebase.dart';
import 'package:loja_virtual/app/domain/models/user.dart';

abstract class FirebaseStoreI {
  Future<VoidResult> createUser(String userUID, User user);
  Future<Result> getUserDocument({String uid});
}
