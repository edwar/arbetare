import 'package:arbetare/pages/pageAdd.dart';
import 'package:arbetare/pages/pageList.dart';
import 'package:arbetare/pages/pageLocation.dart';
import 'package:arbetare/pages/pageMap.dart';
import 'package:arbetare/pages/pageSearch.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

const backgroundColor = Color(0xFF3D4669);
const primary = Color(0xFF55749E);
const secundary = Color(0xFFE6556E);
const light = Color(0xFFF3F4F7);
const dark = Color(0xFF283C45);

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  HomePage createState() => HomePage();
}

class HomePage extends State<MyApp> {
  int indexPage = 2;

  //Create all pages
  final PageAdd _addService = PageAdd();
  final PageList _listServices = PageList();
  final PageLocation _locationServices = PageLocation();
  final PageMap _mapServices = PageMap();
  final PageSearch _searchServices = PageSearch();

  Widget _showPage = new PageList();

  Widget _pageChooser(int indexPage) {
    switch (indexPage) {
      case 0:
        return _addService;
        break;
      case 1:
        return _mapServices;
        break;
      case 2:
        return _listServices;
        break;
      case 3:
        return _locationServices;
        break;
      case 4:
        return _searchServices;
        break;
      default:
        return _listServices;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: backgroundColor,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          title: Text('Arbetare',
              style: TextStyle(
                  color: light,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Questrial',
                  fontSize: 33.0)),
          centerTitle: true,
          elevation: 0.0,
        ),
        bottomNavigationBar: CurvedNavigationBar(
          color: primary,
          buttonBackgroundColor: secundary,
          initialIndex: indexPage,
          backgroundColor: backgroundColor,
          items: <Widget>[
            Icon(
              Icons.add,
              size: 30,
              color: light,
            ),
            Icon(
              Icons.map,
              size: 30,
              color: light,
            ),
            Icon(
              Icons.list,
              size: 30,
              color: light,
            ),
            Icon(
              Icons.gps_fixed,
              size: 30,
              color: light,
            ),
            Icon(
              Icons.search,
              size: 30,
              color: light,
            ),
          ],
          onTap: (int tappetIndex) {
            setState(() {
              _showPage = _pageChooser(tappetIndex);
            });
          },
        ),
        body: _showPage,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
