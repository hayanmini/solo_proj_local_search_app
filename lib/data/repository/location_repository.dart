import 'package:dio/dio.dart';
import 'package:flutter_local_search_app/data/model/location.dart';

class LocationRepository {
  final Dio _client = Dio(
    BaseOptions(
      // 실패 응답 처리
      validateStatus: (status) => true,
    ),
  );

  Future<List<Location>> findByName(String query) async {
    try {
      final response = await _client.get(
        "https://openapi.naver.com/v1/search/local.json",
        queryParameters: {"query": query, "display": 5},
        options: Options(
          headers: {
            "X-Naver-Client-Id": "5IomOPFdPuVZzj9vWanR",
            "X-Naver-Client-Secret": "dC4Vr7QtmM",
          },
        ),
      );
      if (response.statusCode == 200) {
        final result = <Location>[];
        final items = response.data["items"];
        for (var item in items) {
          result.add(Location.fromJson(item));
        }
        return result;
      }
      return [];
    } catch (e) {
      print(e);
      return [];
    }
  }
}
