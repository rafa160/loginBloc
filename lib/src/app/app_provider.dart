import 'package:flutter/widgets.dart';
import 'package:for_coworking/feature/home/home/home_bloc.dart';
import 'package:for_coworking/feature/home/login/login_bloc.dart';
import 'package:for_coworking/feature/home/signup/signup_bloc.dart';
import 'package:for_coworking/services/home.dart';
import 'package:for_coworking/services/login.dart';
import 'package:for_coworking/services/session.dart';
import 'package:for_coworking/services/signup.dart';
import 'package:for_coworking/src/session/session_bloc.dart';


class AppProvider extends InheritedWidget {
  final SessionBloc sessionBloc;
  final LoginBloc loginBloc;
  final SignUpBloc signUpBloc;
  final HomeBloc homeBloc;

  AppProvider({
    SessionService sessionService,
    LoginService loginService,
    SignupService signupService,
    HomeService homeService,
    Key key,
    SessionBloc sessionBloc,
    LoginBloc loginBloc,
    SignUpBloc signUpBloc,
    HomeBloc homeBloc,
    Widget child,
  })  : sessionBloc = sessionBloc ?? SessionBloc(sessionService),
        signUpBloc = signUpBloc ?? SignUpBloc(signupService),
        loginBloc = loginBloc ?? LoginBloc(loginService),
        homeBloc = homeBloc ?? HomeBloc(homeService),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static SessionBloc sessionBlocFrom(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(AppProvider) as AppProvider)
          .sessionBloc;

  static LoginBloc loginBlocFrom(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(AppProvider) as AppProvider)
          .loginBloc;

  static SignUpBloc signupBlocFrom(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(AppProvider) as AppProvider)
          .signUpBloc;

  static HomeBloc homeBlocFrom (BuildContext context) =>
      (context.inheritFromWidgetOfExactType(AppProvider) as AppProvider).homeBloc;
}
