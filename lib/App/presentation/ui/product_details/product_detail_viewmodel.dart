import 'package:loja_virtual/app/di/setup_locator.dart';
import 'package:loja_virtual/app/domain/models/cart_manager.dart';
import 'package:loja_virtual/app/domain/models/cart_product.dart';
import 'package:loja_virtual/app/domain/models/item_size.dart';
import 'package:loja_virtual/app/domain/models/products.dart';
import 'package:loja_virtual/app/domain/usecase/user_usecase_impl.dart';
import 'package:mobx/mobx.dart';

part 'product_detail_viewmodel.g.dart';

class ProductDetailsViewModel = _ProductDetailsViewModelBase
    with _$ProductDetailsViewModel;

abstract class _ProductDetailsViewModelBase with Store {
  final userUsecase = getIt<UserUseCase>();

  @observable
  ItemSize selectedSize;

  @observable
  List<ItemSize> itemSize;

  @observable
  Product product;

  CartProduct get cartProduct => _cartProduct;
  @observable
  CartProduct _cartProduct;

  List<CartProduct> get cartManager => _cartManager;
  @observable
  List<CartProduct> _cartManager = [];

  bool get isSelected => _isSelected;
  @observable
  bool _isSelected = false;

  bool get isLoggedIn => _isLoggedIn;
  @observable
  bool _isLoggedIn = false;

  @action
  void stateToggle(ItemSize size) {
    selectedSize = size;
  }

  @action
  Future<void> getCurrentUser() async {
    userUsecase.getCurrentUser(onSuccess: (user) {
      _isLoggedIn = true;
    }, onFail: () {
      _isLoggedIn = false;
    });
  }

  @action
  void getSizesOnInit({List<ItemSize> item}) {
    itemSize = item;
  }
  
  @action
  void getProductOnInit({Product prod}) {
    product = prod;
  }

  @action
  void addOnCart({Product product}) {
    _cartProduct =
        CartProduct.fromProduct(product: product, name: selectedSize.name);
    _cartManager.add(
        CartProduct.fromProduct(product: product, name: selectedSize.name));
  }

  ItemSize get getItemSize {
    if (product == null) return null;
    return itemSize.firstWhere((element) => element.name == _cartProduct.name);
  }

  num get getItemPrice {
    if (product == null) return 0;
    return getItemSize?.price ?? 0;
  }
}
