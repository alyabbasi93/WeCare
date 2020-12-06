import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class bot extends StatefulWidget {
  @override
  _botState createState() => _botState();
}

class _botState extends State<bot> {
  InAppWebViewController webView;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Column(children: <Widget>[
      Expanded(
        child: Container(
          child: InAppWebView(
            initialUrl: 'https://wecare2021.000webhostapp.com/bot/bot.html',
            initialHeaders: {},
            onWebViewCreated: (InAppWebViewController controller) {
              webView = controller;
            },
            onLoadStart: (InAppWebViewController controller, String url) {},
            onLoadStop: (InAppWebViewController controller, String url) {},
          ),
        ),
      ),
    ])));
  }
}
