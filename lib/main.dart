import 'package:chatapp/firebase_options.dart';
import 'package:chatapp/firestore/room_firestore.dart';
import 'package:chatapp/firestore/user_firestore.dart';
import 'package:chatapp/pages/top_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final myUid = await UserFirestore.createUser();
  if(myUid != null) RoomFirestore.createRoom(myUid);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TopPage(),
    );
  }
}