import 'package:congreso_incca/src/screens/main/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SurveyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Encuesta')),
      drawer: MainDrawer(),
      body: WebView(
        initialUrl: 'https://docs.google.com/forms/d/e/1FAIpQLSfZcioW6qmi4pUxiCPTpN74hWUM_EAxYaR54AMd8_3uoXr_wg/viewform',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}