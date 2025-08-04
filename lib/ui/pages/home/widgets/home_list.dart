import 'package:flutter/material.dart';
import 'package:flutter_local_search_app/data/model/location.dart';
import 'package:flutter_local_search_app/ui/pages/home/home_view_model.dart';
import 'package:flutter_local_search_app/ui/pages/review/review_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeList extends ConsumerStatefulWidget {
  @override
  ConsumerState<HomeList> createState() => _HomeListState();
}

class _HomeListState extends ConsumerState<HomeList> {
  @override
  Widget build(BuildContext context) {
    var provider = ref.watch(homeViewModelProvider);
    return Padding(
      padding: const EdgeInsets.all(15),
      child: ListView.separated(
        itemCount: provider.length,
        separatorBuilder: (context, index) => SizedBox(height: 12),
        itemBuilder: (context, index) {
          var location = provider[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ReviewPage(
                    id: "${location.mapx}_${location.mapy}",
                    title: location.title!,
                    mapX: location.mapx!,
                    mapY: location.mapy!,
                  ),
                ),
              );
            },
            child: Container(
              width: double.infinity,
              height: 120,
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
                      location.title ?? "",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      location.category ?? "",
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      location.roadAddress ?? "",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
