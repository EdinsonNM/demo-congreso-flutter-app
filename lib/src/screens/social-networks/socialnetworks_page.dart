import 'package:congreso_incca/src/components/ClipShape.dart';
import 'package:congreso_incca/src/constants/config-app.dart';
import 'package:congreso_incca/src/screens/main/main_drawer.dart';
import 'package:url_launcher/url_launcher.dart';
import './bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

_launchURL() async {
  const url = 'https://www.facebook.com/congresoregionaloftalmologia/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
class SocialNetworksPage extends StatelessWidget {
  Widget cardCountry(context, Map<String, dynamic> item) {
    return Card(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Image.asset(item['url']),
          ),
          Text(item['name'])
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SocialnetworksBloc _bloc = BlocProvider.of<SocialnetworksBloc>(context);
    _bloc.dispatch(LoadSocialnetworksEvent());

    return BlocBuilder<SocialnetworksBloc, SocialnetworksState>(
        bloc: _bloc,
        builder: (BuildContext context, SocialnetworksState state) {
          return Scaffold(
              appBar: AppBar(title: Text('Redes sociales')),
              drawer: MainDrawer(),
              body: ListView(
                children: <Widget>[
                  ClipShape(
                    name: 'Programa',
                    hasImage: true,
                    image: URL_LOGO_APP,
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/facebook.jpg'),
                    ),
                    title: Text("Facebook"),
                    onTap: _launchURL,
                  )
                ],
              ));
        });
  }
}
