import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loja_virtual/app/di/setup_locator.dart';
import 'package:loja_virtual/app/domain/models/products.dart';
import 'package:loja_virtual/app/presentation/ui/product_details/product_detail_viewmodel.dart';
import 'package:loja_virtual/shared/resources/dimens.dart';
import 'package:mobx/mobx.dart';

import 'components/size_widget.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  ProductDetailPage({this.product});

  @override
  Widget build(BuildContext context) {
    final viewmodel = getIt<ProductDetailsViewModel>();
    viewmodel.getCurrentUser();
    viewmodel.getSizesOnInit(item: product.sizes);
    viewmodel.getProductOnInit(prod: product);
    final dispose = autorun((_) => viewmodel.selectedSize = null);

    dispose();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(product.name),
      ),
      body: ListView(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Carousel(
              images: product.images.map((url) {
                return NetworkImage(url);
              }).toList(),
              dotSize: four,
              dotBgColor: Colors.transparent,
              dotColor: Theme.of(context).primaryColor,
              autoplay: false,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(sixteen),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  product.name,
                  style:
                      TextStyle(fontSize: twenty, fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: EdgeInsets.only(top: eight),
                  child: Text(
                    "A partir de",
                    style: TextStyle(color: Colors.grey[600], fontSize: twelve),
                  ),
                ),
                Observer(builder: (_) {
                  return Text(
                    viewmodel.selectedSize != null
                        ? "R\$ ${viewmodel.selectedSize.price}"
                        : "R\$",
                    style: TextStyle(
                        fontSize: twentyFour,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor),
                  );
                }),
                Padding(
                  padding: const EdgeInsets.only(top: sixteen, bottom: eight),
                  child: Text(
                    "Descrição",
                    style: TextStyle(
                      fontSize: sixteen,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Text(
                  product.description,
                  style: TextStyle(fontSize: sixteen),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: sixteen, bottom: eight),
                  child: Text(
                    "Tamanhos",
                    style: TextStyle(
                      fontSize: sixteen,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Wrap(
                    spacing: eight,
                    runSpacing: eight,
                    children: product.sizes.map((s) {
                      return SizeWidget(
                        sizes: s,
                      );
                    }).toList()),
                SizedBox(
                  height: twenty,
                ),
                SizedBox(
                  height: fortyFour,
                  child: Observer(builder: (_) {
                    return RaisedButton(
                      onPressed: viewmodel.selectedSize != null
                          ? () {
                              if (viewmodel.isLoggedIn) {
                                viewmodel.addOnCart(product: product);
                                Navigator.of(context).pushNamed("/cart");
                              } else {
                                Navigator.of(context).pushNamed("/login");
                              }
                            }
                          : null,
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      child: Text(
                        viewmodel.isLoggedIn
                            ? "Adicionar ao carrinho"
                            : "Entrar para comprar",
                        style: TextStyle(fontSize: eighteen),
                      ),
                    );
                  }),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
