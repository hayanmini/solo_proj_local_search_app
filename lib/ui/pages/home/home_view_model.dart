import 'package:flutter_local_search_app/data/model/location.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeViewModel extends AutoDisposeNotifier<Location> {
  @override
  Location build() {
    return Location();
  }

  final homeViewModelProvider =
      NotifierProvider.autoDispose<HomeViewModel, Location>(() {
        return HomeViewModel();
      });
}
