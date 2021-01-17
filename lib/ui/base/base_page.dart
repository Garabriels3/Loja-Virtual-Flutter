import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loja_virtual/common/custom_drawer/custom_drawer.dart';
import 'package:loja_virtual/core/strings.dart';
import 'package:loja_virtual/ui/base/base_viewmodel.dart';
import 'package:loja_virtual/ui/login/login_page.dart';
import 'package:provider/provider.dart';

class BaseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewmodel = Provider.of<BaseScreenViewModel>(context);

    return Observer(builder: (_) {
      return PageView(
        controller: viewmodel.pageController,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          LoginPage(),
          Scaffold(
            drawer: CustomDrawer(),
            appBar: AppBar(
              title: Text(HOME_LABEL),
            ),
          ),
        ],
      );
    });
  }
}
