import 'package:flutter/material.dart';
import 'package:loja_virtual/app/domain/models/products.dart';
import 'package:loja_virtual/shared/resources/dimens.dart';

class ProductListTile extends StatelessWidget {
  final Product product;

  ProductListTile({this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed("/productDetails", arguments: product);
      },
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(four)),
        child: Container(
          height: hundred,
          padding: EdgeInsets.all(eight),
          child: Row(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Image.network(
                    "https://static.wikia.nocookie.net/kirby/images/7/71/Kirby_KSA_Arte.png/revision/latest?cb=20200704132348&path-prefix=pt-br"),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: TextStyle(
                          fontSize: sixteen, fontWeight: FontWeight.w800),
                    ),
                    Padding(
                      padding: EdgeInsets.all(four),
                      child: Text(
                        "A partir de",
                        style: TextStyle(
                            color: Colors.grey[400], fontSize: twelve),
                      ),
                    ),
                    Text(
                      "R\$ 19,99",
                      style: TextStyle(
                          fontSize: sixteen,
                          fontWeight: FontWeight.w800,
                          color: Theme.of(context).primaryColor),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
