import 'package:flutter/material.dart';
//import 'dart:io';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    home: WebViewScreen(),
  ));
}


class WebViewScreen extends StatefulWidget {

  const WebViewScreen({Key? key}) : super(key: key);

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {


  bool isLoading=true;
  final _key = UniqueKey();

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Stack(
        children: <Widget>[

          WebView(


            key: _key,
            initialUrl: "https://www.google.com",
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (finish) {
              setState(() {
                isLoading = false;
              });
            },
          ),


          isLoading ? Center( child: CircularProgressIndicator(),)
              : Stack(),

        ],
      ),
    );
  }
}
