import 'package:chattry_app/mobile/screens/chattry_screen.dart';
import 'package:chattry_app/mobile/screens/home_screen.dart';
import 'package:chattry_app/mobile/screens/sign_in_screen.dart';
import 'package:chattry_app/mobile/screens/splash_screen.dart';
import 'package:chattry_app/mobile_layout_screen.dart';
import 'package:chattry_app/providers/user_provider.dart';
import 'package:chattry_app/responsive/respnsive_layout.dart';
import 'package:chattry_app/utils/bottom_nav.dart';
import 'package:chattry_app/web_layout_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyAR_lYrbgPXZ5IOCktyI3E9fVx7qhJVghc",
        appId: "1:688459024743:web:cf54777c6dc79be26387c2",
        messagingSenderId: '688459024743',
        projectId: "chattry-app",
        storageBucket: "chattry-app.appspot.com",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final authChange = FirebaseAuth.instance.authStateChanges();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(
          create: (context) => UserProvider(),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          home: StreamBuilder(
              stream: authChange,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  if (snapshot.hasData) {
                    return const ResponsiveLayout(
                      mobileLayoutScreen: BottomNav(),
                      webLayoutScreen: WebLayoutScreen(),
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  );
                }
                return const ChattryScreen();
              })),
    );
  }
}
