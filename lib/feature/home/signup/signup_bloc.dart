import 'dart:async';

import 'package:for_coworking/feature/home/models/user.dart';
import 'package:for_coworking/services/signup.dart';
import 'package:for_coworking/src/app_bloc.dart';
import 'package:rxdart/rxdart.dart';


class SignUpBloc extends AppBloc {
  final SignupService _signUpService;

  final _signUp = BehaviorSubject<User>();

  SignUpBloc(this._signUpService);

  ValueObservable<User> get signup => _signUp.stream;

  Future signUp(String name, email, password) async {
    _cleanUp();

    try {
      super.isLoading();

      final signUp = await _signUpService.signup(name, email, password);
      _signUp.sink.add(signUp);

      super.isNotLoading();
    } catch (e) {
      _signUp.sink.addError(e);

      super.setError(e);
      super.isNotLoading();
    }
  }

  void _cleanUp() {
    _signUp.sink.add(null);
    super.cleanUp();
  }

  /// Take care of closing streams.
  void dispose() {
    _signUp.close();
    super.dispose();
  }
}
