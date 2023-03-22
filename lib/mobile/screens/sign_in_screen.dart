import 'package:chattry_app/mobile/screens/home_screen.dart';
import 'package:chattry_app/mobile_layout_screen.dart';
import 'package:chattry_app/resources/auth_service.dart';
import 'package:chattry_app/responsive/respnsive_layout.dart';
import 'package:chattry_app/utils/bottom_nav.dart';

import 'package:chattry_app/utils/utils.dart';
import 'package:chattry_app/web_layout_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isLoading = false;
  bool _obscureText = false;
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthService().logInUsers(
        email: emailController.text, password: passwordController.text);
    if (res == 'successful') {
      showSnackBar(context, 'Log in successful');
      Navigator.pushAndRemoveUntil(
          context,
          CupertinoPageRoute(
              builder: (context) => const ResponsiveLayout(
                  mobileLayoutScreen: BottomNav(),
                  webLayoutScreen: WebLayoutScreen())),
          (route) => false);

      emailController.clear();
      passwordController.clear();
    } else {
      showSnackBar(context, res);
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
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
                          style: TextStyle(fontSize: 34, fontFamily: 'Baloo2'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  'Log In',
                  style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'NotoSans'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  'Welcome back , you\'ve been missed, your friends are',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  'waiting for you, notifications are crazy, let\'s keep',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  'exploring.',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              const SizedBox(
                height: 20,
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
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 20),
                child: TextFormField(
                  controller: emailController,
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
                height: 30,
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
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 20),
                child: TextFormField(
                  controller: passwordController,
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
              kIsWeb
                  ? Padding(
                      padding: const EdgeInsets.only(left: 380.0),
                      child: CupertinoButton(
                        onPressed: () {
                          loginUser();
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
                                horizontal: 5, vertical: 10),
                            child: _isLoading
                                ? const Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.black,
                                    ),
                                  )
                                : const Text(
                                    'Log In',
                                    style: TextStyle(color: Colors.black),
                                  ),
                          ),
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(left: 250.0),
                      child: CupertinoButton(
                        onPressed: () {
                          loginUser();
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
                                horizontal: 5, vertical: 10),
                            child: _isLoading
                                ? const Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.black,
                                    ),
                                  )
                                : const Text(
                                    'Log In',
                                    style: TextStyle(color: Colors.black),
                                  ),
                          ),
                        ),
                      ),
                    ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Row(
                  children: const [
                    Expanded(
                        child: Divider(
                      thickness: 1,
                      color: Colors.black,
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Or',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'NotoSans',
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: Divider(
                      thickness: 1,
                      color: Colors.black,
                    )),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              CupertinoButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   CupertinoPageRoute(
                  //     builder: (context) => const SignUpScreen(),
                  //   ),
                  // );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.email,
                          size: 38,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Sign in with Google',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'NotoSans',
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
