import 'package:flutter/material.dart';
import 'package:loja_virtual/common/custom_drawer/drawer_tile.dart';
import 'package:loja_virtual/core/strings.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: <Widget>[
        DrawerTile(
          iconData: Icons.home,
          menuOptionTitle: HOME_MENU_DRAWER,
          page: 0,
        ),
        DrawerTile(
          iconData: Icons.list,
          menuOptionTitle: PRODUCT_MENU_DRAWER,
          page: 1,
        ),
        DrawerTile(
          iconData: Icons.playlist_add_check,
          menuOptionTitle: MY_CART_MENU_DRAWER,
          page: 2,
        ),
        DrawerTile(
          iconData: Icons.location_on,
          menuOptionTitle: MARKET_MENU_DRAWER,
          page: 3,
        ),
      ]),
    );
  }
}
