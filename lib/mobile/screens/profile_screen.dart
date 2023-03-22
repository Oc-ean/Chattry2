import 'dart:typed_data';

import 'package:chattry_app/providers/user_provider.dart';
import 'package:chattry_app/utils/bottom_nav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePicScreen extends StatefulWidget {
  const ProfilePicScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfilePicScreen> createState() => _ProfilePicScreenState();
}

class _ProfilePicScreenState extends State<ProfilePicScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Add a profile picture',
          style: TextStyle(color: Colors.black, fontFamily: 'NotoSans'),
        ),
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Consumer<UserProvider>(
          builder: (context, userProvider, child) {
            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              shrinkWrap: true,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width - 30,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: const BorderRadius.all(
                      Radius.circular(3.0),
                    ),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      userProvider.image == null
                          ? InkWell(
                              onTap: () {
                                userProvider.selectProfilePic();
                              },
                              child: Text(
                                'Tap to add your profile picture',
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                            )
                          : Container(
                              width: 320,
                              height: MediaQuery.of(context).size.width - 40,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: MemoryImage(userProvider.image!),
                                  fit: BoxFit.cover,
                                  filterQuality: FilterQuality.high,
                                ),
                                color: Colors.black,
                              ),
                            ),
                    ],
                  ),
                ),
                CupertinoButton(
                  onPressed: () {
                    userProvider.signUpUser(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 60, vertical: 10),
                      child: userProvider.isLoading
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: Colors.black,
                              ),
                            )
                          : const Text(
                              'Done',
                              style: TextStyle(
                                  color: Colors.black,
                                  // fontSize: 16,
                                  fontFamily: 'NotoSans'),
                            ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
