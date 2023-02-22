import 'package:chatapp/firestore/user_firestore.dart';
import 'package:chatapp/model/talk_room.dart';
import 'package:chatapp/model/user.dart';
import 'package:chatapp/utils/shared_prefs.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RoomFirestore {
  static final FirebaseFirestore _firebaseFirestoreInstance = FirebaseFirestore.instance;
  static final _roomCollection = _firebaseFirestoreInstance.collection('room');
  static final joinedRoomSnapshot = _roomCollection.where('joined_user_ids', arrayContains: SharedPrefs.fetchUid()).snapshots();

  static Future<void> createRoom(String myUid) async {
    try {
      final docs = await UserFirestore.fetchUsers();
      if(docs == null) return;
      docs.forEach((doc) async {
        if(doc.id == myUid) return;
        await _roomCollection.add({
          'joined_user_ids': [doc.id, myUid],
          'created_time': Timestamp.now()
        });
      });
    } catch(e) {
      print('ルームの作成失敗：$e');
    }
  }

  static Future<List<TalkRoom>?> fetchJoinedRooms(QuerySnapshot snapshot) async {
    try {
      String myUid = SharedPrefs.fetchUid()!;
      List<TalkRoom> talkRooms = [];
      for(var doc in snapshot.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        List<dynamic> userIds = data['joined_user_ids'];
        late String talkUserUid;
        for(var id in userIds) {
          if(id == myUid) continue;
          talkUserUid = id;
        }
        User? talkUser = await UserFirestore.fetchProfile(talkUserUid);
        if(talkUser == null) return null;
        final talkRoom = TalkRoom(
            roomId: doc.id,
            talkUser: talkUser,
            lastMessage: data['last_message']
        );
        talkRooms.add(talkRoom);
      }
      print(talkRooms.length);
      return talkRooms;
    } catch(e) {
      print('参加しているルームの取得失敗：$e');
      return null;
    }
  }
  static Stream<QuerySnapshot> fetchMessageSnapshot(String roomId) {
    return _roomCollection.doc(roomId).collection('message').orderBy('send_time', descending: true).snapshots();
  }

  static Future<void> sendMessage({required String roomId, required String message}) async{
    try {
      final messageCollection = _roomCollection.doc(roomId).collection('message');
      await messageCollection.add({
        'message': message,
        'sender_id': SharedPrefs.fetchUid(),
        'send_time': Timestamp.now()
      });
      
      _roomCollection.doc(roomId).update({
        'last_message': message
      });
    } catch(e) {
      print('メッセージの送信：$e');
    }
  }
}