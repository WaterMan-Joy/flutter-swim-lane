import 'package:flutter/material.dart';
import 'package:whatsapp_ui/colors.dart';
import 'package:whatsapp_ui/lane_info.dart';
import 'package:whatsapp_ui/info.dart';
import 'package:whatsapp_ui/widgets/chat_list.dart';

class MobileChatScreen extends StatelessWidget {
  const MobileChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          communityInfo[0]['name'].toString(),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.video_call),
          ),
          Image.network(
            communityInfo[0]['avatar'].toString(),
          ),
          // IconButton(
          //   onPressed: () {},
          //   icon: const Icon(Icons.call),
          // ),
          // IconButton(
          //   onPressed: () {},
          //   icon: const Icon(Icons.more_vert),
          // ),
        ],
      ),
      body: Column(
        children: [
          ListView(),
          Card(
            child: Text(
              'aaa',
              style: TextStyle(fontSize: 40),
            ),
          ),
        ],
      ),
    );
  }
}
