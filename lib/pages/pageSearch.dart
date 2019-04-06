import 'package:flutter/material.dart';

const backgroundColorTop = Color(0xFF3D4669);
const backgroundColorMiddle = Color(0xFF455078);
const backgroundColorBottom = Color(0xFF4F5C8B);
const primary = Color(0xFF55749E);
const secundary = Color(0xFFE6556E);
const light = Color(0xFFF3F4F7);
const dark = Color(0xFF283C45);

class PageSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        backgroundColorTop,
        backgroundColorMiddle,
        backgroundColorBottom
      ], stops: [
        0.2,
        0.6,
        0.9
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Center(
        child: Text(
          'Page search',
          style: TextStyle(
              fontFamily: 'Questrial',
              color: light,
              fontWeight: FontWeight.bold,
              fontSize: 40.0),
        ),
      ),
    );
  }
}
