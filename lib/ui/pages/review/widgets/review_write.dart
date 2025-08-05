import 'package:flutter/material.dart';
import 'package:flutter_local_search_app/data/repository/review_repository.dart';
import 'package:flutter_local_search_app/ui/pages/review/review_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReviewWrite extends ConsumerStatefulWidget {
  final String id;
  final double mapX;
  final double mapY;

  const ReviewWrite({
    super.key,
    required this.id,
    required this.mapX,
    required this.mapY,
  });

  @override
  ConsumerState<ReviewWrite> createState() => _ReviewWriteState();
}

class _ReviewWriteState extends ConsumerState<ReviewWrite> {
  // 리뷰 텍스트 필드 텍스트 컨트롤러
  TextEditingController reviewTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        height: 110,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
          child: TextFormField(
            controller: reviewTextEditingController,
            onFieldSubmitted: (value) {
              // 리뷰 등록
              var review = ReviewRepository();
              review.add(
                content: value,
                mapx: widget.mapX,
                mapy: widget.mapY,
                createdAt: DateTime.now(),
              );
              // 리뷰 리스트 출력
              ref
                  .read(reviewViewModelProvider(widget.id).notifier)
                  .reviewList(widget.id);
            },
          ),
        ),
      ),
    );
  }
}
