import 'package:congreso_incca/src/constants/pages/welcome.dart';
import 'package:congreso_incca/src/models/comite.dart';
import 'package:congreso_incca/src/screens/main/main_drawer.dart';
import 'package:congreso_incca/src/screens/welcome/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html_view/flutter_html_view.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WelcomeBloc _bloc = BlocProvider.of<WelcomeBloc>(context);
    _bloc.dispatch(LoadComitesEvent());
    return BlocBuilder<WelcomeBloc, WelcomeState>(
        bloc: _bloc,
        builder: (BuildContext context, WelcomeState state) {
          return Scaffold(
            appBar: AppBar(title: Text('Bienvenido')),
            drawer: MainDrawer(),
            body: ListView(
              children: <Widget>[
                FittedBox(
                  child: Image.network(
                    'https://firebasestorage.googleapis.com/v0/b/congreso-spo.appspot.com/o/bienvenidos%2FJuan%20Carlos%20Corbera.png?alt=media&token=2b574b4a-752c-4aaf-bf1b-7c65bb2f96f2',
                  ),
                  fit: BoxFit.fill,
                ),
                Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(WELCOME_PAGE['title'],
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Text(WELCOME_PAGE['subtitle'],
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey)),
                        HtmlView(
                            data: WELCOME_PAGE['content'], scrollable: false),
                        Padding(
                          padding: EdgeInsets.only(top: 20,),
                          child: Text("Comité organizador", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                        ),
                        Column(children: state.comites.map((Comite comite) => ListTile(
                                title: Text(comite.name),
                                subtitle: Text(comite.title),

                                leading: CircleAvatar(
                                  
                                  backgroundImage:
                                      NetworkImage(comite.image),
                                ))).toList())
                       
                      ],
                    ))
              ],
            ),
          );
        });
  }
}
