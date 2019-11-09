import 'package:flutter/material.dart';
import 'package:for_coworking/feature/home/home/home_page.dart';
import 'package:for_coworking/feature/home/login/login_logic.dart';
import 'package:for_coworking/feature/home/signup/signup_page.dart';
import 'package:for_coworking/shared/validator/validators.dart';
import 'package:for_coworking/shared/widget/loading_widget.dart';
import 'package:for_coworking/src/app/app_provider.dart';

class LoginPage extends StatefulWidget {
  static const routeName = "/login";
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loginBLoc = AppProvider.loginBlocFrom(context);
    final loginLogic = LoginLogic(context);

    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 100.0,
        child: Image.asset('assets/images.png'),
      ),
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      controller: _email,
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = TextFormField(
      autofocus: false,
      controller: _password,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final newUser = FlatButton(
      child: Text(
        'É novo no For?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {
        Navigator.pushNamed(context, SignupPage.routeName);
      },
    );

    Widget loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () async {
          loginLogic.handleLogin(_email.text, _password.text);
          Navigator.pushNamed(context, HomePage.routeName);
        },
        padding: EdgeInsets.all(12),
        color: Colors.grey[800],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LoadingWidget(loading: loginBLoc.loading,),
            Text('Entrar', style: TextStyle(color: Colors.white))
          ],
        ),
      ),
    );


    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24, right: 24),
          children: <Widget>[
            SizedBox(
              height: 25,
            ),
            logo,
            SizedBox(
              height: 52,
            ),
            email,
            SizedBox(
              height: 12,
            ),
            password,
            loginButton,
            SizedBox(
              height: 12,
            ),
            newUser
          ],
        ),
      ),
    );
  }

}
