import 'package:loja_virtual/models/result_firebase.dart';
import 'package:loja_virtual/models/user.dart';

abstract class FirebaseStoreI {
  Future<VoidResult> createUser(String userUID, User user);
}
