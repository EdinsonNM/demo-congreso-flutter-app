import 'package:congreso_incca/src/models/sponsor.dart';
import 'package:flutter/material.dart';

class SponsorItem extends StatelessWidget {
  final Sponsor sponsor;
  SponsorItem({this.sponsor});
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
                      fit: BoxFit.contain,
                      alignment: Alignment.center,
                      child: Image.network(sponsor.image),
                    ),
                  ),
                 
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
