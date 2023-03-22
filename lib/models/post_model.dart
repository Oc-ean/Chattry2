import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  final String description;
  final String uid;
  final String userName;
  final DateTime datePublished;
  final String profileImage;
  final String postUrl;
  final String postId;
  final like;
  PostModel({
    required this.postId,
    required this.like,
    required this.description,
    required this.uid,
    required this.userName,
    required this.datePublished,
    required this.profileImage,
    required this.postUrl,
  });
  Map<String, dynamic> toJson() => {
        'description': description,
        'uid': uid,
        'postUrl': postUrl,
        'userName': userName,
        'profileImage': profileImage,
        'datePublished': datePublished,
        'postId': postId,
        'like': like,
      };
  static PostModel fromSnap(DocumentSnapshot snapshot) {
    var documentSnapShot = snapshot.data() as Map<String, dynamic>;
    return PostModel(
      postId: documentSnapShot['postId'],
      description: documentSnapShot['description'],
      uid: documentSnapShot['uid'],
      postUrl: documentSnapShot['postUrl'],
      userName: documentSnapShot['username'],
      like: documentSnapShot['like'],
      datePublished: documentSnapShot['datePublished'],
      profileImage: documentSnapShot['profileImage'],
    );
  }
}
