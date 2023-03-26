import 'package:chattry_app/models/user_model.dart';
import 'package:chattry_app/providers/user_provider.dart';
import 'package:chattry_app/utils/reusable_post_layout.dart';
import 'package:chattry_app/utils/reusable_story.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // String username = '';
  //
  // @override
  // void initState() {
  //   super.initState();
  //   getUsername();
  // }
  // UserModel userModel = Provider.of<UserProvider>(context).getUser();
  // void getUsername() async {
  //   DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(FirebaseAuth.instance.currentUser!.uid)
  //       .get();
  //   print('======> ${documentSnapshot.data()} <=========');
  //   setState(() {
  //     username = (documentSnapshot.data() as Map<String, dynamic>)['username'];
  //   });
  // }
  int _page = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    UserModel? userModel = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65.0),
        child: Container(
          height: 130,
          child: Row(
            children: [
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 40),
                    height: 90,
                    width: 100,
                    // color: Colors.red,
                    child: Image.asset(
                      'assets/bird.png',
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                  const Positioned(
                    top: 35,
                    child: Padding(
                      padding: EdgeInsets.only(left: 22.0, top: 5),
                      child: Text(
                        'Chattry',
                        style: TextStyle(fontSize: 30, fontFamily: 'Baloo2'),
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 40.0, left: 190),
                child: Icon(
                  CupertinoIcons.ellipsis,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Row(
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.only(left: 10.0),
            //       child: Stack(
            //         children: [
            //           Container(
            //             margin: const EdgeInsets.only(right: 40),
            //             height: 64,
            //             width: 96,
            //             // color: Colors.red,
            //             child: Image.asset(
            //               'assets/bird.png',
            //               filterQuality: FilterQuality.high,
            //             ),
            //           ),
            //           const Positioned(
            //             top: 22,
            //             child: Padding(
            //               padding: EdgeInsets.only(left: 15.0, top: 5),
            //               child: Text(
            //                 'Chattry',
            //                 style: TextStyle(fontSize: 30, fontFamily: 'Baloo2'),
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //     kIsWeb
            //         ? const Padding(
            //             padding: EdgeInsets.only(top: 40, left: 310),
            //             child: Icon(
            //               CupertinoIcons.ellipsis,
            //               size: 25,
            //             ),
            //           )
            //         : const Padding(
            //             padding: EdgeInsets.only(top: 40, left: 195),
            //             child: Icon(
            //               CupertinoIcons.ellipsis,
            //               size: 25,
            //             ),
            //           ),
            //   ],
            // ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              width: MediaQuery.of(context).size.width,
              height: 100,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 7,
                  scrollDirection: Axis.horizontal,
                  // physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Column(
                        children: [
                          CircleAvatar(
                            radius: 38,
                            backgroundColor: Colors.black,
                            child: CircleAvatar(
                              radius: 33,
                              backgroundColor: Colors.white,
                              child: Stack(
                                children: [
                                  Container(
                                    height: 63,
                                    width: 63,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.black26,
                                    ),
                                  ),
                                  const Positioned(
                                      top: 20,
                                      left: 20,
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.black,
                                      )),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 70,
                            child: const Text(
                              'nin3oo3iiiijjjjj',
                              style: TextStyle(
                                  fontFamily: 'NotoSans',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      );
                    }
                    return const StoryWidget();
                  }),
            ),
            const Divider(
              thickness: 1,
              color: Colors.black26,
            ),
            const SizedBox(
              height: 15,
            ),
            userModel == null
                ? const CircularProgressIndicator()
                : ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 7,
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.only(bottom: 25.0),
                    child: PostWidget(),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
