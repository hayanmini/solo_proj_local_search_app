import 'package:flutter/material.dart';
import 'package:flutter_local_search_app/ui/pages/review/review_view_model.dart';
import 'package:flutter_local_search_app/ui/pages/review/widgets/review_list.dart';
import 'package:flutter_local_search_app/ui/pages/review/widgets/review_write.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReviewPage extends ConsumerStatefulWidget {
  final String id;
  final String title;
  final double mapX;
  final double mapY;

  const ReviewPage({
    super.key,
    required this.id,
    required this.title,
    required this.mapX,
    required this.mapY,
  });

  @override
  ConsumerState<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends ConsumerState<ReviewPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.title, style: TextStyle(fontSize: 24)),
        ),
        body: ReviewList(id: widget.id),
        bottomSheet: ReviewWrite(
          id: widget.id,
          mapX: widget.mapX,
          mapY: widget.mapY,
        ),
      ),
    );
  }
}
