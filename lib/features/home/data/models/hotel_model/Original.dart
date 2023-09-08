class Original {
  Original({
      this.width, 
      this.url, 
      this.height,});

  Original.fromJson(dynamic json) {
    width = json['width'];
    url = json['url'];
    height = json['height'];
  }
  String? width;
  String ?url;
  String? height;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['width'] = width;
    map['url'] = url;
    map['height'] = height;
    return map;
  }

}