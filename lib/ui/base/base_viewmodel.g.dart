// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BaseScreenViewModel on _BaseScreenViewModelBase, Store {
  final _$_pageAtom = Atom(name: '_BaseScreenViewModelBase._page');

  @override
  int get _page {
    _$_pageAtom.reportRead();
    return super._page;
  }

  @override
  set _page(int value) {
    _$_pageAtom.reportWrite(value, super._page, () {
      super._page = value;
    });
  }

  final _$_BaseScreenViewModelBaseActionController =
      ActionController(name: '_BaseScreenViewModelBase');

  @override
  void setPage(int value) {
    final _$actionInfo = _$_BaseScreenViewModelBaseActionController.startAction(
        name: '_BaseScreenViewModelBase.setPage');
    try {
      return super.setPage(value);
    } finally {
      _$_BaseScreenViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
