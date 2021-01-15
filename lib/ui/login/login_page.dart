import 'package:flutter/material.dart';
import 'package:loja_virtual/helpers/validators.dart';
import 'package:loja_virtual/models/user.dart';
import 'package:loja_virtual/models/user_manager.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Entrar"),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: ListView(
                padding: EdgeInsets.all(16),
                shrinkWrap: true,
                children: [
                  TextFormField(
                    decoration: InputDecoration(hintText: "E-mail"),
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    validator: (email) {
                      if (!emailIsValid(email)) {
                        return "Email invalido!";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    decoration: InputDecoration(hintText: "Senha"),
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    obscureText: true,
                    validator: (pass) {
                      if (pass.isEmpty || pass.length < 6) {
                        return "Senha invalida!";
                      } else {
                        return null;
                      }
                    },
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                      onPressed: () {},
                      padding: EdgeInsets.zero,
                      child: Text("Esqueci minha senha"),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: 44,
                    child: RaisedButton(
                      onPressed: () {
                        if (formKey.currentState.validate()) {
                          context.read<UserManager>().signIn(
                              user: User(
                                  email: emailController.text,
                                  password: passController.text),
                              onFail: (e) {
                                scaffoldKey.currentState.showSnackBar(SnackBar(
                                  content: Text('Falha ao entrar: $e'),
                                  backgroundColor: Colors.red,
                                ));
                              },
                              onSuccess: () {
                                // TODO: FECHAR TELA DE LOGIN
                              });
                        }
                      },
                      child: Text(
                        "Entrar",
                        style: TextStyle(fontSize: 18),
                      ),
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                    ),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
