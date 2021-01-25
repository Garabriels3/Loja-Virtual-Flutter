import 'package:cloud_firestore/cloud_firestore.dart';import 'package:loja_virtual/app/di/setup_locator.dart';import 'package:loja_virtual/app/domain/models/products.dart';import 'package:loja_virtual/app/domain/repository/product_repository.dart';abstract class ProductUseCase {  Future<void> getAllProducts({Function onSuccess, Function onFail});}class ProductUseCaseImpl implements ProductUseCase {  final productRepository = getIt<ProductRepository>();  @override  // ignore: missing_return  Future<void> getAllProducts({Function onSuccess, Function onFail}) async {    await productRepository.getAllProducts().then((value) {      if (value.success) {        QuerySnapshot snapshot = value.item;        List<Product> allProducts = snapshot.documents            .map((docs) => Product.fromDocument(docs))            .toList();        onSuccess(allProducts);      } else {        onFail(value.errorMessage);      }    });  }}