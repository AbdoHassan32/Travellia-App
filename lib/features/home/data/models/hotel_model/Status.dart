class Status {
  Status({
      this.unfilteredTotalSize, 
      this.commerceCountryIsoCode, 
      this.autobroadened, 
      this.progress, 
      this.auctionKey, 
      this.primaryGeo, 
      this.pricing, 
      this.doubleClickZone,});

  Status.fromJson(dynamic json) {
    unfilteredTotalSize = json['unfiltered_total_size'];
    commerceCountryIsoCode = json['commerce_country_iso_code'];
    autobroadened = json['autobroadened'];
    progress = json['progress'];
    auctionKey = json['auction_key'];
    primaryGeo = json['primary_geo'];
    pricing = json['pricing'];
    doubleClickZone = json['doubleClickZone'];
  }
  String? unfilteredTotalSize;
  String? commerceCountryIsoCode;
  bool? autobroadened;
  String ?progress;
  String? auctionKey;
  String ?primaryGeo;
  String? pricing;
  String? doubleClickZone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['unfiltered_total_size'] = unfilteredTotalSize;
    map['commerce_country_iso_code'] = commerceCountryIsoCode;
    map['autobroadened'] = autobroadened;
    map['progress'] = progress;
    map['auction_key'] = auctionKey;
    map['primary_geo'] = primaryGeo;
    map['pricing'] = pricing;
    map['doubleClickZone'] = doubleClickZone;
    return map;
  }

}