class Location {
  String? title;
  String? category;
  String? roadAddress;
  int? mapx;
  int? mapy;

  Location({this.title, this.category, this.roadAddress, this.mapx, this.mapy});

  Location.fromJson(Map json) {
    title = json["title"];
    category = json["category"];
    roadAddress = json["roadAddress"];
    mapx = int.tryParse(json["mapx"]) ?? -1;
    mapy = int.tryParse(json["mapy"]) ?? -1;
  }
}
