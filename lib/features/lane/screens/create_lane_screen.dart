import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_ui/common/widgets/loader.dart';
import 'package:whatsapp_ui/features/lane/controller/lane_controller.dart';

class CreateLaneScreen extends ConsumerStatefulWidget {
  static const routeName = '/create-lane-screen';
  const CreateLaneScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<CreateLaneScreen> createState() => _CreateLaneScreenState();
}

class _CreateLaneScreenState extends ConsumerState<CreateLaneScreen> {
  final laneNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    print('initState create lane screen');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    laneNameController.dispose();
    print('dispose create lane screen');
  }

  void createLane() {
    ref
        .read(laneControllerProvider.notifier)
        .createLane(context, laneNameController.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(laneControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('새로운 레인 만들기'),
        actions: [
          TextButton(
            onPressed: () => createLane(),
            child: Text('완료'),
          ),
        ],
      ),
      body: isLoading
          ? Loader()
          : Center(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextField(
                      controller: laneNameController,
                      decoration: InputDecoration(hintText: 'name'),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
