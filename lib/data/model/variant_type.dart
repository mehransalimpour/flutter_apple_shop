class VariantType {
  String? id;
  String? name;
  String? title;
  VariantTypeEnum? type;

  VariantType(this.id, this.name, this.title, this.type);

  factory VariantType.fromjson(Map<String, dynamic> jsonObject) {
    return VariantType(
      jsonObject['id'],
      jsonObject['name'],
      jsonObject['title'],
      _getTypeEnum(jsonObject['type']),
    );
  }
}

VariantTypeEnum _getTypeEnum(String type) {
  switch (type) {
    case 'Color':
      return VariantTypeEnum.cOLOR;
    case 'Storage':
      return VariantTypeEnum.sTORAGE;
    case 'Voltage':
      return VariantTypeEnum.vOLTAGE;
    default:
      return VariantTypeEnum.cOLOR;
  }
}

enum VariantTypeEnum { cOLOR, sTORAGE, vOLTAGE }
