import 'package:flutter/material.dart';
import 'package:loja_virtual/app/di/setup_locator.dart';
import 'package:loja_virtual/app/domain/models/user.dart';
import 'package:loja_virtual/app/domain/usecase/user_usecase_impl.dart';
import 'package:mobx/mobx.dart';

part 'base_viewmodel.g.dart';

class BaseScreenViewModel = _BaseScreenViewModelBase with _$BaseScreenViewModel;

abstract class _BaseScreenViewModelBase with Store {

  final userUsecase = getIt<UserUseCase>();

  PageController pageController = PageController();

  int get page => _page;
  @observable
  int _page;

  User get user => _user;
  @observable
  User _user;

  @observable
  bool isLoggedIn = false;

  @action
  void setPage(int value) {
    if (value == page) return;
    _page = value;
    pageController.jumpToPage(page);
  }

  void setPageController(PageController pgController) {
    pageController = pgController;
  }

  @action
  Future<void> getCurrentUser() async {
    userUsecase.getCurrentUser(onSuccess: (user) {
      isLoggedIn = true;
      getCurrentUserStore(uid: user);
    }, onFail: () {
      isLoggedIn = false;
    });
  }

  @action
  Future<void> getCurrentUserStore({String uid}) async {
    userUsecase.getCurrentUserStore(
        uid: uid,
        onSuccess: (user) {
          isLoggedIn = true;
          final doc = user;
          _user = User.fromDocument(document: doc);
        },
        onFail: () {
          isLoggedIn = false;
        });
  }

  @action
  void signOut({Function onFail, Function onSuccess}) {
    userUsecase.signOut(onSuccess: () {
      onSuccess.call();
    }, onFail: () {
      onFail.call();
    });
  }
}
