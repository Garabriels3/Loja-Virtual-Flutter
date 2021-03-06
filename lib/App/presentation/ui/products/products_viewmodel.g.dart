// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductsViewModel on _ProductsViewModelBase, Store {
  final _$_allProductsAtom = Atom(name: '_ProductsViewModelBase._allProducts');

  @override
  List<Product> get _allProducts {
    _$_allProductsAtom.reportRead();
    return super._allProducts;
  }

  @override
  set _allProducts(List<Product> value) {
    _$_allProductsAtom.reportWrite(value, super._allProducts, () {
      super._allProducts = value;
    });
  }

  final _$_searchAtom = Atom(name: '_ProductsViewModelBase._search');

  @override
  String get _search {
    _$_searchAtom.reportRead();
    return super._search;
  }

  @override
  set _search(String value) {
    _$_searchAtom.reportWrite(value, super._search, () {
      super._search = value;
    });
  }

  final _$_onErrorMessageAtom =
      Atom(name: '_ProductsViewModelBase._onErrorMessage');

  @override
  String get _onErrorMessage {
    _$_onErrorMessageAtom.reportRead();
    return super._onErrorMessage;
  }

  @override
  set _onErrorMessage(String value) {
    _$_onErrorMessageAtom.reportWrite(value, super._onErrorMessage, () {
      super._onErrorMessage = value;
    });
  }

  final _$getAllProductsAsyncAction =
      AsyncAction('_ProductsViewModelBase.getAllProducts');

  @override
  Future<void> getAllProducts() {
    return _$getAllProductsAsyncAction.run(() => super.getAllProducts());
  }

  final _$_ProductsViewModelBaseActionController =
      ActionController(name: '_ProductsViewModelBase');

  @override
  dynamic onChangeSearch(String newSearch) {
    final _$actionInfo = _$_ProductsViewModelBaseActionController.startAction(
        name: '_ProductsViewModelBase.onChangeSearch');
    try {
      return super.onChangeSearch(newSearch);
    } finally {
      _$_ProductsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
