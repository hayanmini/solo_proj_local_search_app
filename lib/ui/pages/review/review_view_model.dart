import 'package:flutter_local_search_app/data/model/review.dart';
import 'package:flutter_local_search_app/data/repository/review_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReviewViewModel
    extends AutoDisposeFamilyAsyncNotifier<List<Review>, String> {
  @override
  Future<List<Review>> build(String arg) async {
    final repository = ReviewRepository();
    return await repository.getAll(arg);
  }

  Future<void> reviewList(String id) async {
    final repository = ReviewRepository();
    state = AsyncValue.data(await repository.getAll(id));
  }
}

final reviewViewModelProvider = AsyncNotifierProvider.autoDispose
    .family<ReviewViewModel, List<Review>, String>(() {
      return ReviewViewModel();
    });
