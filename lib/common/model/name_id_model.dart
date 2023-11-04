class NameIdModel {
  String? id;
  String? name;
  NameIdModel({this.id, this.name});
  factory NameIdModel.fromMap(dynamic map) {
    return NameIdModel(
      id: map['id']?.toString(),
      name: map['name']?.toString(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NameIdModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name;

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
