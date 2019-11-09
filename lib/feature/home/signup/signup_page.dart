import 'package:flutter/material.dart';
import 'package:for_coworking/feature/home/signup/signup_logic.dart';
import 'package:for_coworking/shared/widget/loading_widget.dart';
import 'package:for_coworking/src/app/app_provider.dart';

class SignupPage extends StatefulWidget {
  static const routeName = "/signup";
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController _name = new TextEditingController();
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();

  @override
  void setState(fn){
    if (mounted){
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    final signupBloc = AppProvider.signupBlocFrom(context);
    final signupLogic = SignupLogic(context);

    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 100.0,
        child: Image.asset('assets/images.png'),
      ),
    );

    final name = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      controller: _name,
      decoration: InputDecoration(
        hintText: 'Name',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
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

    Widget signupButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () async {
          signupLogic.handleLogin(_name.text, _email.text, _password.text);
        },
        padding: EdgeInsets.all(12),
        color: Colors.grey[800],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LoadingWidget(
              loading: signupBloc.loading,
            ),
            Text('Cadastrar', style: TextStyle(color: Colors.white))
          ],
        ),
      ),
    );


    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24,right: 24),
          children: <Widget>[
            logo,
            SizedBox(
              height: 30,
            ),
            name,

            SizedBox(
              height: 12,
            ),
            email,

            SizedBox(
              height:12,
            ),
            password,

            SizedBox(
              height: 12,
            ),
            signupButton,
          ],
        ),
      ),
    );

  }
}
