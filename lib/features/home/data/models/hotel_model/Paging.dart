class Paging {
  Paging({
      this.results, 
      this.totalResults,});

  Paging.fromJson(dynamic json) {
    results = json['results'];
    totalResults = json['total_results'];
  }
  String ?results;
  String? totalResults;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['results'] = results;
    map['total_results'] = totalResults;
    return map;
  }

}