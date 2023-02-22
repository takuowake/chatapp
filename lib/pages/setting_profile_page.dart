import 'dart:io';

import 'package:chatapp/firestore/user_firestore.dart';
import 'package:chatapp/model/user.dart';
import 'package:chatapp/utils/shared_prefs.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SettingProfilePage extends StatefulWidget {
  const SettingProfilePage({Key? key}) : super(key: key);

  @override
  State<SettingProfilePage> createState() => _SettingProfilePageState();
}

class _SettingProfilePageState extends State<SettingProfilePage> {
  File? image;
  String imagePath = '';
  final ImagePicker _picker = ImagePicker();
  final TextEditingController controller = TextEditingController();

  Future<void> selectImage() async {
    XFile? pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    if(pickedImage == null) return;

    setState(() {
      image = File(pickedImage.path);
    });
  }

  Future<void> uploadImage() async {
    String path = image!.path.substring(image!.path.lastIndexOf('/') + 1);
    final ref = FirebaseStorage.instance.ref(path);
    final storedImage = await ref.putFile(image!);
    imagePath = await storedImage.ref.getDownloadURL();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('プロフィール編集'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(width: 150, child: Text('name')),
                Expanded(child: TextField(
                  controller: controller,
                ))
              ],
            ),
            const SizedBox(height: 50,),
            Row(
              children: [
                const SizedBox(width: 150, child: Text('プロフィール画像')),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                        onPressed: () async {
                          await selectImage();
                          uploadImage();
                        },
                        child: const Text('画像の選択')
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 30,),
            image == null
              ? const SizedBox()
              : SizedBox(
                width: 200,
                height: 200,
                child: Image.file(image!, fit: BoxFit.cover)
            ),
            const SizedBox(height: 150,),
            SizedBox(
              width: 150,
              child: ElevatedButton(
                onPressed: () async {
                  User newProfile = User(
                    name: controller.text,
                    imagePath: imagePath,
                    uid: SharedPrefs.fetchUid()!
                  );
                  await UserFirestore.updateUser(newProfile);
                },
                child: const Text('編集')
              ),
            )
          ],
        ),
      ),
    );
  }
}
