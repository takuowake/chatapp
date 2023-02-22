import 'package:cloud_firestore/cloud_firestore.dart';

class UserFirestore {
  static FirebaseFirestore _firebaseFirestoreInstance = FirebaseFirestore.instance;
  static final _userCollection = _firebaseFirestoreInstance.collection('user');

  static Future<String?> createUser() async {
    try {
      final newDoc = await _userCollection.add({
        'name': 'name1',
        'image_path': 'https://cdn-images-1.medium.com/max/1200/1*ilC2Aqp5sZd1wi0CopD1Hw.png'
      });
      print('アカウント作成完了');
      return newDoc.id;
    } catch(e) {
      print('アカウント作成失敗：$e');
      return null;
    }
  }

  static Future<List<QueryDocumentSnapshot>?> fetchUsers() async {
    try {
      final snapshot = await _userCollection.get();
      return snapshot.docs;
    } catch(e) {
      print('ユーザー情報の取得失敗：$e');
      return null;
    }
  }
}