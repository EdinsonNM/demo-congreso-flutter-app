import 'package:congreso_incca/src/constants/config-app.dart';
import 'package:congreso_incca/src/constants/menu.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];
    items.add(DrawerHeader(
      child:  Container(
        child: Center(child:FittedBox(
              child: Image.network(
                URL_LOGO_APP,
              ),
              fit: BoxFit.fill,
            )),
      )
    ));
    MAIN_MENU.forEach((item) {
      items.add(ListTile(
        leading: Icon(item['icon']),
        title: Text(item['name']),
        onTap: () {
          Navigator.of(context).pushNamed(item['url']);
        },
      ));
    });

    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: items.toList(),
      ),
    );
  }
}
