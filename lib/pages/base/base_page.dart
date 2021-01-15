import 'package:flutter/material.dart';
import 'package:loja_virtual/common/custom_drawer/custom_drawer.dart';
import 'package:loja_virtual/models/page_manager.dart';
import 'package:provider/provider.dart';

class BaseScreen extends StatelessWidget {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => PageManager(pageController: pageController),
      child: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Scaffold(
            drawer: CustomDrawer(),
            appBar: AppBar(
              title: Text("Home"),
            ),
          ),
          Container(
            child: RaisedButton(
              color: Colors.yellow,
              child: Text("MONIKE LINDA"),
              onPressed: () {
                pageController.jumpToPage(1);
              },
            ),
          ),
          Container(
            child: RaisedButton(
              child: Text("É"),
              color: Colors.red,
              onPressed: () {
                pageController.jumpToPage(2);
              },
            ),
          ),
          Container(
            child: RaisedButton(
              color: Colors.blue,
              child: Text("SUPER LINDA"),
              onPressed: () {
                pageController.jumpToPage(0);
              },
            ),
          ),
        ],
      ),
    );
  }
}
