// app.dart
import 'dart:convert';
import 'dart:math';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

import 'webview.dart';
import 'webview-plugin.dart';

import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

dynamic _config;

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
    // get config from database
    getConfig();



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
              margin: new EdgeInsets.only(top: 30.0, bottom: 15.0),
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
        backgroundColor: Colors.blue,
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
          kuTitle,
          kuRegister,
          kuLogin,
          new Text(''),
          new Text(''),
          thaTitle,
          thaRegister,
          thaLogin,
          khuyenMai
        ],
      ),
      floatingActionButton: new FloatingActionButton(
          onPressed: _callMe, child: new Icon(Icons.chat)),
    );
  }

  _callMe() async {
    // Android
    if (await canLaunch(_config['zalo'].toString())) {
      await launch(_config['zalo'].toString());
    } else {
      // iOS
      if (await canLaunch(_config['zalo'].toString())) {
        await launch(_config['zalo'].toString());
      } else {
        throw 'Could not launch '+ _config['zalo'].toString();
      }
    }
  }

  void _launchKhuyenMaiURL(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => WebViewPluginContainer(_config['google'].toString())));
  }

  void _launchThaURL(context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => WebViewPluginContainer(_config['tha'].toString())));
  }

  void _launchRegisterKuURL(context) {
    Random rnd = new Random();
    int min = 1;
    String url = '';
    List<String> listKu = _config['ku'].toString().split(',');
    final int rand = min + rnd.nextInt(listKu.length+1 - min);
    url = listKu[rand-1];
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => WebViewPluginContainer(url)));
  }

  void _launchLoginKuURL(context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => WebViewContainer(_config['loginku'].toString())));
  }
}

Future<String> getConfig() async {
  String url = 'https://hoctienganhphanxa.com/api/config/kubetvn/api.php';
  final response = await http.get(url + '?input={"what":"10"}');
  _config = json.decode(response.body.toString())[0];
  print(_config);
  return json.decode(response.body.toString())[0]['url'];
}
