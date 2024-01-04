import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pinput/pinput.dart';
import 'package:stacklab_e/view/common_widgets/custom_button.dart';
import 'package:stacklab_e/view/screens/home_screen/home_screen.dart';
import 'package:velocity_x/velocity_x.dart';

class MyOTP extends StatefulWidget {
  const MyOTP({super.key});

  @override
  State<MyOTP> createState() => _MyOTPState();
}

class _MyOTPState extends State<MyOTP> {
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.bold,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue.shade100),
        borderRadius: BorderRadius.circular(20)
      )
    );
    final focusPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Colors.blueAccent.shade200),
      borderRadius: BorderRadius.circular(8)
    );
    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Colors.blue.shade100
      )
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Please enter your four digit OTP',
                style: TextStyle(
                  fontSize: 16
                ),
                ),
              const SizedBox(height: 10,),
              Pinput(
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusPinTheme,
                submittedPinTheme: submittedPinTheme,
                validator: (s){
                  return s == '2222'? null : 'OTP is Incorrect';
                },
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                showCursor: true,
                onCompleted: (pin)=>print(pin),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 45, right: 45),
                child: customButton(
                  title: 'START',
                  onPressed: () {
                    Get.to(()=>const HomeScreen());
                  },
                  ),
              )
            ],
          ),
        ),),
    );
  }
}