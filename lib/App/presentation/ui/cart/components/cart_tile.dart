import 'package:flutter/material.dart';
import 'package:loja_virtual/app/di/setup_locator.dart';
import 'package:loja_virtual/app/domain/models/cart_product.dart';
import 'package:loja_virtual/app/presentation/ui/product_details/product_detail_viewmodel.dart';
import 'package:loja_virtual/shared/resources/dimens.dart';

class CartTile extends StatelessWidget {
  CartTile({this.cartProduct});

  final CartProduct cartProduct;
  @override
  Widget build(BuildContext context) {
    final viewmodel = getIt<ProductDetailsViewModel>();

    return Card(
      margin: EdgeInsets.symmetric(horizontal: sixteen, vertical: four),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: sixteen, vertical: eight),
        child: Row(
          children: [
            SizedBox(
              height: eighty,
              width: eighty,
              child: Image.network(cartProduct.product.images.first),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: sixteen),
                child: Column(
                  children: [
                    Text(
                      cartProduct.product.name,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: sixteen,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: eight),
                      child: Text(
                        "Tamanho ${cartProduct.size}",
                        style: TextStyle(fontWeight: FontWeight.w300),
                      ),
                    ),
                    Text(
                      "R\$ ${viewmodel.getItemPrice.toStringAsFixed(2)}",
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Theme.of(context).primaryColor),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
