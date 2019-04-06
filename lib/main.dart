import 'package:arbetare/pages/pageAdd.dart';
import 'package:arbetare/pages/pageList.dart';
import 'package:arbetare/pages/pageLocation.dart';
import 'package:arbetare/pages/pageMap.dart';
import 'package:arbetare/pages/pageSearch.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

const backgroundColorTop = Color(0xFF3D4669);
const backgroundColorMiddle = Color(0xFF455078);
const backgroundColorBottom = Color(0xFF4F5C8B);
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
        backgroundColor: backgroundColorTop,
        appBar: AppBar(
          backgroundColor: backgroundColorTop,
          title: Text('Arbetare',
              style: TextStyle(
                  color: light,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Questrial',
                  fontSize: 33.0)),
          centerTitle: true,
          elevation: 0.0,
        ),
        drawer: Drawer(
            child: Container(
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
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: backgroundColorTop),
                  accountName: Text(
                    "Ashish Rawat",
                    style: TextStyle(fontFamily: 'Questrial', fontSize: 17.0),
                  ),
                  accountEmail: Text(
                    "ashishrawat2911@gmail.com",
                    style: TextStyle(fontFamily: 'Questrial', fontSize: 19.0),
                  ),
                  currentAccountPicture: CircleAvatar(
                    radius: 30.0,
                    backgroundImage: NetworkImage(
                        "https://scontent-mia3-2.xx.fbcdn.net/v/t1.0-9/46733082_480567589018490_4803908490940645376_o.jpg?_nc_cat=106&_nc_ht=scontent-mia3-2.xx&oh=2b0e006d67016a790e19255372cb70cf&oe=5D030306"),
                    backgroundColor: Colors.transparent,
                  )),
              ListTile(
                title: Text(
                  "Perfil",
                  style: TextStyle(
                    color: secundary,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Questrial',
                    fontSize: 24.0,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: secundary,
                ),
              ),
              ListTile(
                title: Text(
                  "Configuración",
                  style: TextStyle(
                    color: secundary,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Questrial',
                    fontSize: 24.0,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: secundary,
                ),
              ),
              ListTile(
                title: Text(
                  "Cerrar sessión",
                  style: TextStyle(
                    color: secundary,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Questrial',
                    fontSize: 24.0,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: secundary,
                ),
              ),
            ],
          ),
        )),
        bottomNavigationBar: CurvedNavigationBar(
          color: primary,
          buttonBackgroundColor: secundary,
          initialIndex: indexPage,
          backgroundColor: backgroundColorBottom,
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
