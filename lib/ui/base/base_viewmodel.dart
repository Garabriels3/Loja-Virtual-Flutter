import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'base_viewmodel.g.dart';

class BaseScreenViewModel = _BaseScreenViewModelBase with _$BaseScreenViewModel;

abstract class _BaseScreenViewModelBase with Store {

  PageController pageController = PageController();

  int get page => _page;
  @observable
  int _page = 0;

  @action
  void setPage(int value) {
    if (value == page) return;
    _page = value;
    pageController.jumpToPage(page);
  }
}
