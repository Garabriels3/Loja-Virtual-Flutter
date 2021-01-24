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

  final _$_userAtom = Atom(name: '_BaseScreenViewModelBase._user');

  @override
  User get _user {
    _$_userAtom.reportRead();
    return super._user;
  }

  @override
  set _user(User value) {
    _$_userAtom.reportWrite(value, super._user, () {
      super._user = value;
    });
  }

  final _$isLoggedInAtom = Atom(name: '_BaseScreenViewModelBase.isLoggedIn');

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
      AsyncAction('_BaseScreenViewModelBase.getCurrentUser');

  @override
  Future<void> getCurrentUser() {
    return _$getCurrentUserAsyncAction.run(() => super.getCurrentUser());
  }

  final _$getCurrentUserStoreAsyncAction =
      AsyncAction('_BaseScreenViewModelBase.getCurrentUserStore');

  @override
  Future<void> getCurrentUserStore({String uid}) {
    return _$getCurrentUserStoreAsyncAction
        .run(() => super.getCurrentUserStore(uid: uid));
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
  void signOut({Function onFail, Function onSuccess}) {
    final _$actionInfo = _$_BaseScreenViewModelBaseActionController.startAction(
        name: '_BaseScreenViewModelBase.signOut');
    try {
      return super.signOut(onFail: onFail, onSuccess: onSuccess);
    } finally {
      _$_BaseScreenViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoggedIn: ${isLoggedIn}
    ''';
  }
}
