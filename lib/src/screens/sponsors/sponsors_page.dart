import 'package:congreso_incca/src/components/ClipShape.dart';
import 'package:congreso_incca/src/constants/config-app.dart';
import 'package:congreso_incca/src/models/sponsor.dart';
import 'package:congreso_incca/src/screens/main/main_drawer.dart';
import 'package:congreso_incca/src/screens/sponsors/components/sponsor-item.dart';

import './bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Group {
  String groupName;
  int value;

  Group(this.groupName, this.value);
}

class SponsorsPage extends StatelessWidget {
  Widget getGroupItem(context, String group, List<Sponsor> data) {
    List<Sponsor> filter =
        data.where((sponsor) => sponsor.category == group).toList();
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(
            'Categoria $group',
            style:
                TextStyle(fontSize: 24, color: Theme.of(context).primaryColor),
          ),
        ),
        Divider(),
        Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: filter
                  .map((sponsor) => SponsorItem(sponsor: sponsor))
                  .toList(),
            ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    SponsorsBloc _bloc = BlocProvider.of<SponsorsBloc>(context);
    _bloc.dispatch(LoadSponsorsEvent());

    return BlocBuilder<SponsorsBloc, SponsorsState>(
        bloc: _bloc,
        builder: (BuildContext context, SponsorsState state) {
          return Scaffold(
              appBar: AppBar(title: Text('Auspiciadores')),
              drawer: MainDrawer(),
              body: ListView(
                children: <Widget>[
                  ClipShape(
                    name: 'Turismo',
                    hasImage: true,
                    image: URL_LOGO_APP,
                  ),
                  getGroupItem(context, "platino", state.sponsors),
                  getGroupItem(context, "oro", state.sponsors),
                  getGroupItem(context, "plata", state.sponsors),
                  getGroupItem(context, "bronce", state.sponsors),
                ],
              ));
        });
  }
}
