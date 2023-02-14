// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:whatsapp_ui/common/constants/firebase_constants.dart';
import 'package:whatsapp_ui/models/lane_model.dart';

import '../../../common/providers/firebase.dart';
import '../../../utils/utils.dart';

final laneRepositotyProvider = Provider((ref) {
  return LaneRepository(firebaseFirestore: ref.watch(firestoreProvider));
});

class LaneRepository {
  final FirebaseFirestore firebaseFirestore;
  LaneRepository({
    required this.firebaseFirestore,
  });

  Stream<List<LaneModel>> getLaneList() {
    return _lane.snapshots().map((event) {
      List<LaneModel> lanes = [];
      for (var lane in event.docs) {
        lanes.add(LaneModel.fromMap(lane.data() as Map<String, dynamic>));
      }
      return lanes;
    });
  }

  Stream<List<LaneModel>> searchLane(String query) {
    return _lane
        .where(
          'name',
          isGreaterThanOrEqualTo: query.isEmpty ? 0 : query,
          isLessThan: query.isEmpty
              ? null
              : query.substring(0, query.length - 1) +
                  String.fromCharCode(
                    query.codeUnitAt(query.length - 1) + 1,
                  ),
        )
        .snapshots()
        .map((event) {
      List<LaneModel> lanes = [];
      for (var lane in event.docs) {
        lanes.add(LaneModel.fromMap(lane.data() as Map<String, dynamic>));
      }
      return lanes;
    });
  }

  Stream<LaneModel> getLaneByName(String name) {
    return _lane.doc(name).snapshots().map(
        (event) => LaneModel.fromMap(event.data() as Map<String, dynamic>));
  }

  Future<void> createLane(BuildContext context, LaneModel lane) async {
    try {
      var laneDoc = await _lane.doc(lane.name).get();
      if (laneDoc.exists) {
        throw '레인 이름이 이미 존재합니다';
      }

      return await _lane.doc(lane.name).set(lane.toMap());
    } catch (e) {
      showSnackBar(context: context, content: e.toString());
    }
  }

  Stream<List<LaneModel>> getUserLanes(String uid) {
    return _lane.where('members', arrayContains: uid).snapshots().map((event) {
      List<LaneModel> lanes = [];
      for (var doc in event.docs) {
        lanes.add(LaneModel.fromMap(doc.data() as Map<String, dynamic>));
      }
      return lanes;
    });
  }

  CollectionReference get _lane =>
      firebaseFirestore.collection(FirebaseConstants.lanesCollection);
}
