import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loja_virtual/core/dimens.dart';
import 'package:loja_virtual/ui/login/login_viewmodel.dart';
import 'package:provider/provider.dart';

class CustomDrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewmodel = Provider.of<LoginViewModel>(context);
    return Container(
      padding: EdgeInsets.fromLTRB(thirtyTwo, twentyFour, sixteen, eight),
      height: hundredNinetyTwo,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Bazar do\nGabri",
            style: TextStyle(fontSize: thirtyTwo, fontWeight: FontWeight.bold),
          ),
          Observer(builder: (_) {
            return Text(
              'Ola, ${viewmodel.user?.name ?? ""}',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            );
          }),
          GestureDetector(
            onTap: () {
              if (viewmodel.isLoggedIn) {
                viewmodel.signOut(onSuccess: () {
                  Navigator.of(context).pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
                });
              } else {
                Navigator.of(context).pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
              }
            },
            child: Observer(builder: (_) {
              return Text(
                viewmodel.isLoggedIn ? "Sair" : "Entre ou Cadastre-se >",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: sixteen,
                    color: Theme.of(context).primaryColor),
              );
            }),
          )
        ],
      ),
    );
  }
}
