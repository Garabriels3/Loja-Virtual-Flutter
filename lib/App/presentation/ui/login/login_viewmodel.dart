import 'package:get_it/get_it.dart';
import 'package:loja_virtual/App/data/source/remote/firebase/firebaseAuth/firebase_auth_I.dart';
import 'package:loja_virtual/App/data/source/remote/firebase/firebaseStore/firebase_store_I.dart';
import 'package:loja_virtual/App/di/setup_locator.dart';
import 'package:loja_virtual/App/domain/models/user.dart';
import 'package:mobx/mobx.dart';
part 'login_viewmodel.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store {
  final _authI = getIt<FirebaseAuthI>();
  final store = getIt<FirebaseStoreI>();

  String get email => _email;
  @observable
  String _email = "";

  String get password => _password;
  @observable
  String _password = "";

  User get user => _user;
  @observable
  User _user;

  bool get loading => _loading;
  @observable
  bool _loading = false;

  bool get isLoggedIn => _user != null;

  @action
  changeEmail(String newEmail) => _email = newEmail;

  @action
  changePassword(String newPassword) => _password = newPassword;

  Future<void> signUser({Function onFail, Function onSuccess}) async {
    setLoading(true);
    _authI
        .signIn(
            userRequest: User(email: email.trim(), password: password.trim()))
        .then((value) async {
      if (!value.success) {
        onFail(value.errorMessage);
        setLoading(false);
      } else {
        onSuccess(value.userId);
        setLoading(false);
      }
    });
  }

  @action
  void setLoading(bool isLoading) {
    _loading = isLoading;
  }
}
