import 'package:cloud_firestore/cloud_firestore.dart';

class UserFirestore {
  static FirebaseFirestore _firebaseFirestoreInstance = FirebaseFirestore.instance;
  static final _userCollection = _firebaseFirestoreInstance.collection('user');

  static Future<void> createUser() async {
    try {
      _userCollection.add({
        'name': 'name1',
        'image_path': 'https://cdn-images-1.medium.com/max/1200/1*ilC2Aqp5sZd1wi0CopD1Hw.png'
      });
      print('アカウント作成完了');
    } catch(e) {
      print('アカウント作成失敗：$e');
    }
  }

  static Future<void> fetchUsers() async {
    try {
      final snapshot = await _userCollection.get();
      snapshot.docs.forEach((doc) {
        print('ドキュメントID：${doc.id} ---- 名前：${doc.data()['name']}');
      });
    } catch(e) {
      print('ユーザー情報の取得失敗：$e');
    }
  }
}