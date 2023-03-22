import 'dart:typed_data';

import 'package:chattry_app/models/post_model.dart';
import 'package:chattry_app/resources/storage_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:uuid/uuid.dart';

class FireStoreService {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  /// upload a post to database....
  Future<String> uploadPost(
    String description,
    String uid,
    String username,
    String profileImage,
    Uint8List file,
  ) async {
    String res = 'Something error occurred';
    try {
      String photoUrl =
          await StorageService().uploadingImageToStorage('posts', file, true);
      String postId = const Uuid().v1();
      PostModel postModel = PostModel(
        postId: postId,
        like: [],
        description: description,
        uid: uid,
        userName: username,
        datePublished: DateTime.now(),
        profileImage: profileImage,
        postUrl: photoUrl,
      );
      firebaseFirestore.collection('posts').doc(postId).set(postModel.toJson());
      res = 'success';
    } catch (error) {
      res = error.toString();
    }
    return res;
  }
}
