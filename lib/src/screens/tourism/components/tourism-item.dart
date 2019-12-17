import 'package:congreso_incca/src/models/tourism.dart';
import 'package:flutter/material.dart';

class TourismItem extends StatelessWidget {
  final Tourism tourism;
  TourismItem({this.tourism});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 180.0,
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: FittedBox(
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                      child: Image.network(tourism.image),
                    ),
                  ),
                 
                ],
              ),
            ),
            ButtonTheme.bar(
              child: ButtonBar(
                alignment: MainAxisAlignment.start,
                children: <Widget>[
                  FlatButton(
                      onPressed: () {},
                      child: Row(
                        children: <Widget>[
                        
                          Text(tourism.title, style: TextStyle(fontSize: 16, color: Colors.black))
                        ],
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
