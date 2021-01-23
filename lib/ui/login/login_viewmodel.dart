import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/models/user.dart';
import 'package:loja_virtual/service/firebaseAuth/firebase_auth_impl.dart';
import 'package:loja_virtual/service/firebaseStore/firebase_store_Impl.dart';
import 'package:mobx/mobx.dart';
part 'login_viewmodel.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store {
  final auth = FireBaseAuthImpl();
  final store = FirebaseStoreImpl();

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
    auth
        .signIn(
            userRequest: User(email: email.trim(), password: password.trim()))
        .then((value) async {
      if (!value.success) {
        onFail(value.errorMessage);
        setLoading(false);
      } else {
        onSuccess(value.userId);
        setLoading(false);
        getCurrentUser(uid: value.userId);
      }
    });
  }

  @action
  Future<void> getCurrentUser({String uid}) async {
    if (uid != null) {
      store.getUserDocument(
          uid: uid,
          onSuccess: (docRef) {
            final doc = docRef;
            _user = User.fromDocument(document: doc);
            print(_user.email);
          });
    } else {
      auth.getCurrentUser(onFail: (e) {
        debugPrint(e);
      }, onSuccess: (user) async {
        if (user != null) {
          await store.getUserDocument(
              uid: user.uid,
              onSuccess: (docRef) {
                final doc = docRef;
                _user = User.fromDocument(document: doc);
                print(_user.email);
              });
        }
      });
    }
  }

  @action
  void signOut({Function onFail, Function onSuccess}) {
    auth.signOut(onSuccess: () {
      onSuccess.call();
    }, onFail: () {
      onFail.call();
    });
  }

  @action
  void setLoading(bool isLoading) {
    _loading = isLoading;
  }
}
