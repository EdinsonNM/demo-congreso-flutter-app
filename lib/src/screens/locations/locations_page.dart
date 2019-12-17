import 'package:congreso_incca/src/screens/main/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

_launchURL() async {
  const url = 'https://firebasestorage.googleapis.com/v0/b/congreso-spo.appspot.com/o/plano%2FPLANO%20REGIONAL%20DE%20OFTAMOLOG%C3%8DA%2020.08.19-02.jpg?alt=media&token=edb86872-4426-4da6-995a-08fba1615064';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
class LocationsPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(title: Text('Ubicación')),
      drawer: MainDrawer(),
      body: WebView(
        initialUrl: 'https://www.google.com/maps/place/Casa+Andina+Standard+Trujillo+Plaza/@-8.1135834,-79.0301901,17z/data=!3m1!4b1!4m8!3m7!1s0x91ad3d8354648a39:0xf86dfb2dac3975be!5m2!4m1!1i2!8m2!3d-8.1135887!4d-79.0280014',
        javascriptMode: JavascriptMode.unrestricted,
      ),
      persistentFooterButtons: <Widget>[
       
        FlatButton(
                onPressed: _launchURL,
                child: Row(
                 children: <Widget>[
                    Text(
                    "Descargar plano del evento",
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                  SizedBox(width: 10,),
                  Icon(
                    Icons.cloud_download,
                    color: Theme.of(context).primaryColor,
                  ),
                 ],
                ),
              )
      ],
      
    );
  }
}

