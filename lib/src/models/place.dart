class Place {
  int _id;
  String _name;
  DateTime _createdAt;
  DateTime _updatedAt;
  get id => _id;
  get name => _name;
  get createdAt => _createdAt;
  get updatedAt => _updatedAt;
  set id(value) => _id = value;
  set name(value) => _name = value;
  set createdAt(value) => _createdAt = value;
  set updatedAt(value) => _updatedAt = value;

  Place.fromJson(Map<String, dynamic> parsedJson){
    this._id = parsedJson['id'];
    this._name = parsedJson['name'];
  }
}
