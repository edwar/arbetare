import 'package:flutter/material.dart';

const backgroundColor = Color(0xFF3D4669);
const primary = Color(0xFF55749E);
const secundary = Color(0xFFE6556E);
const light = Color(0xFFF3F4F7);
const dark = Color(0xFF283C45);

class PageAdd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Page add',
            style: TextStyle(
                fontFamily: 'Questrial',
                color: light,
                fontWeight: FontWeight.bold,
                fontSize: 40.0)),
      ),
    );
  }
}