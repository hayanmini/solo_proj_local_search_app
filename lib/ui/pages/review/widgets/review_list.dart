import 'package:flutter/material.dart';
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
    // reviewViewModelProvider
    final review = ref.watch(reviewViewModelProvider(widget.id));
    return review.when(
      data: (list) => list.isEmpty
          ? // 리뷰가 없을 때
            const Center(
              child: Text(
                "리뷰가 없습니다.",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          // 리뷰가 있을 때 리스트 출력
          : Padding(
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
      // 로딩 화면 UI
      loading: () => const Expanded(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text(
                '리뷰를 불러오는 중입니다...',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
      // 에러 메세지 출력
      error: (e, _) => Text('에러: $e'),
    );
  }
}
