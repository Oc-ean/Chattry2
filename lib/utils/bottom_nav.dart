import 'dart:typed_data';

import 'package:chattry_app/mobile/screens/add_post_screen.dart';
import 'package:chattry_app/mobile/screens/home_screen.dart';
import 'package:chattry_app/models/user_model.dart';
import 'package:chattry_app/providers/user_provider.dart';
import 'package:chattry_app/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/brandico_icons.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/fontelico_icons.dart';
import 'package:fluttericon/meteocons_icons.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:fluttericon/rpg_awesome_icons.dart';
import 'package:fluttericon/web_symbols_icons.dart';
import 'package:fluttericon/zocial_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;
  List pages = [
    const HomeScreen(),
    Container(
      child: Center(
        child: Text('Chats'),
      ),
    ),
    const AddPostScreen(),
    Container(
      child: Center(
        child: Text('Notice'),
      ),
    ),
    Container(
      child: Center(
        child: Text('Profile'),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: WillPopScope(
        onWillPop: () async {
          if (_currentIndex > 0) {
            return false;
          } else {
            return true;
          }
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          bottomNavigationBar: CupertinoTabBar(
            onTap: (index) {
              print('Index is : $index');
              if (mounted) {
                setState(() {
                  // _currentIndex = index;
                  if (index == 2) {
                    _showModalBottomSheet(context);
                  } else {
                    _currentIndex = index;
                  }
                });
              }
            },
            backgroundColor: Colors.white,
            activeColor: Colors.grey,
            height: 55,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.home,
                  color: _currentIndex == 0 ? Colors.black : Colors.grey,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    CupertinoIcons.chat_bubble_2_fill,
                    color: _currentIndex == 1 ? Colors.black : Colors.grey,
                  ),
                  label: 'chats'),
              BottomNavigationBarItem(
                  icon: Icon(
                    CupertinoIcons.plus_square_fill_on_square_fill,
                    color: _currentIndex == 2 ? Colors.black : Colors.grey,
                  ),
                  label: 'Post'),
              BottomNavigationBarItem(
                  icon: Icon(
                    CupertinoIcons.bell_fill,
                    color: _currentIndex == 3 ? Colors.black : Colors.grey,
                  ),
                  label: 'Notice'),
              BottomNavigationBarItem(
                  icon: Icon(
                    CupertinoIcons.profile_circled,
                    color: _currentIndex == 4 ? Colors.black : Colors.grey,
                  ),
                  label: 'Profile'),
            ],
          ),
          body: Column(
            children: [Expanded(child: pages[_currentIndex])],
          ),
        ),
      ),
    );
  }

  _showModalBottomSheet(BuildContext context) {
    // Uint8List? _file;
    // _selectImage(BuildContext context) async {
    //   return showDialog(
    //       context: context,
    //       builder: (context) {
    //         return SimpleDialog(
    //           title: const Text('Create a post'),
    //           children: [
    //             SimpleDialogOption(
    //               padding: const EdgeInsets.all(20),
    //               child: const Text('Take a photo'),
    //               onPressed: () async {
    //                 Navigator.of(context).pop();
    //                 Uint8List file = await pickImage(ImageSource.camera);
    //                 setState(() {
    //                   _file = file;
    //                 });
    //               },
    //             ),
    //             SimpleDialogOption(
    //               padding: const EdgeInsets.all(20),
    //               child: const Text('Choose from gallery'),
    //               onPressed: () async {
    //                 Navigator.of(context).pop();
    //                 Uint8List file = await pickImage(ImageSource.gallery);
    //                 setState(() {
    //                   _file = file;
    //                 });
    //               },
    //             ),
    //             SimpleDialogOption(
    //               padding: const EdgeInsets.all(20),
    //               child: const Text('Cancel'),
    //               onPressed: () async {
    //                 Navigator.of(context).pop();
    //               },
    //             ),
    //           ],
    //         );
    //       });
    // }

    showModalBottomSheet(
      enableDrag: false,
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      builder: (context) => AddPostScreen(),
      // builder: (context) => Container(
      //   height: MediaQuery.of(context).size.height,
      //   child: SingleChildScrollView(
      //     child: Consumer<UserProvider>(
      //       builder: (context, userProvider, index) {
      //         return Column(
      //           children: [
      //             const SizedBox(
      //               height: 30,
      //             ),
      //             Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: [
      //                 CupertinoButton(
      //                   onPressed: () {
      //                     Navigator.pop(context);
      //                   },
      //                   child: const Icon(
      //                     Icons.clear,
      //                     size: 33,
      //                     color: Colors.black,
      //                   ),
      //                 ),
      //                 CupertinoButton(
      //                   onPressed: () {
      //                     userProvider.postImage(
      //                         _userModel.uid,
      //                         _userModel.userName,
      //                         _userModel.photoUrl,
      //                         context);
      //                   },
      //                   child: Container(
      //                     decoration: BoxDecoration(
      //                       borderRadius: BorderRadius.circular(12),
      //                       border: Border.all(color: Colors.black),
      //                     ),
      //                     child: Padding(
      //                       padding: const EdgeInsets.symmetric(
      //                           horizontal: 25, vertical: 10),
      //                       child: Text(
      //                         'Post',
      //                         style: TextStyle(
      //                             color: Colors.black.withOpacity(0.8)),
      //                       ),
      //                     ),
      //                   ),
      //                 ),
      //               ],
      //             ),
      //             userProvider.isLinearLoading
      //                 ? const LinearProgressIndicator()
      //                 : Container(),
      //             CircleAvatar(
      //               radius: 40,
      //               backgroundImage:
      //                   NetworkImage(userProvider.getUser.photoUrl),
      //             ),
      //             Text(
      //               _userModel.userName,
      //               style: const TextStyle(
      //                   fontSize: 20,
      //                   fontFamily: 'NotoSans',
      //                   fontWeight: FontWeight.w500),
      //             ),
      //             const SizedBox(
      //               height: 10,
      //             ),
      //             Container(
      //               height: 180,
      //               width: 375,
      //               decoration: BoxDecoration(
      //                 borderRadius: BorderRadius.circular(12),
      //                 border: Border.all(color: Colors.black, width: 2),
      //               ),
      //               child: Center(
      //                 child: Column(
      //                   mainAxisAlignment: MainAxisAlignment.center,
      //                   children: [
      //                     userProvider.file == null
      //                         ? InkWell(
      //                             onTap: () async {
      //                               userProvider.selectImage(context);
      //
      //                               print('Clicked');
      //                             },
      //                             child: const Icon(
      //                               Icons.upload,
      //                               size: 32,
      //                             ),
      //                           )
      //                         : Container(
      //                             height: 172,
      //                             width: 368,
      //                             // color: Colors.red,
      //                             decoration: BoxDecoration(
      //                               borderRadius: BorderRadius.circular(12),
      //                               image: DecorationImage(
      //                                 image: MemoryImage(userProvider.file!),
      //                                 fit: BoxFit.cover,
      //                               ),
      //                               color: Colors.black,
      //                             ),
      //                           ),
      //                   ],
      //                 ),
      //               ),
      //             ),
      //             const SizedBox(
      //               height: 10,
      //             ),
      //             Padding(
      //               padding: const EdgeInsets.only(left: 8.0),
      //               child: Align(
      //                 alignment: Alignment.topLeft,
      //                 child: SizedBox(
      //                   width: MediaQuery.of(context).size.width,
      //                   child: TextField(
      //                     controller: userProvider.postController,
      //                     decoration: const InputDecoration(
      //                       hintText: 'Write a caption...',
      //                       border: InputBorder.none,
      //                     ),
      //                     maxLines: 6,
      //                   ),
      //                 ),
      //               ),
      //             ),
      //           ],
      //         );
      //       },
      //     ),
      //   ),
      // ),
    );
  }
}
