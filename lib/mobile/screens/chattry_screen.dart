import 'package:chattry_app/mobile/screens/sign_in_screen.dart';
import 'package:chattry_app/mobile/screens/sign_up_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ChattryScreen extends StatelessWidget {
  const ChattryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: kIsWeb
            ? Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 125.0),
                    child: Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 89),
                          height: 150,
                          width: 310,
                          // color: Colors.red,
                          child: Image.asset(
                            'assets/bird.png',
                            filterQuality: FilterQuality.high,
                          ),
                        ),
                        const Positioned(
                          top: 59,
                          child: Padding(
                            padding: EdgeInsets.only(left: 116.0),
                            child: Text(
                              'Chattry',
                              style:
                                  TextStyle(fontSize: 46, fontFamily: 'Baloo2'),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: CupertinoButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => const SignUpScreen(),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.black, width: 3),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                    color: Colors.black,
                                    // fontSize: 16,
                                    fontFamily: 'NotoSans'),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: CupertinoButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => const LogInScreen(),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              // border: Border.all(color: Colors.black, width: 3),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              child: Text(
                                'Log In',
                                style: TextStyle(
                                    color: Colors.black,
                                    // fontSize: 16,
                                    fontFamily: 'NotoSans',
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              )
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 235.0),
                    child: Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 89),
                          height: 150,
                          width: 310,
                          // color: Colors.red,
                          child: Image.asset(
                            'assets/bird.png',
                            filterQuality: FilterQuality.high,
                          ),
                        ),
                        const Positioned(
                          top: 59,
                          child: Padding(
                            padding: EdgeInsets.only(left: 116.0),
                            child: Text(
                              'Chattry',
                              style:
                                  TextStyle(fontSize: 46, fontFamily: 'Baloo2'),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: CupertinoButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => const SignUpScreen(),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.black, width: 3),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                    color: Colors.black,
                                    // fontSize: 16,
                                    fontFamily: 'NotoSans'),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: CupertinoButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => const LogInScreen(),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              // border: Border.all(color: Colors.black, width: 3),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              child: Text(
                                'Log In',
                                style: TextStyle(
                                    color: Colors.black,
                                    // fontSize: 16,
                                    fontFamily: 'NotoSans',
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
      ),
    );
  }
}
