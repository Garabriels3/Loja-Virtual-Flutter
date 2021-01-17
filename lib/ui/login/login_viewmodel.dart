import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/models/user.dart';
import 'package:loja_virtual/service/firebaseAuth/firebase_auth_impl.dart';
import 'package:mobx/mobx.dart';
part 'login_viewmodel.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store {
  final auth = FireBaseAuthImpl();

  String get email => _email;
  @observable
  String _email = "";

  String get password => _password;
  @observable
  String _password = "";

  FirebaseUser get currentUser => _currentUser;
  @observable
  FirebaseUser _currentUser;

  bool get loading => _loading;
  @observable
  bool _loading = false;

  @action
  changeEmail(String newEmail) => _email = newEmail;

  @action
  changePassword(String newPassword) => _password = newPassword;

  Future<void> signUser({Function onFail, Function onSuccess}) async {
    setLoading(true);
    auth
        .signIn(userRequest: User(email: email, password: password))
        .then((value) {
      if (!value.success) {
        onFail(value.errorMessage);
        setLoading(false);
      } else {
        onSuccess(value.userId);
        setLoading(false);
        getCurrentUser();
      }
    });
  }

  @action
  void getCurrentUser() {
    auth.getCurrentUser(onSuccess: (item) {
      _currentUser = item;
      debugPrint(_currentUser.uid);
    }, onFail: (e) {
      debugPrint(e);
    });
  }

  @action
  void setLoading(bool isLoading) {
    _loading = isLoading;
  }
}
