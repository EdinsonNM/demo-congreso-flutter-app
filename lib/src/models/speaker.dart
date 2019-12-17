class SpeakerResults{
  List<Speaker> results;
  SpeakerResults({this.results});
  SpeakerResults.fromJson(Iterable json){
    if(json != null){
      results = json.map((sponsor) => Speaker.fromJson(sponsor)).toList();
    }
  }
}
class Speaker{
  String _id;
  String _country;
  String _name;
  String _image;

  Speaker.fromJson(Map<String, dynamic> parsedJson){
    this._id = (parsedJson['id']).toString();
    this._name = parsedJson['name'];
    this._image = parsedJson['image'];
    this._country = (parsedJson['country']).toString();
  }
  get id => this._id;
  get name => this._name;
  get image => this._image;
  get country => this._country;

}