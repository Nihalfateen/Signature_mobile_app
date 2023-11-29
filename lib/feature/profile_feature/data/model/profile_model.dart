class ProfileModel {
  Profile? profile;

  ProfileModel({this.profile});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    profile =
    json['profile'] != null ? Profile.fromJson(json['profile']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (profile != null) {
      data['profile'] = profile!.toMap();
    }
    return data;
  }
}

class Profile {
  int? id;
  String? fullName;
  String? email;
  String? phone;
  String? job;
  String? jobState;
  String? avatar;
  String?signature;

  Profile(
      {this.id,
        this.fullName,
        this.email,
        this.phone,
        this.job,
        this.jobState,
        this.avatar,
      this.signature});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    email = json['email'];
    phone = json['phone'];
    job = json['job'];
    jobState = json['job_state'];
    avatar = json['avatar'];
    signature = json['signature'];
  }
  Map<String, dynamic> toMap() {
    return {"user":{
      'full_name': fullName,
      'email': email,
      'phone': phone,
      'job': job,
      'job_state': jobState,
    }};
  }
}