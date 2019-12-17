import 'package:congreso_incca/src/components/ClipShape.dart';
import 'package:congreso_incca/src/models/program.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc.dart';

class ProgramDetail extends StatelessWidget {
  final Program program;
  ProgramDetail({this.program});
  @override
  Widget build(BuildContext context) {
    ProgramsBloc _bloc = BlocProvider.of<ProgramsBloc>(context);
    _bloc.dispatch(LoadSpeakerEvent(id: this.program.speaker));
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text("Detalle del programa"),
        ),
        body: BlocBuilder<ProgramsBloc, ProgramsState>(
            bloc: _bloc,
            builder: (BuildContext context, ProgramsState state) {
              if (this.program != null) {
                return ListView(
                  children: <Widget>[
                    ClipShape(
                      image: state.speaker != null && state.speaker.image != ''
                          ? state.speaker.image
                          : 'https://firebasestorage.googleapis.com/v0/b/congreso-spo.appspot.com/o/expositores%2Favatar.png?alt=media&token=76b2cd0e-05eb-47d4-895d-ccd192ae26d6',
                      hasAvatar: true,
                    ),
                    Center(
                        child: Column(
                      children: <Widget>[
                        Text(
                          '${this.program.speakerName} ',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Expositor',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        )
                      ],
                    )),
                    Container(
                        padding: EdgeInsets.all(20),
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ListTile(
                              title: Text('Hora'),
                              subtitle: Text('${this.program.time}'),
                            ),
                            ListTile(
                              title: Text('Tema'),
                              subtitle: Text(this.program.subject),
                            ),
                            ListTile(
                              title: Text('Curso'),
                              subtitle: Text(this.program.session),
                            ),
                            ListTile(
                              title: Text('Lugar'),
                              subtitle: Text(this.program.place != null
                                  ? this.program.place
                                  : ''),
                            ),
                          ],
                        ))
                  ],
                );
              }
              return ListView(children: <Widget>[
                ClipShape(
                  image: "",
                  hasAvatar: true,
                )
              ]);
            }));
  }
}
