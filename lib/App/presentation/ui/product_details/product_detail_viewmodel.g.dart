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

  final _$isSelectedAtom =
      Atom(name: '_ProductDetailsViewModelBase.isSelected');

  @override
  bool get isSelected {
    _$isSelectedAtom.reportRead();
    return super.isSelected;
  }

  @override
  set isSelected(bool value) {
    _$isSelectedAtom.reportWrite(value, super.isSelected, () {
      super.isSelected = value;
    });
  }

  final _$stateAtom = Atom(name: '_ProductDetailsViewModelBase.state');

  @override
  bool get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(bool value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$isLoggedInAtom =
      Atom(name: '_ProductDetailsViewModelBase.isLoggedIn');

  @override
  bool get isLoggedIn {
    _$isLoggedInAtom.reportRead();
    return super.isLoggedIn;
  }

  @override
  set isLoggedIn(bool value) {
    _$isLoggedInAtom.reportWrite(value, super.isLoggedIn, () {
      super.isLoggedIn = value;
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
  String toString() {
    return '''
selectedSize: ${selectedSize},
isSelected: ${isSelected},
state: ${state},
isLoggedIn: ${isLoggedIn}
    ''';
  }
}
