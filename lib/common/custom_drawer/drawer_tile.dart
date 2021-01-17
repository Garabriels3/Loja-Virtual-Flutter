import 'package:flutter/material.dart';
import 'package:loja_virtual/core/dimens.dart';
import 'package:loja_virtual/ui/base/base_viewmodel.dart';
import 'package:provider/provider.dart';

class DrawerTile extends StatelessWidget {
  DrawerTile({this.iconData, this.menuOptionTitle, this.page});

  final IconData iconData;
  final String menuOptionTitle;
  final int page;

  @override
  Widget build(BuildContext context) {
    final viewmodel = context.watch<BaseScreenViewModel>();
    final Color primaryColor = Theme.of(context).primaryColor;

    return InkWell(
      onTap: () {
        viewmodel.setPage(page);
      },
      child: SizedBox(
        height: sixty,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: thirtyTwo),
              child: Icon(
                iconData,
                size: thirtyTwo,
                color: viewmodel.page == page ? primaryColor : Colors.grey[700],
              ),
            ),
            Text(
              menuOptionTitle,
              style: TextStyle(fontSize: sixteen, color: Colors.grey[700]),
            )
          ],
        ),
      ),
    );
  }
}
