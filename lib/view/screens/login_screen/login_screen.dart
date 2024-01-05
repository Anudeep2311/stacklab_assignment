import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacklab_e/view/common_widgets/custom_button.dart';
import 'package:stacklab_e/view/common_widgets/custom_textfield.dart';
import 'package:stacklab_e/const/string_const.dart';
import 'package:stacklab_e/view/screens/home_screen/home_screen.dart';
import 'package:stacklab_e/view/screens/otp_screen/otp_screen.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static String verify = "";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var phone = "";
  String countryCode = '';
  // String password = 'test@1234';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Center(
                    child: Column(
            children: [
              (context.screenHeight * 0.25).heightBox,
              demo.text.color(Colors.blueAccent.shade200).size(32).make(),
              const SizedBox(height: 15,),
              Column(
                children: [
                  customTextField(
                    keyboardType:  TextInputType.phone,
                    hint: phoneHint, 
                    title: phone,
                    onChanged: (value){
                      phone = value;
                    }
                    ),
                  const SizedBox(
                    height: 15,
                  ),
                  customTextField(hint: passwordHint, title: password),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: forgetPassword.text.make(),
                    ),
                  ),
                  customButton(
                    title: 'Log In',
                    onPressed: () async{
                      await FirebaseAuth.instance.verifyPhoneNumber(
                        phoneNumber: "${countryCode + phone}",
                        verificationCompleted: 
                          (PhoneAuthCredential credential){
                          }, 
                        verificationFailed: 
                          (FirebaseException e) {}, 
                        codeSent: 
                          (String verificationId, int? resendToken) {
                            LoginScreen.verify = verificationId;
                            Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const MyOTP(),
                        ));
                          }, 
                        codeAutoRetrievalTimeout: (String verificationId) {}
                        );
                    },
                    )
                ],
              )
                  .box
                  .blue100
                  .rounded
                  .padding(const EdgeInsets.all(16))
                  .width(context.screenWidth - 80)
                  .make()
            ],
                    ),
                  ),
          )),
    );
  }
}
