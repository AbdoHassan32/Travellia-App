import 'MobileContacts.dart';

class BusinessListings {
  BusinessListings({
    this.mobileContacts,});

  BusinessListings.fromJson(dynamic json) {

    if (json['mobile_contacts'] != null) {
      mobileContacts = [];
      json['mobile_contacts'].forEach((v) {
        mobileContacts!.add(MobileContacts.fromJson(v));
      });
    }
  }
  List<MobileContacts>? mobileContacts;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (mobileContacts != null) {
      map['mobile_contacts'] = mobileContacts!.map((v) => v.toJson()).toList();
    }
    return map;
  }

}