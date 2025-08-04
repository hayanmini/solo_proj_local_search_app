class Location {
  String? title;
  String? category;
  String? roadAddress;
  double? mapx;
  double? mapy;

  Location({this.title, this.category, this.roadAddress, this.mapx, this.mapy});

  Location.fromJson(Map json) {
    title = json["title"];
    category = json["category"];
    roadAddress = json["roadAddress"];
    mapx = double.tryParse(json["mapx"]) ?? -1;
    mapy = double.tryParse(json["mapy"]) ?? -1;
  }
}
