import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pinput/pinput.dart';
import 'package:stacklab_e/view/common_widgets/custom_button.dart';
import 'package:stacklab_e/view/screens/home_screen/home_screen.dart';
import 'package:stacklab_e/view/screens/login_screen/login_screen.dart';
import 'package:velocity_x/velocity_x.dart';

class MyOTP extends StatefulWidget {
  const MyOTP({super.key});

  @override
  State<MyOTP> createState() => _MyOTPState();
}

class _MyOTPState extends State<MyOTP> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 42,
      height: 42,
      textStyle: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.bold,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue.shade100),
        borderRadius: BorderRadius.circular(8)
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

    var code = "";
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Please enter your six digit OTP',
                style: TextStyle(
                  fontSize: 16
                ),
                ),
              const SizedBox(height: 10,),
              Pinput(
                onChanged: (value) {
                  code= value;
                },
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusPinTheme,
                submittedPinTheme: submittedPinTheme,
                length: 6,
                validator: (s){
                  return s == code ? null : 'OTP is Incorrect';
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
                  onPressed: () async {
                    try {
                      PhoneAuthCredential credential = PhoneAuthProvider.credential(
                      verificationId: LoginScreen.verify, 
                      smsCode: code,
                      );
                      await auth.signInWithCredential(credential);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
                    }
                    catch(e) {
                      var snackBar = SnackBar(content: Text('Wrong OTP Entered'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      // print("Wrong OTP");
                    }
                  },
                  ),
              )
            ],
          ),
        ),),
    );
  }
}