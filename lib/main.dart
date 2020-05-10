import 'dart:math';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final thienHa = new Center(
        child: new ButtonTheme(
            minWidth: 200.0,
            height: 40.0,
            child: new Container(
              margin: new EdgeInsets.only(bottom: 0.0,left: 30.0),
              child:  Image(
                image: AssetImage('images/thien-ha.png'),
                height: 100.0,
                alignment: Alignment.center,
              ),
            )
        ));

    final thaTitle = new Center(
        child: new ButtonTheme(
            minWidth: 200.0,
            height: 40.0,
          child:  new Container(
            margin: new EdgeInsets.only(bottom: 0.0),
            child:  Image(
              image: AssetImage('images/tha.png'),
              height: 60.0,
              alignment: Alignment.center,
            ),
          )
        ));

    final thaRegister = new Center(
        child: new ButtonTheme(
            minWidth: 200.0,
            height: 40.0,
            child: new RaisedButton(
              onPressed: _launchThaURL,
              color: Colors.blue,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(5.0)),
              child: new Text(
                'ĐĂNG KÝ THA',
                style: new TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )));

    final thaLogin = new Center(
        child: new ButtonTheme(
            minWidth: 200.0,
            height: 40.0,
            child: new RaisedButton(
              onPressed: _launchThaURL,
              color: Colors.blue,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(5.0)),
              child: new Text(
                'ĐĂNG NHẬP THA',
                style: new TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )));

    final kuTitle = new Center(
        child: new ButtonTheme(
            minWidth: 200.0,
            height: 40.0,
          child:  new Container(
            margin: new EdgeInsets.only(bottom: 15.0),
            child:  Image(
              image: AssetImage('images/ku.png'),
              height: 40.0,
              alignment: Alignment.center,
            ),
          )
        ));

    final kuRegister = new Center(
        child: new ButtonTheme(
            minWidth: 200.0,
            height: 40.0,
            child: new RaisedButton(
              onPressed: _launchRegisterKuURL,
              color: Colors.green,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(5.0)),
              child: new Text(
                'ĐĂNG KÝ KU',
                style: new TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )));

    final kuLogin = new Center(
        child: new ButtonTheme(
            minWidth: 200.0,
            height: 40.0,
            child: new RaisedButton(
              onPressed: _launchLoginKuURL,
              color: Colors.green,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(5.0)),
              child: new Text(
                'ĐĂNG NHẬP KU',
                style: new TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )));

    return MaterialApp(
      title: 'Flutter Demo',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Center(
            child: Text('Tha Ku App'),
          ),
          backgroundColor: Colors.red,
          leading: new IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: null),
          actions: <Widget>[
            new IconButton(
                icon: new Icon(
                  Icons.favorite,
                  color: Colors.white,
                ),
                onPressed: null)
          ],
        ),
        body: new ListView(
          children: <Widget>[
            new Text(''),
            thienHa,
            new Text(''),
            thaTitle,
            thaRegister,
            thaLogin,
            new Text(''),
            new Text(''),
            kuTitle,
            kuRegister,
            kuLogin,
          ],
        ),
      ),
    );
  }
}

_launchThaURL() async {
  const url = 'https://ff529.jb77.net/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}


_launchRegisterKuURL() async {
  Random rnd = new Random();
  int min = 1;
  int max = 5;
  final int rand = min + rnd.nextInt(max - min);

  String url = '';
  switch(rand){
    case 1:
      url = 'https://ff3197.ku11.net/';
      break;
    case 2:
      url = 'https://ff3198.ku11.net/';
      break;
    case 3:
      url = 'https://ff3200.ku11.net/';
      break;
    case 4:
      url = 'https://ff3201.ku11.net/';
      break;
    case 5:
      url = 'https://ff3208.ku11.net/';
      break;
  }

  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchLoginKuURL() async {
  const url = 'https://ff3197.ku11.net/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
