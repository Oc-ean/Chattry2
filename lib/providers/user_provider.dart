import 'dart:typed_data';

import 'package:chattry_app/models/user_model.dart';
import 'package:chattry_app/resources/auth_service.dart';
import 'package:chattry_app/resources/fire_store_service.dart';
import 'package:chattry_app/utils/bottom_nav.dart';
import 'package:chattry_app/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserProvider with ChangeNotifier {
  UserModel? _user;
  final AuthService _authService = AuthService();
  TextEditingController postController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  Uint8List? image;
  bool isLoading = false;
  bool isLinearLoading = false;
  UserModel? get getUser => _user;

  Future<void> updatingUserValue() async {
    print('updating');
    try {
      UserModel userModel = await _authService.getUserDetails();
      _user = userModel;
      notifyListeners();
    } catch (e) {
      print('User authentication error<==========>${e}<=========>');
    }
  }

  Uint8List? file;

  /// selecting image to post.....
  selectImage(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: const Text('Creat a post'),
            children: [
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Take a photo'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List uintFile = await pickImage(ImageSource.camera);
                  file = uintFile;
                  notifyListeners();
                },
              ),
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Choose from gallery'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List uintFile = await pickImage(ImageSource.gallery);
                  file = uintFile;
                  notifyListeners();
                },
              ),
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Cancel'),
                onPressed: () async {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  /// uploading post to firebase...
  postImage(String uid, String username, String profileImage,
      BuildContext context) async {
    isLinearLoading = true;
    notifyListeners();
    try {
      String res = await FireStoreService().uploadPost(
        postController.text,
        uid,
        username,
        profileImage,
        file!,
      );
      if (res == 'success') {
        isLinearLoading = false;
        notifyListeners();
        showSnackBar(context, 'Posted!');
      } else {
        isLinearLoading = false;
        notifyListeners();
        showSnackBar(context, res);
      }
    } catch (error) {
      showSnackBar(context, error.toString());
    }

    postController.clear();
  }

  void selectProfilePic() async {
    Uint8List? img = await pickImage(ImageSource.gallery);
    image = img;
    notifyListeners();
  }

  void signUpUser(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    String res = await AuthService().signUpUser(
      email: emailController.text,
      password: passwordController.text,
      userName: usernameController.text,
      bio: bioController.text,
      file: image!,
    );

    isLoading = false;
    notifyListeners();
    if (res != 'success') {
      showSnackBar(context, res);

      Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => const BottomNav(),
        ),
      );
    }
    notifyListeners();
  }
}
