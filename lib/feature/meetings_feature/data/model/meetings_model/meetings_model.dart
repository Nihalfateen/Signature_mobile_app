

import 'meetings_body_model.dart';

class MeetingsModel {
  List<MeetingsBodyModel>? meetingsBodyModel;

  MeetingsModel({this.meetingsBodyModel});

  MeetingsModel.fromJson(Map<String, dynamic> json) {
    if (json['meetings'] != null) {
      meetingsBodyModel = <MeetingsBodyModel >[];
      json['meetings'].forEach((v) {
        meetingsBodyModel!.add(MeetingsBodyModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (meetingsBodyModel!= null) {
      data['meetings'] = meetingsBodyModel!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}