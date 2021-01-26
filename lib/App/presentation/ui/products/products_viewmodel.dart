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

  String get search => _search;
  @observable
  String _search = "";

  String get onErrorMessage => _onErrorMessage;
  @observable
  String _onErrorMessage = "";

  @action
  onChangeSearch(String newSearch) => _search = newSearch;

  @action
  Future<void> getAllProducts() async {
    await useCase.getAllProducts(onSuccess: (products) {
      _allProducts = products;
    }, onFail: (errorMessage) {
      _onErrorMessage = errorMessage;
    });
  }

  List<Product> get filterProducts {
    final List<Product> fProducts = [];

    if (search.isEmpty) {
      fProducts.addAll(_allProducts);
    } else {
      fProducts.addAll(_allProducts.where((product) =>
          product.name.toLowerCase().contains(search.toLowerCase())));
    }
    return fProducts;
  }

  void setFilterNull() {
    _search = "";
  }
}
