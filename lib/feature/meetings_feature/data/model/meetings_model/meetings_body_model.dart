
import 'meeting_items_model.dart';

class MeetingsBodyModel  {
  int? id;
  String? name;
  String? date;
  String? description;
  String? meetingBody;
  String? status;
  String? leaderName;
  List<String>? groupsNames;
  List<Items>? items;


  MeetingsBodyModel (
      {this.id,
        this.name,
        this.date,
        this.description,
        this.meetingBody,
        this.status,
        this.leaderName,
        this.groupsNames,
        this.items,
      });

  MeetingsBodyModel .fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    date = json['date'];
    description = json['description'];
    meetingBody = json['meeting_body'];
    status = json['status'];
    leaderName = json['leader_name'];
    groupsNames = json['groups_names'].cast<String>();
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['date'] = date;
    data['description'] = description;
    data['meeting_body'] = meetingBody;
    data['status'] = status;
    data['leader_name'] = leaderName;
    data['groups_names'] = groupsNames;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}