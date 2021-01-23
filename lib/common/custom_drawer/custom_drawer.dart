import 'package:flutter/material.dart';
import 'package:loja_virtual/common/custom_drawer/custom_drawer_header.dart';
import 'package:loja_virtual/common/custom_drawer/drawer_tile.dart';
import 'package:loja_virtual/core/strings.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color.fromARGB(255, 203, 236, 241), Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
            ),
          ),
          ListView(children: <Widget>[
            CustomDrawerHeader(),
            Divider(),
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
        ],
      ),
    );
  }
}
