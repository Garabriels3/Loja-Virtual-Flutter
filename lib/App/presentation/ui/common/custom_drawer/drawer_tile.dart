import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loja_virtual/App/di/setup_locator.dart';
import 'package:loja_virtual/App/presentation/ui/base/base_viewmodel.dart';
import 'package:loja_virtual/shared/resources/dimens.dart';

class DrawerTile extends StatelessWidget {
  DrawerTile({this.iconData, this.menuOptionTitle, this.page});

  final IconData iconData;
  final String menuOptionTitle;
  final int page;

  @override
  Widget build(BuildContext context) {
    final viewmodel = getIt<BaseScreenViewModel>();
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
              child: Observer(builder: (_) {
                return Icon(
                  iconData,
                  size: thirtyTwo,
                  color:
                      viewmodel.page == page ? primaryColor : Colors.grey[700],
                );
              }),
            ),
            Observer(builder: (_) {
              return Text(
                menuOptionTitle,
                style: TextStyle(
                  fontSize: sixteen,
                  color:
                      viewmodel.page == page ? primaryColor : Colors.grey[700],
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
