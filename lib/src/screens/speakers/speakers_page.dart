import 'package:congreso_incca/src/components/ClipShape.dart';
import 'package:congreso_incca/src/constants/config-app.dart';
import 'package:congreso_incca/src/screens/main/main_drawer.dart';
import './bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/speakersList.dart';

class SpeakersPage extends StatelessWidget {
  Future _openDetail(context) async {
    Navigator.of(context)
        .push(new MaterialPageRoute(
            builder: (BuildContext context) {
              return SpeakersList(id: 0);
            },
            fullscreenDialog: true))
        .then((bonus) {
      if (bonus != null) {}
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];

    SpeakersBloc _bloc = BlocProvider.of<SpeakersBloc>(context);
    _bloc.dispatch(LoadCountriesEvent());
    _bloc.dispatch(LoadSpeakersEvent());

    return BlocBuilder<SpeakersBloc, SpeakersState>(
        bloc: _bloc,
        builder: (BuildContext context, SpeakersState state) {
          items.clear();
          items.add(ClipShape(
            name: 'Expositores',
            hasImage: true,
            image: URL_LOGO_APP,
          ));
          if (state.inProgress) {
            items.add(
                Container(child: Center(child: CircularProgressIndicator())));
          }
          state.countries.forEach((country) {
            items.add(ListTile(
              title: Text(country.name),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(country.image),
              ),
              onTap: () {
                _bloc.dispatch(LoadSpeakersByCountryEvent(country: country.id));
                _openDetail(context);
              },
            ));
            items.add(Divider(
              color: Colors.grey,
            ));
          });
          return Scaffold(
            appBar: AppBar(title: Text('Expositores')),
            drawer: MainDrawer(),
            body: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return items[index];
              },
            ),
          );
        });
  }
}
