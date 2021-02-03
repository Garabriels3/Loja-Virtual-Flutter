import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/app/di/setup_locator.dart';
import 'package:loja_virtual/app/presentation/ui/product_details/product_detail_viewmodel.dart';

import 'components/cart_tile.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewmodel = getIt<ProductDetailsViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Carrinho"),
        centerTitle: true,
      ),
      body: Column(
        children: viewmodel.cartManager
            .map(
              (cartProduct) => CartTile(cartProduct: cartProduct),
            )
            .toList(),
      ),
    );
  }
}
