import 'package:flutter/material.dart';
import 'package:flutter_local_search_app/ui/pages/review/widgets/review_list.dart';
import 'package:flutter_local_search_app/ui/pages/review/widgets/review_write.dart';

class ReviewPage extends StatefulWidget {
  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(title: Text("local", style: TextStyle(fontSize: 24))),
        body: ReviewList(),
        bottomSheet: ReviewWrite(),
      ),
    );
  }
}
