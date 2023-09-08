class MobileContacts {
  MobileContacts({
      this.value, 
      this.label, 
      this.type,});

  MobileContacts.fromJson(dynamic json) {
    value = json['value'];
    label = json['label'];
    type = json['type'];
  }
  String ?value;
  String ?label;
  String ?type;

  Map<dynamic, dynamic> toJson() {
    final map = <dynamic, dynamic>{};
    map['value'] = value;
    map['label'] = label;
    map['type'] = type;
    return map;
  }

}