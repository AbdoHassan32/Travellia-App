import 'Data.dart';
import 'Status.dart';
import 'Paging.dart';

class HotelModel {
  HotelModel({
      this.data, 
      this.status, 
      this.paging,});

  HotelModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    status = json['status'] != null ? Status.fromJson(json['status']) : null;
    paging = json['paging'] != null ? Paging.fromJson(json['paging']) : null;
  }
  List<Data>? data;
  Status ?status;
  Paging ?paging;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data!.map((v) => v.toJson()).toList();
    }
    if (status != null) {
      map['status'] = status!.toJson();
    }
    if (paging != null) {
      map['paging'] = paging!.toJson();
    }
    return map;
  }

}