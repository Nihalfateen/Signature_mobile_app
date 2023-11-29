class AvatarModel {

  String?avatar;

  AvatarModel(
      {
        this.avatar,
      });

  AvatarModel.fromJson(Map<String, dynamic> json) {
    avatar = json['avatar'];
  }
  Map<String, dynamic> toMap() {
    return {"avatar":avatar};
  }
}