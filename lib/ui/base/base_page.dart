import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loja_virtual/common/custom_drawer/custom_drawer.dart';
import 'package:loja_virtual/core/strings.dart';
import 'package:loja_virtual/ui/base/base_viewmodel.dart';
import 'package:loja_virtual/ui/login/login_viewmodel.dart';
import 'package:provider/provider.dart';

class BaseScreen extends StatelessWidget {
  final pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    final viewmodel = Provider.of<LoginViewModel>(context);
    viewmodel.getCurrentUser();
    return Provider(
      create: (_) => BaseScreenViewModel(pageController: pageController),
      child: Observer(builder: (_) {
        return PageView(
          controller: pageController,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            Scaffold(
              drawer: CustomDrawer(),
              appBar: AppBar(
                title: Text(HOME_LABEL),
              ),
            ),
            Scaffold(
              drawer: CustomDrawer(),
              appBar: AppBar(
                title: Text("HOme2"),
              ),
            ),
            Scaffold(
              drawer: CustomDrawer(),
              appBar: AppBar(
                title: Text("HOme3"),
              ),
            ),
            Scaffold(
              drawer: CustomDrawer(),
              appBar: AppBar(
                title: Text("HOme4"),
              ),
            ),
          ],
        );
      }),
    );
  }
}
