import 'package:loja_virtual/App/data/source/remote/firebase/firebaseAuth/firebase_auth_I.dart';
import 'package:loja_virtual/App/data/source/remote/firebase/firebaseStore/firebase_store_I.dart';
import 'package:loja_virtual/App/di/setup_locator.dart';
import 'package:loja_virtual/App/domain/models/result_firebase.dart';
import 'package:loja_virtual/App/domain/repository/base_repository.dart';

class BaseRepositoryImpl implements BaseRepository {
  final _authI = getIt<FirebaseAuthI>();
  final _store = getIt<FirebaseStoreI>();

  @override
  Future<Result> getCurrentUserUid() async {
    return _authI.getCurrentUser();
  }
  
  @override
  Future<Result> getCurrentUserStore({String uid}) async {
    return _store.getUserDocument(uid: uid);
  }

  @override
  Future<VoidResult> signOut() async {
    return _authI.signOut();
  }
}
