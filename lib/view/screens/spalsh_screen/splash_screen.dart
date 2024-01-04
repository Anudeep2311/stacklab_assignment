import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacklab_e/view/screens/login_screen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  changePage() {
    Future.delayed(const Duration(seconds: 1), () {
      Get.to(() =>const  LoginScreen());
      // Get.to(() => const HomeScreen());
    });
  }

  @override
  void initState() {
    // GetMobileProductListVM().getPhonesList();
    changePage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: const TextSpan(
                    text: 'This is a stacklab demo',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 26,
                    ),
                    children: [
                      TextSpan(
                          text: '\n by Anudeep Lohogaonkar',
                          style:
                              TextStyle(color: Colors.blueAccent, fontSize: 18))
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
