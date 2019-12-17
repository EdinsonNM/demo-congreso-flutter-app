import 'package:congreso_incca/src/components/ClipShape.dart';
import 'package:congreso_incca/src/constants/config-app.dart';
import 'package:congreso_incca/src/constants/menu.dart';
import 'package:congreso_incca/src/constants/routes/routes-ui.dart';
import 'package:congreso_incca/src/screens/main/main_drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  Widget _infoBox(context, {String title, IconData icon, String url}) {
    return Expanded(
        child: FlatButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      padding: EdgeInsets.all(10),
      color: Colors.white,
      onPressed: () {
        Navigator.pushNamed(context, url);
      },
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Icon(icon, size: 48, color: Theme.of(context).primaryColor),
            Text(
              title,
              style: TextStyle(
                fontSize: 11,
              ),
              overflow: TextOverflow.ellipsis,
              softWrap: true,
            ),
          ],
        ),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    List<Widget> items = [];
    int maxCol = media.width > 320.0 ? 3 : 2;
    int counter = 0;
    List<Widget> itemsRow = [];
    for (var i = 1; i < MAIN_MENU.length; i++) {
       itemsRow.add(  _infoBox(context,
                          title: MAIN_MENU[i]['name'],
                          icon: MAIN_MENU[i]['icon'],
                          url: MAIN_MENU[i]['url']));
                          if(counter< maxCol -1){
          itemsRow.add(SizedBox(width: 10.0));
        }
         counter++;
      if(counter == maxCol || i== MAIN_MENU.length - 1){
      
        items.add(Row(children: itemsRow.toList()));
        items.add(Padding(
                    padding: EdgeInsets.only(top: 10),
                  ));
        counter = 0;
        itemsRow = [];
      }
    }
      items.insert(0,  ClipShape(
              image: URL_LOGO_APP,
              hasImage: true,
            ));      

    return Scaffold(
      appBar: AppBar(title: Text('Inicio'), actions: <Widget>[
        IconButton(
          icon: Icon(Icons.notifications),
          onPressed: () {
            Navigator.of(context).pushNamed(Routes.notifications);
          },
        )
      ]),
      drawer: MainDrawer(),
      body: Container(
        child: ListView(
          children: items),
      ),
    );
  }
}
