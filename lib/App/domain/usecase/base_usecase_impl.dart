import 'package:firebase_auth/firebase_auth.dart';
import 'package:loja_virtual/App/di/setup_locator.dart';
import 'package:loja_virtual/App/domain/repository/base_repository.dart';

abstract class BaseUseCase {
  Future<void> getCurrentUser({Function onSuccess, Function onFail});
  Future<void> getCurrentUserStore(
      {String uid, Function onSuccess, Function onFail});
  Future<void> signOut({Function onSuccess, Function onFail});
}

class BaseUseCaseImpl implements BaseUseCase {
  final baseRepository = getIt<BaseRepository>();

  Future<void> getCurrentUser({Function onSuccess, Function onFail}) async {
    await baseRepository.getCurrentUserUid().then((value) {
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
    await baseRepository.signOut().then((value) {
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
    await baseRepository.getCurrentUserStore(uid: uid).then((value) {
      if (value.success) {
        onSuccess(value.item);
      } else {
        onFail(value.errorMessage);
      }
    });
  }
}
