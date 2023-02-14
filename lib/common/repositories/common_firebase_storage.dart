// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_ui/common/providers/firebase.dart';

final commonFirebaseStorageRepositoryProvier = Provider((ref) {
  return CommonFirebaseStorageRepository(
      // TODO: 변경
      firebaseStorage: ref.watch(storageProvider));
});

class CommonFirebaseStorageRepository {
  final FirebaseStorage firebaseStorage;
  CommonFirebaseStorageRepository({
    required this.firebaseStorage,
  });

  Future<String> storeFileToFirebase(String ref, File file) async {
    UploadTask uploadTask = firebaseStorage.ref().child(ref).putFile(file);
    final snap = await uploadTask;
    final downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  // Future<String> storeFile({}) {

  // }

  // FutureEither<String> storeFile2({
  //   required String path,
  //   required String id,
  //   required File? file,
  //   required Uint8List? webFile,
  // }) async {
  //   try {
  //     final ref = _firebaseStorage.ref().child(path).child(id);
  //     UploadTask uploadTask;

  //     if (kIsWeb) {
  //       uploadTask = ref.putData(webFile!);
  //     } else {
  //       uploadTask = ref.putFile(file!);
  //     }

  //     final snapshot = await uploadTask;

  //     return right(await snapshot.ref.getDownloadURL());
  //   } catch (e) {
  //     return left(Failure(e.toString()));
  //   }
  // }
}
