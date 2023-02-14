import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_ui/common/providers/firebase.dart';
import 'package:whatsapp_ui/common/widgets/error_screen.dart';
import 'package:whatsapp_ui/common/widgets/loader.dart';
import 'package:whatsapp_ui/features/lane/controller/lane_controller.dart';

class LaneList extends ConsumerStatefulWidget {
  const LaneList({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LaneListState();
}

class _LaneListState extends ConsumerState<LaneList> {
  final laneNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // laneNameController.text = 'ddd';
  }

  @override
  void dispose() {
    super.dispose();
    laneNameController.dispose();
    print('dispose lane list screen');
  }

  // TODO: Search!!
  void searchLane() {}

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(authProvider).currentUser!.uid;
    print('user **** ${user}');
    return SafeArea(
      // child: ref.watch(searchLaneProvider(laneNameController.text)).when(
      child: ref.watch(getLaneListProvider).when(
          data: (lanes) {
            return Center(
              child: ListView.builder(
                  itemCount: lanes.length,
                  itemBuilder: (context, index) {
                    final lane = lanes[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(lane.avatar),
                      ),
                      title: Text('${lane.name} 레인'),
                      subtitle: Text('1번 - ${lane.id}'),
                      trailing: Text('${lane.members.length}'),
                      isThreeLine: true,
                      onTap: () {},
                    );
                  }),
            );
          },
          error: (error, stackTrace) {
            return ErrorScreen(
              error: error.toString(),
            );
          },
          loading: () => Loader()),
      // body: Center(
      //   child: Text('as'),
      // ),
    );
  }
}

// class LaneListScreen extends ConsumerWidget {
//   final String name;
//   const LaneListScreen({
//     Key? key,
//     required this.name,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
    // final user = ref.watch(authProvider).currentUser!.uid;
//     print('user **** ${user}');
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: TextField(controller: user,),
//       // ),
//       body: ref.watch(getLaneByNameProvider(name)).when(
//           data: (lane) {
//             return ListView.builder(
//                 itemCount: 3,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Text('${lane.name}'),
//                   );
//                 });
//           },
//           error: (error, stackTrace) {
//             return ErrorScreen(
//               error: error.toString(),
//             );
//           },
//           loading: () => Loader()),
//       // body: Center(
//       //   child: Text('as'),
//       // ),
//     );
//   }
// }
