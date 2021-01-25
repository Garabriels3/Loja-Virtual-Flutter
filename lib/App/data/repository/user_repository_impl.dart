import 'package:loja_virtual/app/data/source/remote/firebase/firebaseAuth/firebase_auth_I.dart';
import 'package:loja_virtual/app/data/source/remote/firebase/firebaseStore/firebase_store_I.dart';
import 'package:loja_virtual/app/di/setup_locator.dart';
import 'package:loja_virtual/app/domain/models/result_firebase.dart';
import 'package:loja_virtual/app/domain/models/user.dart';
import 'package:loja_virtual/app/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
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

  @override
  Future<VoidResult> signIn({User user}) async {
    return _authI.signIn(userRequest: user);
  }

  @override
  Future<VoidResult> signUp({User user}) async{
    return _authI.signUp(userRequest: user);
  }

  @override
  Future<VoidResult> createUserStore({String userUid, User user}) async {
    return _store.createUser(userUid, user);
  }
}
