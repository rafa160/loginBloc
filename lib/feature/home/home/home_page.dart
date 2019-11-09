import 'package:flutter/material.dart';
import 'package:for_coworking/feature/home/models/authentication.dart';
import 'package:for_coworking/feature/home/models/news.dart';
import 'package:for_coworking/src/app/app_provider.dart';
import 'package:carousel_pro/carousel_pro.dart';

class HomePage extends StatelessWidget {
  HomePage();

  static const routeName = '/home';

  @override
  Widget build(BuildContext context){
    final sessionBloc = AppProvider.sessionBlocFrom(context);
    final homeBloc = AppProvider.homeBlocFrom(context);


    sessionBloc.getSessionData();

    Widget _cardInfos(){
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Bem-Vindo! Rafael...", style: TextStyle(fontSize: 22,color: Colors.black,)),
            SizedBox(height: 10,),
            Text("Todas as novidades sobre o F voce encontra aqui.", style: TextStyle(color: Colors.black),),
            SizedBox(height: 20,),

          ],
        ),
      );
    }


    Widget _buildList() {
      return ListView(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 0.7,
            child: Carousel(

            ),
          ),
        ],

      );
    }


    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: <Widget>[
            SizedBox(height: 60,),
            _cardInfos(),
          ],
        ),
      ),
    );

  }
}