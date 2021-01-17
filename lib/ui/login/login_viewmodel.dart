import 'package:flutter/material.dart';
import 'package:loja_virtual/models/result_firebase.dart';
import 'package:loja_virtual/models/user.dart';
import 'package:loja_virtual/service/firebaseAuth/firebase_auth_I.dart';
import 'package:loja_virtual/service/firebaseAuth/firebase_auth_impl.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
part 'login_viewmodel.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store {
  final auth = FireBaseAuthImpl();

  @observable
  String email = "";

  @observable
  String password = "";

  @action
  changeEmail(String newEmail) => email = newEmail;

  @action
  changePassword(String newPassword) => password = newPassword;

  Future<void> signUser({Function onFail, Function onSuccess}) async {
    auth
        .signIn(userRequest: User(email: email, password: password))
        .then((value) {
      if (!value.success) {
        onFail(value.errorMessage);
      } else {
        onSuccess(value.userId);
      }
    });
  }
}
