import 'package:congreso_incca/src/components/ClipShape.dart';
import 'package:congreso_incca/src/constants/config-app.dart';
import 'package:congreso_incca/src/screens/main/main_drawer.dart';
import 'package:congreso_incca/src/screens/tourism/components/tourism-item.dart';
import 'package:url_launcher/url_launcher.dart';
import './bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

_launchURL() async {
  const url =
      'https://firebasestorage.googleapis.com/v0/b/congreso-spo.appspot.com/o/turismo%2FTOURS%20TRUJILLO%20.%20COSTAMAR.pdf?alt=media&token=109c4857-858a-4850-af7c-9de97111d4b3';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class TourismPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];

    TourismBloc _bloc = BlocProvider.of<TourismBloc>(context);
    _bloc.dispatch(LoadTourismEvent());

    return BlocBuilder<TourismBloc, TourismState>(
        bloc: _bloc,
        builder: (BuildContext context, TourismState state) {
          items.clear();
          items.add(ClipShape(
            name: 'Turismo',
            hasImage: true,
            image: URL_LOGO_APP,
          ));
          if (state.inProgress) {
            items.add(
                Container(child: Center(child: CircularProgressIndicator())));
          }
          state.tourismList.forEach((tourism) {
            items.add(TourismItem(tourism: tourism));
            items.add(Divider(
              color: Colors.grey,
            ));
          });
          return Scaffold(
            appBar: AppBar(title: Text('Turismo')),
            drawer: MainDrawer(),
            body: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return items[index];
              },
            ),
            persistentFooterButtons: <Widget>[
              
              FlatButton(
                onPressed: _launchURL,
                child: Row(
                 children: <Widget>[
                    Text(
                    "Descargar información",
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
        });
  }
}
