import 'package:flutter/material.dart';

import 'CustomShapeClipper.dart';

class ClipShape extends StatelessWidget {
  final String name;
  final IconData icon;
  final String image;
  final bool hasTitle;
  final bool hasImage;
  final bool hasAvatar;
  const ClipShape({Key key, this.name = '', this.icon, this.image='', this.hasImage = false, this.hasTitle = false, this.hasAvatar = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    Size media = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        Opacity(
          opacity: 0.3,
          child: ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
              height: _height / 3,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Theme.of(context).primaryColor, Theme.of(context).accentColor],
                ),
              ),
            ),
          ),
        ),
        Opacity(
          opacity: 0.2,
          child: ClipPath(
            clipper: CustomShapeClipper2(),
            child: Container(
              height: _height / 3.5,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Theme.of(context).primaryColor,Theme.of(context).accentColor],
                ),
              ),
            ),
          ),
        ),
        Opacity(
          opacity: 0.1,
          child: ClipPath(
            clipper: CustomShapeClipper3(),
            child: Container(
              height: _height / 3,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Theme.of(context).primaryColor, Theme.of(context).accentColor],
                ),
              ),
            ),
          ),
        ),
        this.hasImage ? Container(
          margin: EdgeInsets.only(left: 10, right: 10, top:  media.width <= 320 ? 0 : 30),
          height:180.0,
          child: Center(child: 
          FittedBox(
              child: Image.network(
                image,
              ),
              fit: BoxFit.fill,
            ))
        ) : Container(),
        this.hasTitle ? Container(
            margin: EdgeInsets.only(left: 40, right: 40, top: 100),
            child: Center(
                child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  this.icon,
                  color: Theme.of(context).accentColor,
                  size: 40,
                ),
                Text(
                  this.name,
                  style: TextStyle(fontSize: 40),
                )
              ],
            ))) :  Container(),
            this.hasAvatar ? Container(
            margin: EdgeInsets.only(left: 40, right: 40, top: 60),
            child: Center(
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: NetworkImage(this.image),
                ))) :  Container(),
            
      ],
    );
  }
}