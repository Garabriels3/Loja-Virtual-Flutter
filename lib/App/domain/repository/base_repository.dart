import 'package:loja_virtual/App/domain/models/result_firebase.dart';

abstract class BaseRepository {
  Future<Result> getCurrentUserUid();
  Future<Result> getCurrentUserStore({String uid});
  Future<VoidResult> signOut();
}
