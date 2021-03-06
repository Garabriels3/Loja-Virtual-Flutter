import 'package:loja_virtual/app/di/setup_locator.dart';
import 'package:loja_virtual/app/domain/models/user.dart';
import 'package:loja_virtual/app/domain/usecase/user_usecase_impl.dart';
import 'package:mobx/mobx.dart';

part 'sign_up_viewmodel.g.dart';

class SignUpViewModel = _SignUpViewModelBase with _$SignUpViewModel;

abstract class _SignUpViewModelBase with Store {
  final userCase = getIt<UserUseCase>();

  String get name => _name;
  @observable
  String _name = "";

  String get email => _email;
  @observable
  String _email = "";

  String get pass => _pass;
  @observable
  String _pass = "";

  String get passConfirmation => _passConfirmation;
  @observable
  String _passConfirmation = "";

  bool get loading => _loading;
  @observable
  bool _loading = false;

  bool get snackError => _snackError;
  @observable
  bool _snackError = false;

  @action
  onNameChanged(String newName) => _name = newName;

  @action
  onEmailChanged(String newEmail) => _email = newEmail;

  @action
  onPassChanged(String newPass) => _pass = newPass;

  @action
  onPassConfirmationChanged(String newPassConfirmation) =>
      _passConfirmation = newPassConfirmation;

  void signUpUser({Function onFail, Function onSuccess}) {
    _loading = true;
    userCase
        .signUp(
            user: User(
                email: email.trim(),
                name: name.trim(),
                password: pass.trim(),
                passwordConfirmation: passConfirmation.trim()))
        .then((value) {
      if (!value.success) {
        onFail(value.errorMessage);
        _loading = false;
        _snackError = true;
      } else {
        onSuccess(value.userId);
        createUserOnFireStore(uid: value.userId);
        _loading = false;
      }
    });
  }

  void createUserOnFireStore({String uid}) {
    userCase.createUserStore(
        userUid: uid,
        user: User(
            email: email.trim(),
            name: name.trim(),
            password: pass.trim(),
            passwordConfirmation: passConfirmation.trim()));
  }

  void validateConfirmationPass({Function onFail, Function onSuccess}) {
    if (pass == passConfirmation) {
      onSuccess();
    } else {
      onFail("As senhas não batem!");
    }
  }
}
