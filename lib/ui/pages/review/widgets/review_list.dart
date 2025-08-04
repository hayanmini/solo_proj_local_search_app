import 'package:flutter/material.dart';
import 'package:flutter_local_search_app/ui/pages/home/home_view_model.dart';
import 'package:flutter_local_search_app/ui/pages/review/review_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReviewList extends ConsumerStatefulWidget {
  final String id;

  const ReviewList({super.key, required this.id});

  @override
  ConsumerState<ReviewList> createState() => _ReviewListState();
}

class _ReviewListState extends ConsumerState<ReviewList> {
  @override
  Widget build(BuildContext context) {
    final review = ref.watch(reviewViewModelProvider(widget.id));
    return review.when(
      data: (list) => Padding(
        padding: const EdgeInsets.all(15),
        child: ListView.separated(
          itemCount: list.length,
          separatorBuilder: (context, index) => SizedBox(height: 12),
          itemBuilder: (context, index) {
            return Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 2.0),
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      list[index].content,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      DateTime.now().toString(),
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      loading: () => CircularProgressIndicator(),
      error: (e, _) => Text('에러: $e'),
    );
  }
}
