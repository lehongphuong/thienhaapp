import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

const kAndroidUserAgent =
    'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Mobile Safari/537.36';

String selectedUrl = 'https://flutter.io';

// ignore: prefer_collection_literals
final Set<JavascriptChannel> jsChannels = [
  JavascriptChannel(
      name: 'Print',
      onMessageReceived: (JavascriptMessage message) {
        print(message.message);
      }),
].toSet();

class WebViewPluginContainer extends StatefulWidget {
  final url;
  WebViewPluginContainer(this.url);
  @override
  createState() => _WebViewPluginContainerState(this.url);
}

class _WebViewPluginContainerState extends State<WebViewPluginContainer> {
  final flutterWebViewPlugin = FlutterWebviewPlugin();

  var _url;
  final _key = UniqueKey();
  _WebViewPluginContainerState(this._url);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
            child: WebviewScaffold(
          url: this._url,
          javascriptChannels: jsChannels,
          mediaPlaybackRequiresUserGesture: false,
          appBar: AppBar(
            title: const Text('Detail Kubet'),
          ),
          withZoom: true,
          withLocalStorage: true,
          hidden: true,
          initialChild: Container(
            color: Colors.black12,
            child: const Center(
              child: Text('Waiting.....'),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    flutterWebViewPlugin.goBack();
                  },
                ),

                IconButton(
                  icon: const Icon(Icons.autorenew),
                  onPressed: () {
                    flutterWebViewPlugin.reload();
                  },
                ),

                IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    flutterWebViewPlugin.goForward();
                  },
                ),
              ],
            ),
          ),
        ))
      ],
    ));
  }
}
