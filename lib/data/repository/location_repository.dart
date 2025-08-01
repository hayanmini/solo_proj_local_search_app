import 'package:dio/dio.dart';

class LocationRepository {
  final Dio _client = Dio(
    BaseOptions(
      // 실패 응답 처리
      validateStatus: (status) => true,
    ),
  );

  Future<List<String>> findByName(String query) async {
    try {
      final response = await _client.get(
        "https://openapi.naver.com/v1/search/local.json",
        queryParameters: {
          "query": query,
          "display": 5,
          //"Accept": "*/*",
          "X-Naver-Client-Id": "5IomOPFdPuVZzj9vWanR",
          "X-Naver-Client-Secret": "dC4Vr7QtmM",
        },
      );
      if (response.statusCode == 200) {
        final items = response.data["rss"]["channel"]["item"];
        final itemList = List.from(items);
        final iterable = itemList.map((item) {
          return "${item["title"]}";
        });
        return iterable.toList();
      }
      // response.data;
      return [];
    } catch (e) {
      print(e);
      return [];
    }
  }
}
