import 'Images.dart';

class Photo {
  Photo({
      this.images, 
      this.isBlessed, 
      this.uploadedDate, 
      this.caption, 
      this.id, 
      this.helpfulVotes, 
      this.publishedDate, 
      this.user,});

  Photo.fromJson(dynamic json) {
    images = json['images'] != null ? Images.fromJson(json['images']) : null;
    isBlessed = json['is_blessed'];
    uploadedDate = json['uploaded_date'];
    caption = json['caption'];
    id = json['id'];
    helpfulVotes = json['helpful_votes'];
    publishedDate = json['published_date'];
    user = json['user'];
  }
  Images? images;
  bool? isBlessed;
  String ?uploadedDate;
  String? caption;
  String? id;
  String? helpfulVotes;
  String? publishedDate;
  dynamic user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (images != null) {
      map['images'] = images!.toJson();
    }
    map['is_blessed'] = isBlessed;
    map['uploaded_date'] = uploadedDate;
    map['caption'] = caption;
    map['id'] = id;
    map['helpful_votes'] = helpfulVotes;
    map['published_date'] = publishedDate;
    map['user'] = user;
    return map;
  }

}