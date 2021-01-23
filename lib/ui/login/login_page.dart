import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loja_virtual/core/dimens.dart';
import 'package:loja_virtual/core/strings.dart';
import 'package:loja_virtual/helpers/validators.dart';
import 'package:loja_virtual/ui/login/login_viewmodel.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final viewmodel = Provider.of<LoginViewModel>(context);
    viewmodel.getCurrentUser();

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(LOGIN_BUTTON_LABEL),
        centerTitle: true,
        actions: [
          FlatButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/signUp');
            },
            child: Text(
              REGISTER_BUTTON_LABEL,
              style: TextStyle(color: Colors.white, fontSize: eighteen),
            ),
          ),
        ],
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
                    controller: emailController,
                    onChanged: (email) => viewmodel.changeEmail(email),
                    decoration: InputDecoration(hintText: EMAIL_HINT_TEXT),
                    keyboardType: TextInputType.emailAddress,
                    enabled: !viewmodel.loading,
                    autocorrect: false,
                    validator: (email) {
                      if (!emailIsValid(email)) {
                        return EMAIL_INVALID;
                      }
                      return null;
                    },
                  );
                }),
                SizedBox(
                  height: sixteen,
                ),
                Observer(builder: (_) {
                  return TextFormField(
                    controller: passController,
                    onChanged: (pass) => viewmodel.changePassword(pass),
                    decoration: InputDecoration(hintText: PASS_HINT_TEXT),
                    keyboardType: TextInputType.text,
                    enabled: !viewmodel.loading,
                    autocorrect: false,
                    obscureText: true,
                    validator: (pass) {
                      if (pass.isEmpty || pass.length < EIGHT_LENGTH) {
                        return PASS_INVALID;
                      } else {
                        return null;
                      }
                    },
                  );
                }),
                Align(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    child: Text(FORGOT_PASS),
                  ),
                ),
                SizedBox(
                  height: sixteen,
                ),
                SizedBox(
                  height: fortyFour,
                  child: Observer(
                    builder: (_) {
                      return RaisedButton(
                        onPressed: viewmodel.loading
                            ? null
                            : () {
                                if (formKey.currentState.validate()) {
                                  viewmodel.signUser(
                                      onFail: (e) {
                                        scaffoldKey.currentState
                                            .showSnackBar(SnackBar(
                                          content: Text("Falha ao entrar: $e"),
                                          backgroundColor: Colors.red,
                                        ));
                                      },
                                      onSuccess: (uid) {
                                         Navigator.of(context).pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
                                      });
                                }
                              },
                        child: viewmodel.loading
                            ? CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation(Colors.white),
                              )
                            : Text(
                                LOGIN_BUTTON_LABEL,
                                style: TextStyle(fontSize: eighteen),
                              ),
                        color: Theme.of(context).primaryColor,
                        disabledColor:
                            Theme.of(context).primaryColor.withAlpha(100),
                        textColor: Colors.white,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
