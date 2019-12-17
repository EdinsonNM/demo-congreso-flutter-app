class NotificationResults{
  List<Notification> results;
  NotificationResults({this.results});
  NotificationResults.fromJson(Map<String, dynamic> json){
    if(json != null){
      results = new List<Notification>();
      json.forEach((k,v) {
        Map<String, dynamic> item = v;
        item['id'] = k;
        results.add(Notification.fromJson(item));
      });
    }
  }
}
class Notification {
  String _id;
  String _title;
  String _createdAt;
  String _description;
  get id => _id;
  get title => _title;
  get description => _description;
  get createdAt => _createdAt;

  Notification.fromJson(Map<String, dynamic> parsedJson){
    this._id = parsedJson['id'];
    this._title = parsedJson['title'];
    this._description = parsedJson['description'];
    this._createdAt = parsedJson['createdAt'];
  }
}
