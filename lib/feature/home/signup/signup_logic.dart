import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:for_coworking/feature/home/login/login_page.dart';
import 'package:for_coworking/src/app/app_provider.dart';


class SignupLogic {
  final BuildContext context;

  SignupLogic(this.context);

  Future handleLogin(String name, email, password) async {
    FocusScope.of(context).requestFocus(FocusNode());

    final signupBloc = AppProvider.signupBlocFrom(context);

    signupBloc.signUp(name, email, password);

    final subscription = signupBloc.signup.listen(null);

    subscription.onData((handleData) async {
      if (handleData != null) {
        subscription.cancel();
        Navigator.pushNamed(context, LoginPage.routeName);
      }
    });

    subscription.onError((handleError) {
      subscription.cancel();
    });
  }
}
