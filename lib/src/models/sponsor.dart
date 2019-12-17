class SponsorsResults{
  List<Sponsor> results;
  SponsorsResults({this.results});
  SponsorsResults.fromJson(Iterable json){
    if(json != null){
      results = json.map((sponsor) => Sponsor.fromJson(sponsor)).toList();
    }
  }
}
class Sponsor {
  int _id;
  String _name;
  String _url;
  String _image;
  String _category;
  get id => _id;
  get name => _name;
  get url => _url;
  get image => _image;
  get category => _category;
  set id(value) => _id = value;
  set name(value) => _name = value;
  set url(value) => _url = value;
  set image(value) => _image = value;
  set category(value) => _category = value;

  Sponsor.fromJson(Map<String, dynamic> parsedJson){
    this._id = parsedJson['id'];
    this._name = parsedJson['name'];
    this._image = parsedJson['image'];
    this._category = parsedJson['category'];
  }
}
