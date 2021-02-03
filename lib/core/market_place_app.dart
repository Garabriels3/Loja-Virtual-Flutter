import 'package:flutter/material.dart';
import 'package:loja_virtual/app/domain/models/products.dart';
import 'package:loja_virtual/app/presentation/ui/base/base_page.dart';
import 'package:loja_virtual/app/presentation/ui/cart/cart_page.dart';
import 'package:loja_virtual/app/presentation/ui/login/login_page.dart';
import 'package:loja_virtual/app/presentation/ui/product_details/product_details.dart';
import 'package:loja_virtual/app/presentation/ui/signUp/sign_up_page.dart';

class MarketPlaceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Loja da Monike<3',
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 4, 125, 141),
        scaffoldBackgroundColor: Color.fromARGB(255, 4, 125, 141),
        appBarTheme: AppBarTheme(elevation: 0),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/base',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/signUp':
            return MaterialPageRoute(builder: (_) => SignUpPage());
          case '/cart':
            return MaterialPageRoute(builder: (_) => CartPage());
          case '/login':
            return MaterialPageRoute(builder: (_) => LoginPage());
          case '/productDetails':
            return MaterialPageRoute(
              builder: (_) => ProductDetailPage(
                product: settings.arguments as Product,
              ),
            );
          case '/base':
          default:
            return MaterialPageRoute(builder: (_) => BaseScreen());
        }
      },
    );
  }
}
