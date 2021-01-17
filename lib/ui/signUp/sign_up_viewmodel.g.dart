// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignUpViewModel on _SignUpViewModelBase, Store {
  final _$_nameAtom = Atom(name: '_SignUpViewModelBase._name');

  @override
  String get _name {
    _$_nameAtom.reportRead();
    return super._name;
  }

  @override
  set _name(String value) {
    _$_nameAtom.reportWrite(value, super._name, () {
      super._name = value;
    });
  }

  final _$_emailAtom = Atom(name: '_SignUpViewModelBase._email');

  @override
  String get _email {
    _$_emailAtom.reportRead();
    return super._email;
  }

  @override
  set _email(String value) {
    _$_emailAtom.reportWrite(value, super._email, () {
      super._email = value;
    });
  }

  final _$_passAtom = Atom(name: '_SignUpViewModelBase._pass');

  @override
  String get _pass {
    _$_passAtom.reportRead();
    return super._pass;
  }

  @override
  set _pass(String value) {
    _$_passAtom.reportWrite(value, super._pass, () {
      super._pass = value;
    });
  }

  final _$_passConfirmationAtom =
      Atom(name: '_SignUpViewModelBase._passConfirmation');

  @override
  String get _passConfirmation {
    _$_passConfirmationAtom.reportRead();
    return super._passConfirmation;
  }

  @override
  set _passConfirmation(String value) {
    _$_passConfirmationAtom.reportWrite(value, super._passConfirmation, () {
      super._passConfirmation = value;
    });
  }

  final _$_loadingAtom = Atom(name: '_SignUpViewModelBase._loading');

  @override
  bool get _loading {
    _$_loadingAtom.reportRead();
    return super._loading;
  }

  @override
  set _loading(bool value) {
    _$_loadingAtom.reportWrite(value, super._loading, () {
      super._loading = value;
    });
  }

  final _$_snackErrorAtom = Atom(name: '_SignUpViewModelBase._snackError');

  @override
  bool get _snackError {
    _$_snackErrorAtom.reportRead();
    return super._snackError;
  }

  @override
  set _snackError(bool value) {
    _$_snackErrorAtom.reportWrite(value, super._snackError, () {
      super._snackError = value;
    });
  }

  final _$_SignUpViewModelBaseActionController =
      ActionController(name: '_SignUpViewModelBase');

  @override
  dynamic onNameChanged(String newName) {
    final _$actionInfo = _$_SignUpViewModelBaseActionController.startAction(
        name: '_SignUpViewModelBase.onNameChanged');
    try {
      return super.onNameChanged(newName);
    } finally {
      _$_SignUpViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onEmailChanged(String newEmail) {
    final _$actionInfo = _$_SignUpViewModelBaseActionController.startAction(
        name: '_SignUpViewModelBase.onEmailChanged');
    try {
      return super.onEmailChanged(newEmail);
    } finally {
      _$_SignUpViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onPassChanged(String newPass) {
    final _$actionInfo = _$_SignUpViewModelBaseActionController.startAction(
        name: '_SignUpViewModelBase.onPassChanged');
    try {
      return super.onPassChanged(newPass);
    } finally {
      _$_SignUpViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onPassConfirmationChanged(String newPassConfirmation) {
    final _$actionInfo = _$_SignUpViewModelBaseActionController.startAction(
        name: '_SignUpViewModelBase.onPassConfirmationChanged');
    try {
      return super.onPassConfirmationChanged(newPassConfirmation);
    } finally {
      _$_SignUpViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
