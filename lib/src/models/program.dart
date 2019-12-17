class ProgramsResults{
  List<Program> results;
  ProgramsResults({this.results});
 ProgramsResults.fromJson(Map<String, dynamic> json){
    if(json != null){
      results = new List<Program>();
      json.forEach((k,v) {
        Map<String, dynamic> item = v;
        item['id'] = k;
        results.add(Program.fromJson(item));
      });
    }
  }
}
class Day{
  int id;
  String name;
  Day.fromJson(Map<String, dynamic> parsedJson){
    this.id = parsedJson['id'];
    this.name = parsedJson['name'];
  }
}
class Program{
    String _id;
    String _day;
    String _place;
    String _speaker;
    String _speakerName;
    String _subject;
    String _session;
    String _time;
    Program.fromJson(Map<String, dynamic> parsedJson){
      this._id=parsedJson['id'];
      this._day=(parsedJson['day']).toString();
      this._speaker=parsedJson['speaker']!='' ? (parsedJson['speaker']).toString() : "-1" ;
      this._speakerName=parsedJson['speakerName'];
      this._session=parsedJson['session'];
      this._time=parsedJson['time'];
      this._subject=parsedJson['subject'];
      this._place=parsedJson['place'];
    }
  get id => this._id;
  get day => this._day;
  get place => this._place;
  get subject => this._subject;
  get speaker => this._speaker;
  get speakerName => this._speakerName;
  get time => this._time;
  get session => this._session;

}