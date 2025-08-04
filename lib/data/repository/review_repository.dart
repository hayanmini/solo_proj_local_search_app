import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_local_search_app/data/model/review.dart';

class ReviewRepository {
  // Reviews 불러오기
  Future<List<Review>> getAll(String query) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    final collectionRef = firestore.collection(query);
    final snapshot = await collectionRef.get();
    final documentSnapshot = snapshot.docs;
    final iterable = documentSnapshot.map((e) {
      final map = {"id": e.id, ...e.data()};
      return Review.fromJson(map);
    });
    final list = iterable.toList();
    return list;
  }

  // Review 작성
  Future<bool> add({
    required String content,
    required double mapx,
    required double mapy,
    required DateTime createdAt,
  }) async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      final collectionRef = firestore.collection("${mapx}_$mapy");
      final docRef = collectionRef.doc();

      final map = {
        "content": content,
        "mapx": mapx,
        "mapy": mapy,
        "createdAt": createdAt.toString(),
      };

      await docRef.set(map);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
// final docId = 'asdasd';
              // var abc = await FirebaseFirestore.instance
              //     .collection('0_0')
              //     .get();

              // for (var doc in abc.docs) {
              //   print(doc.data());
              // }

              // var colletion = FirebaseFirestore.instance.collection("0_1");
              // var docRef = colletion.doc();
              // await docRef.set({});

              //ref.read(homeViewModelProvider.notifier).searchList(value);