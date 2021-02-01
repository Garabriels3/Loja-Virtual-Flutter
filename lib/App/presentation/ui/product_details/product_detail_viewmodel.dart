import 'package:flutter/material.dart';
import 'package:loja_virtual/app/di/setup_locator.dart';
import 'package:loja_virtual/app/domain/models/item_size.dart';
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
  bool isSelected = false;

  @observable
  bool state = false;

  @observable
  bool isLoggedIn = false;

  @action
  void stateToggle(ItemSize size) {
    selectedSize = size;
  }

  @action
  Future<void> getCurrentUser() async {
    userUsecase.getCurrentUser(onSuccess: (user) {
      isLoggedIn = true;
    }, onFail: () {
      isLoggedIn = false;
    });
  }
}
