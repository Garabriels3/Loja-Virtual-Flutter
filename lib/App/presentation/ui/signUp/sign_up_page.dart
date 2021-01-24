import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loja_virtual/App/di/setup_locator.dart';
import 'package:loja_virtual/App/presentation/ui/signUp/sign_up_viewmodel.dart';
import 'package:loja_virtual/shared/helpers/validators.dart';
import 'package:loja_virtual/shared/resources/dimens.dart';
import 'package:loja_virtual/shared/resources/strings.dart';

class SignUpPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final viewmodel = getIt<SignUpViewModel>();

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(REGISTER_BAR_TITLE),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: sixteen),
          child: Form(
            key: formKey,
            child: ListView(
              padding: EdgeInsets.all(sixteen),
              shrinkWrap: true,
              children: [
                Observer(builder: (_) {
                  return TextFormField(
                    decoration: InputDecoration(hintText: "Nome completo"),
                    enabled: !viewmodel.loading,
                    onChanged: (newName) => viewmodel.onNameChanged(newName),
                    keyboardType: TextInputType.text,
                    validator: (name) {
                      if (name.isEmpty) {
                        return 'Campo obrigatório';
                      } else if (name.trim().split(" ").length <= 1) {
                        return 'Preencha seu nome completo!';
                      }
                      return null;
                    },
                  );
                }),
                SizedBox(height: sixteen),
                Observer(builder: (_) {
                  return TextFormField(
                    decoration: InputDecoration(hintText: "E-mail"),
                    enabled: !viewmodel.loading,
                    onChanged: (newEmail) => viewmodel.onEmailChanged(newEmail),
                    keyboardType: TextInputType.emailAddress,
                    validator: (email) {
                      if (email.isEmpty) {
                        return 'Campo obrigatório';
                      } else if (!emailIsValid(email)) {
                        return 'E-mail invalido!';
                      }
                      return null;
                    },
                  );
                }),
                SizedBox(height: sixteen),
                Observer(builder: (_) {
                  return TextFormField(
                    decoration: InputDecoration(hintText: "Senha"),
                    enabled: !viewmodel.loading,
                    onChanged: (newPass) => viewmodel.onPassChanged(newPass),
                    obscureText: true,
                    validator: (password) {
                      if (password.length < 8) {
                        return 'Minimo 8 caracteres';
                      }
                      return null;
                    },
                  );
                }),
                SizedBox(height: sixteen),
                Observer(builder: (_) {
                  return TextFormField(
                    decoration: InputDecoration(hintText: "Repita a senha"),
                    enabled: !viewmodel.loading,
                    onChanged: (newPassConfirmation) => viewmodel
                        .onPassConfirmationChanged(newPassConfirmation),
                    obscureText: true,
                    validator: (password) {
                      if (password.length < 8) {
                        return 'Minimo 8 caracteres';
                      }
                      return null;
                    },
                  );
                }),
                SizedBox(height: twentyFour),
                SizedBox(
                  height: fortyFour,
                  child: Observer(
                    builder: (_) {
                      return RaisedButton(
                        onPressed: viewmodel.loading
                            ? null
                            : () {
                                viewmodel.validateConfirmationPass(
                                  onSuccess: () {
                                    if (formKey.currentState.validate()) {
                                      viewmodel.signUpUser(
                                        onFail: (e) {
                                          scaffoldKey.currentState.showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                  "Falha ao cadastrar: $e"),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                        },
                                        onSuccess: (uid) {
                                          Navigator.of(context).pop();
                                        },
                                      );
                                    }
                                  },
                                  onFail: (e) {
                                    scaffoldKey.currentState.showSnackBar(
                                      SnackBar(
                                        content: Text("Falha ao cadastrar: $e"),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  },
                                );
                              },
                        child: viewmodel.loading
                            ? CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation(Colors.white),
                              )
                            : Text(
                                REGISTER_BUTTON_TITLE,
                                style: TextStyle(fontSize: eighteen),
                              ),
                        color: Theme.of(context).primaryColor,
                        disabledColor:
                            Theme.of(context).primaryColor.withAlpha(100),
                        textColor: Colors.white,
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
