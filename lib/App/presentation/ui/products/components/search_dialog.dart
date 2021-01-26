import 'package:flutter/material.dart';
import 'package:loja_virtual/app/di/setup_locator.dart';
import 'package:loja_virtual/shared/resources/dimens.dart';
import '../products_viewmodel.dart';

class SearchDialog extends StatelessWidget {
  final viewmodel = getIt<ProductsViewModel>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: four,
          left: eight,
          right: eight,
          child: Card(
            child: TextFormField(
              initialValue: viewmodel.search,
              onChanged: (text) {
                viewmodel.onChangeSearch(text);
              },
              textInputAction: TextInputAction.search,
              autofocus: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: sixteen),
                prefixIcon: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              onFieldSubmitted: (text) {
                Navigator.of(context).pop();
                viewmodel.onChangeSearch(text);
              },
            ),
          ),
        )
      ],
    );
  }
}
