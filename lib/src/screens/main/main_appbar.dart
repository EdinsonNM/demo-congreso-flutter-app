import 'package:congreso_incca/src/constants/routes/routes-ui.dart';
import 'package:flutter/material.dart';
class MainAppbar extends StatelessWidget {
  final String title;
  MainAppbar({Key key,this.title}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: Text(this.title),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.notifications),
          onPressed: (){
            Navigator.of(context).pushNamed(Routes.notifications);
          },
        )
      ]);

  }
}
