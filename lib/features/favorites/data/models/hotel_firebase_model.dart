class HotelFireBaseModel{
  final String ? name;
  final String ? location;
  final String ? imgUrl;
  final String ? price;
  final String ? rate;
  final String ? id;
  HotelFireBaseModel({
    this.location,
    this.rate,
    this.imgUrl,
    this.price,
    this.name,
    this.id,
});
  factory HotelFireBaseModel.fromJson(jsonData){
    return HotelFireBaseModel(name: jsonData['name'],location: jsonData['location'],imgUrl: jsonData['imageUrl'],price: jsonData['price'],rate: jsonData['rate'],id: jsonData['id']);
  }
}