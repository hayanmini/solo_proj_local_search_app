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

  // Review 등록
  Future<bool> add({
    required String content,
    required double mapx,
    required double mapy,
    required DateTime createdAt,
  }) async {
    // 통신 오류 처리
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
