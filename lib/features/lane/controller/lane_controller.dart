// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_ui/common/providers/firebase.dart';
import 'package:whatsapp_ui/features/lane/repository/lane_repository.dart';
import 'package:whatsapp_ui/models/lane_model.dart';
import '../../../common/repositories/common_firebase_storage.dart';
import '../../auth/controller/auth_controller.dart';

final laneControllerProvider =
    StateNotifierProvider<LaneController, bool>((ref) {
  final laneRepository = ref.watch(laneRepositotyProvider);
  return LaneController(laneRepository: laneRepository, ref: ref);
});

final searchLaneProvider = StreamProvider.family((ref, String query) {
  return ref.watch(laneControllerProvider.notifier).searchLane(query);
});

final getLaneByNameProvider = StreamProvider.family((ref, String name) {
  return ref.watch(laneControllerProvider.notifier).getLaneByName(name);
});

final getLaneListProvider = StreamProvider((ref) {
  return ref.watch(laneControllerProvider.notifier).getLaneList();
});

class LaneController extends StateNotifier<bool> {
  final LaneRepository laneRepository;

  final Ref ref;
  LaneController({
    required this.laneRepository,
    required this.ref,
  }) : super(false);

  Stream<LaneModel> getLaneByName(String name) {
    return laneRepository.getLaneByName(name);
  }

  Stream<List<LaneModel>> searchLane(String query) {
    return laneRepository.searchLane(query);
  }

  Stream<List<LaneModel>> getLaneList() {
    return laneRepository.getLaneList();
  }

  Future<void> createLane(BuildContext context, String name) async {
    state = true;
    final uid = ref.read(authProvider).currentUser!.uid;
    print('uid **** $uid');

    LaneModel laneModel = LaneModel(
      id: uid,
      // id: name,
      name: name,
      avatar:
          'https://www.socialketchup.in/wp-content/uploads/2020/05/fi-vill-JOHN-DOE.jpg',
      banner:
          'https://www.socialketchup.in/wp-content/uploads/2020/05/fi-vill-JOHN-DOE.jpg',
      members: [uid],
    );

    final res = await laneRepository.createLane(context, laneModel);
    state = false;
    Navigator.pop(context);
    return res;
  }
}
