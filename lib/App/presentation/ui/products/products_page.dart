import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loja_virtual/app/di/setup_locator.dart';
import 'package:loja_virtual/app/presentation/ui/common/custom_drawer/custom_drawer.dart';
import 'package:loja_virtual/app/presentation/ui/products/products_viewmodel.dart';
import 'package:loja_virtual/shared/resources/dimens.dart';

import 'components/product_list_tile.dart';

class ProductsPage extends StatelessWidget {
  final viewmodel = getIt<ProductsViewModel>();

  @override
  Widget build(BuildContext context) {
    viewmodel.getAllProducts();
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text("Produtos"),
        centerTitle: true,
      ),
      body: Observer(builder: (_) {
        return ListView.builder(
          itemCount: viewmodel.allProducts.length,
          padding: EdgeInsets.all(eight),
          itemBuilder: (_, index) {
            return ProductListTile(
              product: viewmodel.allProducts[index],
            );
          },
        );
      }),
    );
  }
}
