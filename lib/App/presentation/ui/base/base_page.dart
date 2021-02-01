import 'package:flutter/material.dart';
import 'package:loja_virtual/app/di/setup_locator.dart';
import 'package:loja_virtual/app/presentation/ui/common/custom_drawer/custom_drawer.dart';
import 'package:loja_virtual/app/presentation/ui/home/home_page.dart';
import 'package:loja_virtual/app/presentation/ui/products/products_page.dart';
import 'package:loja_virtual/shared/resources/strings.dart';
import 'package:lottie/lottie.dart';
import 'base_viewmodel.dart';

class BaseScreen extends StatelessWidget {
  final pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    final viewModel = getIt<BaseScreenViewModel>();
    
    viewModel.setPageController(pageController);
    viewModel.getCurrentUser();

    return PageView(
      controller: pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        HomePage(),
        ProductsPage(),
        Scaffold(
          drawer: CustomDrawer(),
          appBar: AppBar(
            title: Text("Meus pedidos"),
          ),
        ),
        Scaffold(
          drawer: CustomDrawer(),
          appBar: AppBar(
            title: Text("Loja"),
          ),
        ),
      ],
    );
  }
}
