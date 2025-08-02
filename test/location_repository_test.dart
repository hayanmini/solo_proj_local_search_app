import 'package:flutter_local_search_app/data/repository/location_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final locationRepo = LocationRepository();
  test("location_repository : findByName test", () async {
    final result = await locationRepo.findByName("온천");
    print(result);
    expect(result.isEmpty, false);

    final result2 = await locationRepo.findByName("!");
    expect(result2.isEmpty, true);
  });
}
