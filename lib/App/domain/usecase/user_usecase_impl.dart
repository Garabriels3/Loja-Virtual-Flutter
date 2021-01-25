import 'package:firebase_auth/firebase_auth.dart';
import 'package:loja_virtual/App/di/setup_locator.dart';
import 'package:loja_virtual/app/domain/models/result_firebase.dart';
import 'package:loja_virtual/app/domain/models/user.dart';
import 'package:loja_virtual/app/domain/repository/user_repository.dart';

abstract class UserUseCase {
  Future<void> getCurrentUser({Function onSuccess, Function onFail});

  Future<void> getCurrentUserStore(
      {String uid, Function onSuccess, Function onFail});

  Future<void> signOut({Function onSuccess, Function onFail});

  Future<VoidResult> signIn({User user});

  Future<VoidResult> signUp({User user});

  Future<VoidResult> createUserStore({String userUid, User user});
}

class UserUseCaseImpl implements UserUseCase {
  final userRepository = getIt<UserRepository>();

  Future<void> getCurrentUser({Function onSuccess, Function onFail}) async {
    await userRepository.getCurrentUserUid().then((value) {
      FirebaseUser user = value.item as FirebaseUser;
      if (user != null) {
        onSuccess(user.uid);
      } else {
        onFail.call();
      }
    });
  }

  @override
  Future<void> signOut({Function onSuccess, Function onFail}) async {
    await userRepository.signOut().then((value) {
      if (value.success) {
        onSuccess();
      } else {
        onFail();
      }
    });
  }

  @override
  Future<void> getCurrentUserStore(
      {String uid, Function onSuccess, Function onFail}) async {
    await userRepository.getCurrentUserStore(uid: uid).then((value) {
      if (value.success) {
        onSuccess(value.item);
      } else {
        onFail(value.errorMessage);
      }
    });
  }

  @override
  Future<VoidResult> createUserStore({String userUid, User user}) async {
    return userRepository.createUserStore(userUid: userUid, user: user);
  }

  @override
  Future<VoidResult> signIn({User user}) async {
    return userRepository.signIn(user: user);
  }

  @override
  Future<VoidResult> signUp({User user}) async {
    return userRepository.signUp(user: user);
  }
}
