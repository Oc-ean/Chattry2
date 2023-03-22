import 'dart:typed_data';

import 'package:chattry_app/mobile/screens/profile_screen.dart';
import 'package:chattry_app/providers/user_provider.dart';
import 'package:chattry_app/resources/auth_service.dart';
import 'package:chattry_app/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  bool _obscureText = false;
  bool _isLoading = false;

  // @override
  // void dispose() {
  //   emailController.dispose();
  //   passwordController.dispose();
  //   bioController.dispose();
  //   usernameController.dispose();
  //   super.dispose();
  // }

  // void selectImage() async {
  //   Uint8List img = await pickImage(ImageSource.gallery);
  //   setState(() {
  //     _image = img;
  //   });
  // }
  //
  // void signUpUser() async {
  //   setState(() {
  //     _isLoading = true;
  //   });
  //   String res = await AuthService().signUpUser(
  //     email: emailController.text,
  //     password: passwordController.text,
  //     username: usernameController.text,
  //     bio: bioController.text,
  //     file: _image!,
  //   );
  //   setState(() {
  //     _isLoading = false;
  //   });
  //   if (res != 'success') {
  //     showSnackBar(context, res);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child:
              Consumer<UserProvider>(builder: (context, userProvider, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 14.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.clear,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 44.0),
                  child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 89),
                        height: 64,
                        width: 230,
                        // color: Colors.red,
                        child: Image.asset(
                          'assets/bird.png',
                          filterQuality: FilterQuality.high,
                        ),
                      ),
                      const Positioned(
                        top: 22,
                        child: Padding(
                          padding: EdgeInsets.only(left: 83.0),
                          child: Text(
                            'Chattry',
                            style:
                                TextStyle(fontSize: 34, fontFamily: 'Baloo2'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                // InkWell(
                //   onTap: selectImage,
                //   child: Stack(
                //     children: [
                //       _image != null
                //           ? Center(
                //               child: CircleAvatar(
                //                 radius: 48,
                //                 backgroundColor: Colors.transparent,
                //                 backgroundImage: MemoryImage(_image!),
                //               ),
                //             )
                //           : const Center(
                //               child: kIsWeb
                //                   ? CircleAvatar(
                //                       radius: 48,
                //                       backgroundColor: Colors.grey,
                //                       child: Icon(
                //                         Icons.person,
                //                         size: 70,
                //                         color: Colors.white,
                //                       ),
                //                     )
                //                   : CircleAvatar(
                //                       radius: 48,
                //                       backgroundColor: Colors.grey,
                //                       backgroundImage: NetworkImage(
                //                         'https://i.pinimg.com/originals/f1/0f/f7/f10ff70a7155e5ab666bcdd1b45b726d.jpg',
                //                       ),
                //                     ),
                //             ),
                //       kIsWeb
                //           ? const Positioned(
                //               bottom: 1,
                //               left: 270,
                //               child: Icon(
                //                 Icons.add_a_photo,
                //                 // color: Colors.white12,
                //               ),
                //             )
                //           : const Positioned(
                //               bottom: -1,
                //               left: 210,
                //               child: Icon(
                //                 Icons.add_a_photo,
                //                 // color: Colors.white12,
                //               ))
                //     ],
                //   ),
                // ),
                const Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Username:',
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'NotoSans',
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 20),
                  child: TextFormField(
                    controller: userProvider.usernameController,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      hintText: 'nickname',
                      hintStyle: TextStyle(color: Colors.grey.shade300),
                      border: InputBorder.none,
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Email:',
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'NotoSans',
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 20),
                  child: TextFormField(
                    controller: userProvider.emailController,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      hintText: '@example',
                      hintStyle: TextStyle(color: Colors.grey.shade300),
                      border: InputBorder.none,
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Password:',
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'NotoSans',
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 20),
                  child: TextFormField(
                    controller: userProvider.passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      hintText: '***********',
                      hintStyle: TextStyle(color: Colors.grey.shade300),
                      border: InputBorder.none,
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                      suffixIcon: _obscureText == true
                          ? IconButton(
                              onPressed: () {
                                setState(() {
                                  _obscureText = false;
                                });
                              },
                              icon: const Icon(
                                Icons.remove_red_eye,
                                size: 20,
                              ))
                          : IconButton(
                              onPressed: () {
                                setState(() {
                                  _obscureText = true;
                                });
                              },
                              icon: const Icon(
                                Icons.visibility_off,
                                size: 20,
                              ),
                            ),
                    ),
                    obscureText: _obscureText,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Bio:',
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'NotoSans',
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 20),
                  child: TextFormField(
                    controller: userProvider.bioController,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      hintText: 'bio',
                      hintStyle: TextStyle(color: Colors.grey.shade300),
                      border: InputBorder.none,
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ),
                kIsWeb
                    ? Padding(
                        padding: const EdgeInsets.only(left: 380.0),
                        child: CupertinoButton(
                          onPressed: () async {
                            // Navigator.push(
                            //   context,
                            //   CupertinoPageRoute(
                            //     builder: (context) => const LogInScreen(),
                            //   ),
                            // );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.black),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 8),
                              child: _isLoading
                                  ? const Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.black,
                                      ),
                                    )
                                  : const Text(
                                      'Sign up',
                                      style: TextStyle(color: Colors.black),
                                    ),
                            ),
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(left: 250.0),
                        child: CupertinoButton(
                          onPressed: () async {
                            // signUpUser();
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => ProfilePicScreen(),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.black),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 8),
                              child: _isLoading
                                  ? const Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.black,
                                      ),
                                    )
                                  : const Text(
                                      'Sign up',
                                      style: TextStyle(color: Colors.black),
                                    ),
                            ),
                          ),
                        ),
                      ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
