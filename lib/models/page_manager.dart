import 'package:flutter/material.dart';

class PageManager {
  PageManager({this.pageController});

  PageController pageController;

  int page;

  void setPage(int value) {
    if (value == page) return;
    page = value;
    pageController.jumpToPage(page);
  }
}
