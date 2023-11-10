class SheetModel{
  String?nameAr;
  String ? nameEn;
  int?typeID;
  SheetModel(
      {this.nameEn,
        this.nameAr,
        this.typeID
      });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is SheetModel &&
              runtimeType == other.runtimeType &&
              nameAr == other.nameAr;
  @override
  int get hashCode => typeID.hashCode;

}