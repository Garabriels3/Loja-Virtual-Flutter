import 'package:loja_virtual/app/di/setup_locator.dart';
import 'package:loja_virtual/app/domain/models/products.dart';
import 'package:loja_virtual/app/domain/usecase/product_usecase_impl.dart';
import 'package:mobx/mobx.dart';

part 'products_viewmodel.g.dart';

class ProductsViewModel = _ProductsViewModelBase with _$ProductsViewModel;

abstract class _ProductsViewModelBase with Store {
  final useCase = getIt<ProductUseCase>();

  List<Product> get allProducts => _allProducts;
  @observable
  List<Product> _allProducts = [];

  String get onErrorMessage => _onErrorMessage;
  @observable
  String _onErrorMessage = "";

  @action
  Future<void> getAllProducts() async {
    await useCase.getAllProducts(onSuccess: (products) {
      _allProducts = products;
    }, onFail: (errorMessage) {
      _onErrorMessage = errorMessage;
    });
  }
}
