import 'package:flutter_local_search_app/data/model/location.dart';
import 'package:flutter_local_search_app/data/repository/location_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeViewModel extends AutoDisposeNotifier<List<Location>> {
  @override
  List<Location> build() {
    return [];
  }

  Future<void> searchList(String text) async {
    final repository = LocationRepository();
    state = await repository.findByName(text);
  }
}

final homeViewModelProvider =
    NotifierProvider.autoDispose<HomeViewModel, List<Location>>(() {
      return HomeViewModel();
    });
