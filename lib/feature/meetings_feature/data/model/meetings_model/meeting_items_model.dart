class Items {
  String? number;
  String? description;
  String? decision;

  Items({this.number, this.description, this.decision});

  Items.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    description = json['description'];
    decision = json['decision'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['number'] = number;
    data['description'] = description;
    data['decision'] = decision;
    return data;
  }
}