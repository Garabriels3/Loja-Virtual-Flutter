import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'base_viewmodel.g.dart';

class BaseScreenViewModel = _BaseScreenViewModelBase with _$BaseScreenViewModel;

abstract class _BaseScreenViewModelBase with Store {
  _BaseScreenViewModelBase({this.pageController});

  PageController pageController = PageController();

  int get page => _page;
  @observable
  int _page;

  @action
  void setPage(int value) {
    if (value == page) return;
    _page = value;
    if (pageController.hasClients) {
      pageController.jumpToPage(page);
    }
  }
}
