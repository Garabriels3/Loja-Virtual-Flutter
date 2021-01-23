import 'package:flutter/material.dart';
import 'package:loja_virtual/ui/base/base_page.dart';
import 'package:loja_virtual/ui/base/base_viewmodel.dart';
import 'package:loja_virtual/ui/login/login_page.dart';
import 'package:loja_virtual/ui/login/login_viewmodel.dart';
import 'package:loja_virtual/ui/signUp/sign_up_page.dart';
import 'package:loja_virtual/ui/signUp/sign_up_viewmodel.dart';
import 'package:provider/provider.dart';

class MarketPlaceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<BaseScreenViewModel>(create: (_) => BaseScreenViewModel()),
        Provider<LoginViewModel>(create: (_) => LoginViewModel(), lazy: false,),
        Provider<SignUpViewModel>(create: (_) => SignUpViewModel()),
      ],
      child: MaterialApp(
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
            case '/login':
              return MaterialPageRoute(builder: (_) => LoginPage());
            case '/base':
            default:
              return MaterialPageRoute(builder: (_) => BaseScreen());
          }
        },
      ),
    );
  }
}
