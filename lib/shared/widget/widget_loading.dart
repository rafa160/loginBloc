import 'package:flutter/material.dart';

Widget loadingWidget(Color color) {
  return Center(
      heightFactor: 6.0,
      child: CircularProgressIndicator(
        backgroundColor: color,
      ));
}

// ignore: non_constant_identifier_names
Widget DefaultCard(String text, double fontSize) {
  return Card(
    elevation: 3.0,
    child: Padding(
      padding: EdgeInsets.all(10.0),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.normal,
          ),
          textAlign: TextAlign.left,
        ),
      ),
    ),
  );
}

// ignore: non_constant_identifier_names
Widget DefaultText(double fontSize, FontWeight fontWeight, String text) {
  return Text(text,
      style: TextStyle(
        fontSize: fontSize,
        fontFamily: "Raleway",
        fontWeight: fontWeight,
      ));
}

// ignore: non_constant_identifier_names
Widget ErrorLine(String key, dynamic value) {
  return Text("${value.toString().replaceAll("]", '').replaceAll('[', '')}");
//  return Text("${value.toString()}".replaceAll("]", '').replaceAll('[', ''));
}

// ignore: non_constant_identifier_names
Widget RenderErrors(Map<String, dynamic> errorsMap) {
  List<Widget> errors = List();
  if (errorsMap == null) {
    return SizedBox();
  }

  if (errorsMap != null) {
    errorsMap.forEach((key, value) {
      errors.add(ErrorLine(key, value));
    });
  }

  return Column(
    children: errors,
  );
}
