import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app/firebase_options.dart';
import 'package:fruits_app/views/Home/UI/pages/Home.dart';
import 'package:fruits_app/views/navi/NavBar.dart';
import 'package:fruits_app/views/onBoarding/UI/pages/SplashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(DevicePreview(
    builder: (context) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home:
            // SplashScreen(),
            //HomeScreen()
            // NaviBarSection(),
            NavBarSection());
  }
}
