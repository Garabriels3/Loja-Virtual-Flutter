// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductDetailsViewModel on _ProductDetailsViewModelBase, Store {
  final _$selectedSizeAtom =
      Atom(name: '_ProductDetailsViewModelBase.selectedSize');

  @override
  ItemSize get selectedSize {
    _$selectedSizeAtom.reportRead();
    return super.selectedSize;
  }

  @override
  set selectedSize(ItemSize value) {
    _$selectedSizeAtom.reportWrite(value, super.selectedSize, () {
      super.selectedSize = value;
    });
  }

  final _$itemSizeAtom = Atom(name: '_ProductDetailsViewModelBase.itemSize');

  @override
  List<ItemSize> get itemSize {
    _$itemSizeAtom.reportRead();
    return super.itemSize;
  }

  @override
  set itemSize(List<ItemSize> value) {
    _$itemSizeAtom.reportWrite(value, super.itemSize, () {
      super.itemSize = value;
    });
  }

  final _$productAtom = Atom(name: '_ProductDetailsViewModelBase.product');

  @override
  Product get product {
    _$productAtom.reportRead();
    return super.product;
  }

  @override
  set product(Product value) {
    _$productAtom.reportWrite(value, super.product, () {
      super.product = value;
    });
  }

  final _$_cartProductAtom =
      Atom(name: '_ProductDetailsViewModelBase._cartProduct');

  @override
  CartProduct get _cartProduct {
    _$_cartProductAtom.reportRead();
    return super._cartProduct;
  }

  @override
  set _cartProduct(CartProduct value) {
    _$_cartProductAtom.reportWrite(value, super._cartProduct, () {
      super._cartProduct = value;
    });
  }

  final _$_cartManagerAtom =
      Atom(name: '_ProductDetailsViewModelBase._cartManager');

  @override
  List<CartProduct> get _cartManager {
    _$_cartManagerAtom.reportRead();
    return super._cartManager;
  }

  @override
  set _cartManager(List<CartProduct> value) {
    _$_cartManagerAtom.reportWrite(value, super._cartManager, () {
      super._cartManager = value;
    });
  }

  final _$_isSelectedAtom =
      Atom(name: '_ProductDetailsViewModelBase._isSelected');

  @override
  bool get _isSelected {
    _$_isSelectedAtom.reportRead();
    return super._isSelected;
  }

  @override
  set _isSelected(bool value) {
    _$_isSelectedAtom.reportWrite(value, super._isSelected, () {
      super._isSelected = value;
    });
  }

  final _$_isLoggedInAtom =
      Atom(name: '_ProductDetailsViewModelBase._isLoggedIn');

  @override
  bool get _isLoggedIn {
    _$_isLoggedInAtom.reportRead();
    return super._isLoggedIn;
  }

  @override
  set _isLoggedIn(bool value) {
    _$_isLoggedInAtom.reportWrite(value, super._isLoggedIn, () {
      super._isLoggedIn = value;
    });
  }

  final _$getCurrentUserAsyncAction =
      AsyncAction('_ProductDetailsViewModelBase.getCurrentUser');

  @override
  Future<void> getCurrentUser() {
    return _$getCurrentUserAsyncAction.run(() => super.getCurrentUser());
  }

  final _$_ProductDetailsViewModelBaseActionController =
      ActionController(name: '_ProductDetailsViewModelBase');

  @override
  void stateToggle(ItemSize size) {
    final _$actionInfo = _$_ProductDetailsViewModelBaseActionController
        .startAction(name: '_ProductDetailsViewModelBase.stateToggle');
    try {
      return super.stateToggle(size);
    } finally {
      _$_ProductDetailsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getSizesOnInit({List<ItemSize> item}) {
    final _$actionInfo = _$_ProductDetailsViewModelBaseActionController
        .startAction(name: '_ProductDetailsViewModelBase.getSizesOnInit');
    try {
      return super.getSizesOnInit(item: item);
    } finally {
      _$_ProductDetailsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getProductOnInit({Product prod}) {
    final _$actionInfo = _$_ProductDetailsViewModelBaseActionController
        .startAction(name: '_ProductDetailsViewModelBase.getProductOnInit');
    try {
      return super.getProductOnInit(prod: prod);
    } finally {
      _$_ProductDetailsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addOnCart({Product product}) {
    final _$actionInfo = _$_ProductDetailsViewModelBaseActionController
        .startAction(name: '_ProductDetailsViewModelBase.addOnCart');
    try {
      return super.addOnCart(product: product);
    } finally {
      _$_ProductDetailsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedSize: ${selectedSize},
itemSize: ${itemSize},
product: ${product}
    ''';
  }
}
