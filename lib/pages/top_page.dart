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
         imagePath: 'https://cdn-images-1.medium.com/max/1200/1*ilC2Aqp5sZd1wi0CopD1Hw.png',
         lastMessage: 'thank you'),
    User(name: 'name2', uid: 'uid2',
        imagePath: 'https://cdn-images-1.medium.com/max/1200/1*ilC2Aqp5sZd1wi0CopD1Hw.png',
        lastMessage: 'your welcome'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('チャットアプリ'),),
      body: ListView.builder(
          itemCount: userList.length,
          itemBuilder: (context, index) {
            return SizedBox(
              height: 70,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: userList[index].imagePath == null
                        ? null
                        : NetworkImage(userList[index].imagePath!),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(userList[index].name, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                      Text(userList[index].lastMessage, style: const TextStyle(color: Colors.grey),)
                    ],
                  )
                ],
              ),
            );
          }
      ),
    );
  }
}
