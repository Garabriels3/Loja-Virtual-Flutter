import 'package:flutter/material.dart';
import 'package:loja_virtual/ui/base/base_page.dart';

class MarketPlaceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loja da Monike<3',
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 4, 125, 141),
        scaffoldBackgroundColor: Color.fromARGB(255, 4, 125, 141),
        appBarTheme: AppBarTheme(elevation: 0),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BaseScreen(),
    );
  }
}
