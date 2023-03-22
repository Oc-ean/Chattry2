import 'dart:async';

import 'package:chattry_app/mobile/screens/chattry_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        const Duration(seconds: 3),
        () => Navigator.push(context,
            CupertinoPageRoute(builder: (context) => const ChattryScreen())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 40.0),
              child: Text(
                'Welcome to',
                style: TextStyle(fontSize: 36, fontFamily: 'Baloo2'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 89.0),
              child: Stack(
                children: [
                  Container(
                    height: 64,
                    width: 230,
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
              height: 60,
            ),
            Container(
              margin: EdgeInsets.only(left: 70),
              height: 190,
              width: 220,
              decoration: BoxDecoration(
                  // color: Colors.blue,
                  image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/bird3.png'),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
