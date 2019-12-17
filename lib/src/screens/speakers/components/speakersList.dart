import 'package:congreso_incca/src/models/speaker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc.dart';

class SpeakersList extends StatelessWidget {
  final int id;
  SpeakersList({this.id});
  Widget _cardSpeaker(Speaker speaker) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 10),
      child:Card(
      child: Padding(padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          CircleAvatar(
                radius: 60,
                backgroundImage:
                    speaker.image!=null && speaker.image != '' ? NetworkImage(speaker.image) : AssetImage('assets/images/avatar.png')),
        Container(child: Text(speaker.name, style:TextStyle(fontSize: 14, fontWeight: FontWeight.bold)), padding: EdgeInsets.all(10),)
        ],
      )),
    ));
  }

  @override
  Widget build(BuildContext context) {
    SpeakersBloc _bloc = BlocProvider.of<SpeakersBloc>(context);
    double width =  MediaQuery.of(context).size.width*0.9;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text("Expositores"),
        ),
        body: BlocBuilder<SpeakersBloc, SpeakersState>(
            bloc: _bloc,
            builder: (BuildContext context, SpeakersState state) {   
              return ListView(
                children: state.speakersByCountry.map((speaker) => _cardSpeaker(speaker)).toList(),
              );       
            }));
  }
}
