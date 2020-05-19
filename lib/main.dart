// app.dart
import 'dart:math';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

import 'webview.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Web Views',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: "Arial",
          textTheme: TextTheme(
              button: TextStyle(color: Colors.white, fontSize: 18.0),
              title: TextStyle(color: Colors.red))),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final thienHa = new Center(
        child: new ButtonTheme(
            minWidth: 200.0,
            height: 40.0,
            child: new Container(
              margin: new EdgeInsets.only(bottom: 0.0),
              child: Image(
                image: AssetImage('images/thien-ha.png'),
                height: 90.0,
                alignment: Alignment.center,
              ),
            )));

    final choose = new Center(
        child: new ButtonTheme(
            minWidth: 200.0,
            height: 40.0,
            child: new Container(
              margin: new EdgeInsets.only(bottom: 0.0, left: 0.0),
              child: Text(
                'Vui lòng chọn 1 trong 2 sản phẩm',
                style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal),
              ),
            )));

    final thaTitle = new Center(
        child: new ButtonTheme(
            minWidth: 200.0,
            height: 40.0,
            child: new Container(
              margin: new EdgeInsets.only(bottom: 0.0),
              child: Image(
                image: AssetImage('images/tha.png'),
                height: 60.0,
                alignment: Alignment.center,
              ),
            )));

    final thaRegister = new Center(
        child: new ButtonTheme(
            minWidth: 200.0,
            height: 40.0,
            child: new RaisedButton(
              onPressed: () => _launchThaURL(context),
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
              onPressed: () => _launchThaURL(context),
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
            child: new Container(
              margin: new EdgeInsets.only(bottom: 15.0),
              child: Image(
                image: AssetImage('images/ku.png'),
                height: 40.0,
                alignment: Alignment.center,
              ),
            )));

    final kuRegister = new Center(
        child: new ButtonTheme(
            minWidth: 200.0,
            height: 40.0,
            child: new RaisedButton(
              onPressed: () => _launchRegisterKuURL(context),
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
              onPressed: () => _launchLoginKuURL(context),
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

    final khuyenMai = new Center(
        child: new Container(
      margin: EdgeInsets.only(top: 20.0),
      alignment: Alignment.bottomCenter,
      child: new ButtonTheme(
          minWidth: 200.0,
          height: 40.0,
          child: new RaisedButton(
            onPressed: () => _launchKhuyenMaiURL(context),
            color: Colors.red,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(5.0)),
            child: new Text(
              'NHẬN KHUYẾN MÃI',
              style: new TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          )),
    ));

    return Scaffold(
      appBar: new AppBar(
        title: new Center(
          child: Text('KUBET VN'),
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
          choose,
          thaTitle,
          thaRegister,
          thaLogin,
          new Text(''),
          new Text(''),
          kuTitle,
          kuRegister,
          kuLogin,
          khuyenMai
        ],
      ),
      floatingActionButton: new FloatingActionButton(
          onPressed: _callMe, child: new Icon(Icons.chat)),
    );
  }

  _callMe() async {
    // Android
    const uri = 'https://zalo.me/g/azjbxd745';
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      // iOS
      const uri = 'https://zalo.me/g/azjbxd745';
      if (await canLaunch(uri)) {
        await launch(uri);
      } else {
        throw 'Could not launch $uri';
      }
    }
  }

  void _launchKhuyenMaiURL(BuildContext context) {
    const url =
        'https://docs.google.com/forms/d/e/1FAIpQLSeXqS5S15fH2jls6ykvVEpBzpSNnj_nW4aCF9VzoGVsTzj1Wg/viewform?fbzx=-3698780918055340827';
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => WebViewContainer(url)));
  }

  void _launchThaURL(context) {
    const url = 'https://ff529.jb77.net/';
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => WebViewContainer(url)));
  }

  void _launchRegisterKuURL(context) {
    Random rnd = new Random();
    int min = 1;
    int max = 5;
    final int rand = min + rnd.nextInt(max - min);

    String url = '';
    switch (rand) {
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

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => WebViewContainer(url)));
  }

  void _launchLoginKuURL(context) {
    const url = 'https://ff3197.ku11.net/';
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => WebViewContainer(url)));
  }
}
