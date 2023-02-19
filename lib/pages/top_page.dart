import 'package:chatapp/model/user.dart';
import 'package:flutter/material.dart';

class TopPage extends StatefulWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  State<TopPage> createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  List<User> userList = [
    User(name: 'name1', uid: 'uid1',
         imagePath: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.finnair.com%2Fen%2Fdestinations%2Famericas%2Fusa%2Flos-angeles&psig=AOvVaw27VlRpAzQP1usmyl6RU6sX&ust=1676861064934000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCJi9ybTIoP0CFQAAAAAdAAAAABAE',
         lastMessage: 'thank you'),
    User(name: 'name2', uid: 'uid2',
        imagePath: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.finnair.com%2Fen%2Fdestinations%2Famericas%2Fusa%2Flos-angeles&psig=AOvVaw27VlRpAzQP1usmyl6RU6sX&ust=1676861064934000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCJi9ybTIoP0CFQAAAAAdAAAAABAE',
        lastMessage: 'your welcome'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('チャットアプリ'),),
      body: Center(child: const Text('メイン画面です')),
    );
  }
}
