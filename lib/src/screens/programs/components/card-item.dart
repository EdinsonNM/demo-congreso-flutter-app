import 'package:congreso_incca/src/models/program.dart';
import 'package:congreso_incca/src/screens/programs/components/programDetail.dart';
import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  final Program program;
  CardItem({this.program});
  Future _openDetail(context) async {
    Navigator.of(context).push(new MaterialPageRoute(
        builder: (BuildContext context) {
          return ProgramDetail(program: this.program);
        },
        fullscreenDialog: true)).then((bonus){
          if(bonus != null){
          }
        });
  }
  @override
  Widget build(BuildContext context) {
    final makeListTile = ListTile(
      onTap: (){if(program.speaker!= -1)_openDetail(context);},
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        leading: (program.speaker!= -1)? Container(
          padding: EdgeInsets.only(right: 6.0),
          decoration: new BoxDecoration(
              border: new Border(
                  right: new BorderSide(width: 1.0, color: Colors.white24))),
          child: Column(
            children: <Widget>[
              Icon(Icons.timer, color: Colors.black, size: 20),
              Text(this.program.time),
            ],
          )
        ) : null,
        title: Text(
          this.program.session,
          style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold, fontSize: (program.speaker!= -1)? 16 : 20),
        ),
        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

        subtitle:  (program.speaker!= -1)?Column
        (
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(this.program.subject, style: TextStyle(color: Colors.grey[900])),
            Text(this.program.speakerName, style: TextStyle(color: Colors.grey))
          ],
        ) : Text(this.program.time),
        trailing:
            (program.speaker!= -1)?Icon(Icons.keyboard_arrow_right, color: Colors.black, size: 30.0):null);
    final makeCard = Card(
      elevation: 1.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: makeListTile,
      ),
    );
    return makeCard;
  }
}