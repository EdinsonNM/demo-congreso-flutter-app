class TourismResults{
  List<Tourism> results;
  TourismResults({this.results});
  TourismResults.fromJson(Iterable json){
    if(json != null){
      results = json.map((sponsor) => Tourism.fromJson(sponsor)).toList();
    }
  }
}
class Tourism {
  int _id;
  String _title;
  String _image;
  get id => _id;
  get title => _title;
  get image => _image;
  set id(value) => _id = value;
  set title(value) => _title = value;
  set image(value) => _image = value;

  Tourism.fromJson(Map<String, dynamic> parsedJson){
    this._id = parsedJson['id'];
    this._title = parsedJson['title'];
    this._image = parsedJson['image'];
  }
}
