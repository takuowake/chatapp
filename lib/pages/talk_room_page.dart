import 'package:chatapp/model/message.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class TalkRoomPage extends StatefulWidget {
  final String name;
  const TalkRoomPage(this.name, {Key? key}) : super(key: key);

  @override
  State<TalkRoomPage> createState() => _TalkRoomPageState();
}

class _TalkRoomPageState extends State<TalkRoomPage> {
  List<Message> messageList = [
    Message(message: 'message1', isMe: true, sendtime: DateTime(2022, 1, 1, 12, 0)),
    Message(message: 'message2', isMe: false, sendtime: DateTime(2022, 1, 1, 13, 0)),
    Message(message: 'message2af;jdksjk;sadfsdjf;asdkfa;fkjasd;jfa;sdkfj;dsajf;asdj;f', isMe: false, sendtime: DateTime(2022, 1, 1, 13, 0)),
    Message(message: 'message1', isMe: true, sendtime: DateTime(2022, 1, 1, 12, 0)),
    Message(message: 'message2', isMe: false, sendtime: DateTime(2022, 1, 1, 13, 0)),
    Message(message: 'message2af;jdksjk;sadfsdjf;asdkfa;fkjasd;jfa;sdkfj;dsajf;asdj;f', isMe: false, sendtime: DateTime(2022, 1, 1, 13, 0)),
    Message(message: 'message1', isMe: true, sendtime: DateTime(2022, 1, 1, 12, 0)),
    Message(message: 'message2', isMe: false, sendtime: DateTime(2022, 1, 1, 13, 0)),
    Message(message: 'message2af;jdksjk;sadfsdjf;asdkfa;fkjasd;jfa;sdkfj;dsajf;asdj;f', isMe: false, sendtime: DateTime(2022, 1, 1, 13, 0)),
    Message(message: 'message1', isMe: true, sendtime: DateTime(2022, 1, 1, 12, 0)),
    Message(message: 'message2', isMe: false, sendtime: DateTime(2022, 1, 1, 13, 0)),
    Message(message: 'message2af;jdksjk;sadfsdjf;asdkfa;fkjasd;jfa;sdkfj;dsajf;asdj;f', isMe: false, sendtime: DateTime(2022, 1, 1, 13, 0)),
    Message(message: 'message1', isMe: true, sendtime: DateTime(2022, 1, 1, 12, 0)),
    Message(message: 'message2', isMe: false, sendtime: DateTime(2022, 1, 1, 13, 0)),
    Message(message: 'message2af;jdksjk;sadfsdjf;asdkfa;fkjasd;jfa;sdkfj;dsajf;asdj;f', isMe: false, sendtime: DateTime(2022, 1, 1, 13, 0)),
    Message(message: 'message1', isMe: true, sendtime: DateTime(2022, 1, 1, 12, 0)),
    Message(message: 'message2', isMe: false, sendtime: DateTime(2022, 1, 1, 13, 0)),
    Message(message: 'message2af;jdksjk;sadfsdjf;asdkfa;fkjasd;jfa;sdkfj;dsajf;asdj;f', isMe: false, sendtime: DateTime(2022, 1, 1, 13, 0))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        title: Text(widget.name)
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 60.0),
            child: ListView.builder(
              physics: const RangeMaintainingScrollPhysics(),
              shrinkWrap: true,
              reverse: true,
              itemCount: messageList.length,
              itemBuilder: (context, index){
                return Padding(
                  padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: index == 0 ? 10 : 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    textDirection: messageList[index].isMe ? TextDirection.rtl : TextDirection.ltr,
                    children: [
                      Container(
                        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
                        decoration: BoxDecoration(
                          color: messageList[index].isMe ? Colors.green : Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        child: Text(messageList[index].message)),
                      Text(intl.DateFormat('HH:mm').format(messageList[index].sendtime))
                    ],
                  ),
                );
              }
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                color: Colors.white,
                height: 60,
                child: Row(
                  children: [
                    const Expanded(child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10),
                          border: OutlineInputBorder()
                        ),
                      ),
                    )),
                    IconButton(
                        onPressed: () {

                        },
                        icon: const Icon(Icons.send)
                    )
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                height: MediaQuery.of(context).padding.bottom,
              ),
            ],
          )
        ],
      ),
    );
  }
}
