import 'Small.dart';
import 'Thumbnail.dart';
import 'Original.dart';
import 'Large.dart';
import 'Medium.dart';

class Images {
  Images({
      this.small, 
      this.thumbnail, 
      this.original, 
      this.large, 
      this.medium,});

  Images.fromJson(dynamic json) {
    small = json['small'] != null ? Small.fromJson(json['small']) : null;
    thumbnail = json['thumbnail'] != null ? Thumbnail.fromJson(json['thumbnail']) : null;
    original = json['original'] != null ? Original.fromJson(json['original']) : null;
    large = json['large'] != null ? Large.fromJson(json['large']) : null;
    medium = json['medium'] != null ? Medium.fromJson(json['medium']) : null;
  }
  Small? small;
  Thumbnail? thumbnail;
  Original ?original;
  Large? large;
  Medium? medium;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (small != null) {
      map['small'] = small!.toJson();
    }
    if (thumbnail != null) {
      map['thumbnail'] = thumbnail!.toJson();
    }
    if (original != null) {
      map['original'] = original!.toJson();
    }
    if (large != null) {
      map['large'] = large!.toJson();
    }
    if (medium != null) {
      map['medium'] = medium!.toJson();
    }
    return map;
  }

}