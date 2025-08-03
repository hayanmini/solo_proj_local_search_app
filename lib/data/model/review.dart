class Review {
  String id;
  String content;
  double mapx;
  double mapy;
  DateTime createdAt;

  Review({
    required this.id,
    required this.content,
    required this.mapx,
    required this.mapy,
    required this.createdAt,
  });

  Review.fromJson(Map<String, dynamic> json)
    : this(
        id: json["id"],
        content: json["content"],
        mapx: json["mapx"],
        mapy: json["mapy"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "content": content,
    "mapx": mapx,
    "mapy": mapy,
    "createdAt": createdAt.toString(),
  };
}
