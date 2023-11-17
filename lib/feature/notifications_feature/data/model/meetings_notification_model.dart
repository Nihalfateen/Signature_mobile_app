class MeetingNotificationsModel {
  int? id;
  String? name;
  String? date;
  String? description;

  MeetingNotificationsModel({this.id, this.name, this.date, this.description});

  MeetingNotificationsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    date = json['date'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['date'] = date;
    data['description'] = description;
    return data;
  }
}