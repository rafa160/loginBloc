import 'package:flutter/material.dart';
import 'package:for_coworking/app.dart';
import 'package:for_coworking/feature/home/home/home_bloc.dart';
import 'package:for_coworking/feature/home/login/login_bloc.dart';
import 'package:for_coworking/feature/home/signup/signup_bloc.dart';
import 'package:for_coworking/services/home.dart';
import 'package:for_coworking/services/login.dart';
import 'package:for_coworking/services/session.dart';
import 'package:for_coworking/services/signup.dart';
import 'package:for_coworking/src/session/session_bloc.dart';
import 'package:for_coworking/utils/http_tunnel.dart';




void main() {
  // Initiate services.
  final sessionService = SessionService();
  // Initiate HTTP service.
  HttpTunnel httpTunnel = HttpTunnel(sessionService);

  final loginService = LoginService(httpTunnel);
  final signupService = SignupService(httpTunnel);
  final homeService = HomeService(httpTunnel);

  // Build top-level components.
  // In a real world app, this would also rope in HTTP clients and such.
  final loginBloc = LoginBloc(loginService);
  final signupBloc = SignUpBloc(signupService);
  final sessionBloc = SessionBloc(sessionService);
  final homeBloc = HomeBloc(homeService);

  // Start the app.
  runApp(
      ForCoworkingApp(loginBloc, sessionBloc, signupBloc, homeBloc));
}
