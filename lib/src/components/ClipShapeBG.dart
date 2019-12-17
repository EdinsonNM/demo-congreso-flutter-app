import 'package:flutter/material.dart';

import 'CustomShapeClipper.dart';

class ClipShapeBG extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _height = 700;
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
                  colors: [
                    Theme.of(context).primaryColor,
                    Theme.of(context).accentColor
                  ],
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
                  colors: [
                    Theme.of(context).primaryColor,
                    Theme.of(context).accentColor
                  ],
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
                  colors: [
                    Theme.of(context).primaryColor,
                    Theme.of(context).accentColor
                  ],
                ),
              ),
            ),
          ),
        ),
        Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 100),
            height: 300.0,
            child: Text(""))
      ],
    );
  }
}
