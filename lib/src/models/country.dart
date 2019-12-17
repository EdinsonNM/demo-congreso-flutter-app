class CountryResults{
  List<Country> results;
  CountryResults({this.results});
  CountryResults.fromJson(Iterable json){
    if(json != null){
      results = json.map((sponsor) => Country.fromJson(sponsor)).toList();
    }
  }
}
class Country {
  int _id;
  String _name;
  String _image;
  get id => _id;
  get name => _name;
  get image => _image;
  set id(value) => _id = value;
  set name(value) => _name = value;
  set image(value) => _image = value;

  Country.fromJson(Map<String, dynamic> parsedJson){
    this._id = parsedJson['id'];
    this._name = parsedJson['name'];
    this._image = parsedJson['image'];
  }
}
