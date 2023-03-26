import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String email;
  final String uid;
  final String photoUrl;
  final String userName;
  final String bio;
  final List followers;
  final List following;
  UserModel(
      {required this.email,
      required this.uid,
      required this.photoUrl,
      required this.userName,
      required this.bio,
      required this.followers,
      required this.following});
  Map<String, dynamic> toJson() => {
        'email': email,
        'uid': uid,
        'photoUrl': photoUrl,
        'username': userName,
        'bio': bio,
        'followers': followers,
        'following': following,
      };
  static UserModel fromSnap(DocumentSnapshot snapshot) {
    var documentSnapShot = snapshot.data() as Map<String, dynamic>;
    print('==========>$documentSnapShot<========');
    return UserModel(
      email: documentSnapShot['email'],
      uid: documentSnapShot['uid'],
      photoUrl: documentSnapShot['photoUrl'],
      userName: documentSnapShot['username'],
      bio: documentSnapShot['bio'],
      followers: documentSnapShot['followers'],
      following: documentSnapShot['following'],
    );
  }
}
