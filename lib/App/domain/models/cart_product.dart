import 'package:loja_virtual/app/domain/models/products.dart';

class CartProduct {
  Product product;
  String name;

  CartProduct.fromProduct({this.product, this.name}) {
    productId = product.id;
    quantity = 1;
    size = name;
  }

  String productId;
  int quantity;
  String size;
}
