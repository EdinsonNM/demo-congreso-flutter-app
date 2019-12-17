class ComiteResults{
  List<Comite> results;
  ComiteResults({this.results});
  ComiteResults.fromJson(Iterable json){
    if(json != null){
      results = json.map((sponsor) => Comite.fromJson(sponsor)).toList();
    }
  }
}
class Comite {
  int _id;
  String _name;
  String _title;
  String _image;
  get id => _id;
  get name => _name;
  get title => _title;
  get image => _image;
  set id(value) => _id = value;
  set name(value) => _name = value;
  set title(value) => _title = value;
  set image(value) => _image = value;

  Comite.fromJson(Map<String, dynamic> parsedJson){
    this._id = parsedJson['id'];
    this._name = parsedJson['name'];
    this._title = parsedJson['title'];
    this._image = parsedJson['image'];
  }
}
