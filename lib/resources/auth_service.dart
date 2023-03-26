import 'dart:typed_data';

import 'package:chattry_app/resources/storage_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:chattry_app/models/user_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserModel> getUserDetails() async {
    User currentUser = _auth.currentUser!;
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser.uid)
        .get();
    print(documentSnapshot);
    return UserModel.fromSnap(documentSnapshot);
  }

  /// signing up users...
  Future<String> signUpUser({
    required String email,
    required String password,
    required String userName,
    required String bio,
    required Uint8List file,
  }) async {
    String res = 'Some error occurred';
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          userName.isNotEmpty ||
          bio.isNotEmpty) {
        /// create user...
        UserCredential userCredential = await _auth
            .createUserWithEmailAndPassword(email: email, password: password);
        print(userCredential.user!.uid);
        String photoUrl = await StorageService()
            .uploadingImageToStorage('profilePic', file, false);

        /// add user data to database...
        UserModel user = UserModel(
          email: email,
          uid: userCredential.user!.uid,
          userName: userName,
          photoUrl: photoUrl,
          bio: bio,
          followers: [],
          following: [],
        );

        _firestore.collection('users').doc(userCredential.user!.uid).set(
              user.toJson(),
            );
        res = 'Successful';
      }
    } on FirebaseAuthException catch (error) {
      res = error.toString();
    }
    return res;
  }

  /// logging in users .....
  Future<String> logInUsers(
      {required String email, required String password}) async {
    String res = 'Some error';
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = 'successful';
      } else {
        res = 'Please enter all the fields';
      }
    } catch (error) {
      res = error.toString();
    }
    return res;
  }
}
