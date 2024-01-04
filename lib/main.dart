import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacklab_e/view/screens/home_screen/home_screen.dart';
import 'package:stacklab_e/view/screens/login_screen/login_screen.dart';
import 'package:stacklab_e/view/screens/spalsh_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.transparent,
          appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent)),
      home: const SplashScreen(),
    );
  }
}
