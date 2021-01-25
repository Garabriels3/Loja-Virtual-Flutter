import 'package:flutter/material.dart';
import 'package:loja_virtual/shared/resources/strings.dart';
import 'custom_drawer_header.dart';
import 'drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color.fromARGB(255, 173, 216, 241), Colors.white],
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
