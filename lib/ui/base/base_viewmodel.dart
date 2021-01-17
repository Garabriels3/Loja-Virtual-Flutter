import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'base_viewmodel.g.dart';

class BaseScreenViewModel = _BaseScreenViewModelBase with _$BaseScreenViewModel;

abstract class _BaseScreenViewModelBase with Store {

  PageController pageController = PageController();

  @observable
  int page;

  @action
  void setPage(int value) {
    if (value == page) return;
    page = value;
    pageController.jumpToPage(page);
  }
}
