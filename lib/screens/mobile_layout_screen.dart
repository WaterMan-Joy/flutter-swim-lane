import 'package:flutter/material.dart';
import 'package:whatsapp_ui/colors.dart';
import 'package:whatsapp_ui/features/timer/screens/timer_screen.dart';
import 'package:whatsapp_ui/theme/pallete.dart';
import 'package:whatsapp_ui/widgets/contacts_list.dart';

class MobileLayoutScreen extends StatelessWidget {
  static const routeName = '/mobile-layout-screen';
  const MobileLayoutScreen({Key? key}) : super(key: key);

  void navigateToTimerScreen(BuildContext context) {
    Navigator.pushNamed(context, TimerScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Pallete.appbarColor,
          centerTitle: true,
          title: const Text(
            'SWIM SNS',
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
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
                text: '모임',
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
        body: const ContactsList(),
        floatingActionButton: FloatingActionButton(
          onPressed: () => navigateToTimerScreen(context),
          backgroundColor: tabColor,
          child: const Icon(
            Icons.timelapse_sharp,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
