import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsapp_ui/features/auth/controller/auth_controller.dart';
import 'package:whatsapp_ui/utils/utils.dart';

class UserInformationScreen extends ConsumerStatefulWidget {
  static const String routeName = '/user-information';
  const UserInformationScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<UserInformationScreen> createState() =>
      _UserInformationScreenState();
}

class _UserInformationScreenState extends ConsumerState<UserInformationScreen> {
  final TextEditingController nameController = TextEditingController();
  File? image;

  @override
  void initState() {
    super.initState();
    print('user inforamtion screen initState');
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
  }

  void selectImage() async {
    image = await pickImageFormGallery(context);
    // setState 만으로 다시 뷰가 로드 됨
    setState(() {});
  }

  void saveUserDataToHomeScreen() async {
    final name = nameController.text.trim();

    if (name.isNotEmpty) {
      ref
          .read(authControllerProvider)
          .saveUserDataToFirebaseAndToHomeScreen(context, name, image);
    }
  }

  @override
  Widget build(BuildContext context) {
    print('view load');
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('user information'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                image == null
                    ? CircleAvatar(
                        radius: 100,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.person,
                          size: 100,
                        ),
                      )
                    : CircleAvatar(
                        radius: 100,
                        backgroundImage: FileImage(image!),
                      ),
                IconButton(
                  onPressed: selectImage,
                  icon: Icon(
                    Icons.add_a_photo,
                    size: 50,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text('user name'),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: size.width * 0.7,
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: 'user name',
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => saveUserDataToHomeScreen(),
                  icon: Icon(Icons.send),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
