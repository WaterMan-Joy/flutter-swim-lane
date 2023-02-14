import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:whatsapp_ui/features/lane/screens/create_lane_screen.dart';
import 'package:whatsapp_ui/theme/pallete.dart';

import '../colors.dart';

import '../features/timer/screens/timer_screen.dart';
import '../features/lane/screens/lane_list_screen.dart';
import '../widgets/contacts_list.dart';

class MobileHomeScreen extends StatelessWidget {
  static const routeName = '/mobile-home-screen';
  const MobileHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void navigateToTimerScreen() {
      Navigator.pushNamed(context, TimerScreen.routeName);
    }

    void navigagteToCreateLaneScreen(BuildContext context) {
      Navigator.pushNamed(context, CreateLaneScreen.routeName);
    }

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Pallete.appbarColor,
          centerTitle: true,
          title: const Text(
            '홈',
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
            onPressed: () => navigagteToCreateLaneScreen(context),
            icon: Icon(Icons.add),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search, color: Colors.grey),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.more_vert, color: Colors.grey),
              onPressed: () {},
            ),
          ],
          bottom: const TabBar(
            indicatorColor: tabColor,
            indicatorWeight: 4,
            labelColor: tabColor,
            unselectedLabelColor: Colors.grey,
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
            ),
            tabs: [
              Tab(
                text: '레인',
              ),
              Tab(
                text: '둘러보기',
              ),
              Tab(
                text: 'CALLS',
              ),
            ],
          ),
        ),
        // body: const ContactsList(),
        body: LaneList(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Pallete.buttonColor2,
          onPressed: () => navigateToTimerScreen(),
          child: Icon(Icons.av_timer),
        ),
      ),
    );

    // return Scaffold(
    //   appBar: AppBar(
    //     automaticallyImplyLeading: false,
    //     centerTitle: true,
    //     title: Text('홈'),
    //   ),
    //   body: Center(),
    //   floatingActionButton: FloatingActionButton(
    //     onPressed: () => navigateToTimerScreen(context),
    //     child: Icon(Icons.av_timer),
    //   ),
    // );
  }
}
