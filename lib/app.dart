import 'package:flutter/material.dart';
import 'package:for_coworking/feature/home/home/home_bloc.dart';
import 'package:for_coworking/feature/home/home/home_page.dart';
import 'package:for_coworking/feature/home/loading_page.dart';
import 'package:for_coworking/feature/home/login/login_page.dart';
import 'package:for_coworking/feature/home/signup/signup_bloc.dart';
import 'package:for_coworking/feature/home/signup/signup_page.dart';
import 'package:for_coworking/src/app/app_provider.dart';
import 'package:for_coworking/src/session/session_bloc.dart';

import 'feature/home/login/login_bloc.dart';

class ForCoworkingApp extends StatelessWidget{
  final LoginBloc loginBloc;
  final SessionBloc sessionBloc;
  final SignUpBloc signupBloc;
  final HomeBloc homeBloc;

  ForCoworkingApp(this.loginBloc, this.sessionBloc, this.signupBloc, this.homeBloc);

  @override
  Widget build(BuildContext context) {
    sessionBloc.isTokenValid();

    return AppProvider(

      loginBloc: loginBloc,
      sessionBloc: sessionBloc,

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'For Coworking',
        home: StreamBuilder<bool>(
            stream: sessionBloc.isValid,
            builder: (context, snapshot) {
              // If there's an error, user is redirected to the LoginPage
              if (snapshot.hasError) {
                return LoginPage();
              }

              // If data is null and no errors are present, this
              // means that we're waiting for something to happen.
              if (snapshot.data == null) {
                return LoadingPage();
              }


              // Otherwise we'll just send the user to the login
              // screen because their token is invalid/expired.
              return LoginPage(); // unreachable
            }),
        routes: <String, WidgetBuilder>{
          LoginPage.routeName: (context) => LoginPage(),
          SignupPage.routeName: (context) => SignupPage(),
          HomePage.routeName: (context) => HomePage(),
        },
      ),
    );
  }
}