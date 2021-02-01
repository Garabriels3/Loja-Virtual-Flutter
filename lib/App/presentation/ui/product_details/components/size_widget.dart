import 'package:flutter/material.dart';
import 'package:loja_virtual/app/di/setup_locator.dart';
import 'package:loja_virtual/app/domain/models/item_size.dart';
import 'package:loja_virtual/shared/resources/dimens.dart';
import 'package:mobx/mobx.dart';
import '../product_detail_viewmodel.dart';

class SizeWidget extends StatefulWidget {
  final ItemSize sizes;
  SizeWidget({this.sizes});

  @override
  _SizeWidgetState createState() => _SizeWidgetState();
}

class _SizeWidgetState extends State<SizeWidget> {
  @override
  Widget build(BuildContext context) {
    final viewmodel = getIt<ProductDetailsViewModel>();
    var isSelected;
    Color colorSet;

    autorun((_) {
      isSelected = widget.sizes == viewmodel.selectedSize;

      if (!widget.sizes.hasStock) {
        setState(() {
          colorSet = Colors.red.withAlpha(100);
        });
      } else if (isSelected) {
        setState(() {
          colorSet = Theme.of(context).primaryColor;
        });
      } else {
        setState(() {
          colorSet = Colors.grey;
        });
      }
    });

    return GestureDetector(
        onTap: () {
          if (widget.sizes.hasStock) {
            viewmodel.stateToggle(widget.sizes);
            print(widget.sizes);
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: colorSet),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  color: colorSet,
                  padding:
                      EdgeInsets.symmetric(vertical: four, horizontal: eight),
                  child: Text(
                    widget.sizes.name,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: sixteen),
                  child: Text(
                    'R\$ ${widget.sizes.price.toStringAsFixed(2)}',
                    style: TextStyle(color: colorSet),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
