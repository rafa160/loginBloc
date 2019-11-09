import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:for_coworking/src/app/app_provider.dart';

class LoginLogic {
  final BuildContext context;

  LoginLogic(this.context);

  Future handleLogin(String email, password) async {
    // Dismiss the keyboard when the login button is tapped
    FocusScope.of(context).requestFocus(FocusNode());

    // Access blocs that are going to be used.
    final loginBloc = AppProvider.loginBlocFrom(context);

    // Try to login
    loginBloc.doLogin(email, password);

    final subscription = loginBloc.login.listen(null);
    subscription.onData((handleData) async {
      if (handleData != null) {
        subscription.cancel();
        final sessionProvider = AppProvider.sessionBlocFrom(context);
        sessionProvider.setSessionData(handleData);
        await Navigator.pushReplacementNamed(
            context, null);
      }
    });

    subscription.onError((handleError) {
      subscription.cancel();
    });
  }
}