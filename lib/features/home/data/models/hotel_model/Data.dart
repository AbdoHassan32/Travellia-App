import 'Photo.dart';

class Data {
  Data({
      this.locationId,
      this.name, 
      this.latitude, 
      this.longitude, 
      this.numReviews, 
      this.timezone, 
      this.locationString, 
      this.photo, 
      this.awards, 
      this.preferredMapEngine, 
      this.autobroadenType, 
      this.autobroadenLabel, 
      this.rawRanking, 
      this.rankingGeo, 
      this.rankingGeoId, 
      this.rankingPosition, 
      this.rankingDenominator, 
      this.rankingCategory, 
      this.ranking, 
      this.subcategoryType, 
      this.subcategoryTypeLabel, 
      this.distance, 
      this.distanceString, 
      this.bearing, 
      this.rating, 
      this.isClosed, 
      this.isLongClosed, 
      this.priceLevel, 
      this.price, 
      this.hotelClass,
      this.hotelClassAttribution,
      this.listingKey,
    this.isFav,
    this.docId
  });

  Data.fromJson(dynamic json) {
    locationId = json['location_id'];
    name = json['name'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    numReviews = json['num_reviews'];
    timezone = json['timezone'];
    locationString = json['location_string'];
    photo = json['photo'] != null ? Photo.fromJson(json['photo']) : null;

    preferredMapEngine = json['preferred_map_engine'];
    autobroadenType = json['autobroaden_type'];
    autobroadenLabel = json['autobroaden_label'];
    rawRanking = json['raw_ranking'];
    rankingGeo = json['ranking_geo'];
    rankingGeoId = json['ranking_geo_id'];
    rankingPosition = json['ranking_position'];
    rankingDenominator = json['ranking_denominator'];
    rankingCategory = json['ranking_category'];
    ranking = json['ranking'];
    subcategoryType = json['subcategory_type'];
    subcategoryTypeLabel = json['subcategory_type_label'];
    distance = json['distance'];
    distanceString = json['distance_string'];
    bearing = json['bearing'];
    rating = json['rating'];
    isClosed = json['is_closed'];
    isLongClosed = json['is_long_closed'];
    priceLevel = json['price_level'];
    price = json['price'];
    hotelClass = json['hotel_class'];
    hotelClassAttribution = json['hotel_class_attribution'];
    listingKey = json['listing_key'];
  }
  String ?locationId;
  String? name;
  String? latitude;
  String?longitude;
  String? numReviews;
  String? timezone;
  String? locationString;
  Photo? photo;
  List<dynamic>? awards;
  String? preferredMapEngine;
  String? autobroadenType;
  String? autobroadenLabel;
  String? rawRanking;
  String? rankingGeo;
  String? rankingGeoId;
  String ?rankingPosition;
  String? rankingDenominator;
  String? rankingCategory;
  String ?ranking;
  String? subcategoryType;
  String? subcategoryTypeLabel;
  String ?distance;
  dynamic distanceString;
  String? bearing;
  String? rating;
  bool? isClosed;
  bool ?isLongClosed;
  String? priceLevel;
  String ?price;
  String? hotelClass;
  String ?hotelClassAttribution;
  String? listingKey;
  bool? isFav = false;
  String? docId='';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['location_id'] = locationId;
    map['name'] = name;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['num_reviews'] = numReviews;
    map['timezone'] = timezone;
    map['location_string'] = locationString;
    if (photo != null) {
      map['photo'] = photo!.toJson();
    }
    if (awards != null) {
      map['awards'] = awards!.map((v) => v.toJson()).toList();
    }
    map['preferred_map_engine'] = preferredMapEngine;
    map['autobroaden_type'] = autobroadenType;
    map['autobroaden_label'] = autobroadenLabel;
    map['raw_ranking'] = rawRanking;
    map['ranking_geo'] = rankingGeo;
    map['ranking_geo_id'] = rankingGeoId;
    map['ranking_position'] = rankingPosition;
    map['ranking_denominator'] = rankingDenominator;
    map['ranking_category'] = rankingCategory;
    map['ranking'] = ranking;
    map['subcategory_type'] = subcategoryType;
    map['subcategory_type_label'] = subcategoryTypeLabel;
    map['distance'] = distance;
    map['distance_string'] = distanceString;
    map['bearing'] = bearing;
    map['rating'] = rating;
    map['is_closed'] = isClosed;
    map['is_long_closed'] = isLongClosed;
    map['price_level'] = priceLevel;
    map['price'] = price;
    map['hotel_class'] = hotelClass;
    map['hotel_class_attribution'] = hotelClassAttribution;
    map['listing_key'] = listingKey;
    return map;
  }

}