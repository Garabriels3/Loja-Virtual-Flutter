import 'package:flutter/material.dart';
import 'package:loja_virtual/common/custom_drawer/drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: <Widget>[
        DrawerTile(
          iconData: Icons.home,
          menuOptionTitle: "Inicio",
          page: 0,
        ),
        DrawerTile(
          iconData: Icons.list,
          menuOptionTitle: "Produtos",
          page: 1,
        ),
        DrawerTile(
          iconData: Icons.playlist_add_check,
          menuOptionTitle: "Meus pedidos",
          page: 2,
        ),
        DrawerTile(
          iconData: Icons.location_on,
          menuOptionTitle: "Loja",
          page: 3,
        ),
      ]),
    );
  }
}
