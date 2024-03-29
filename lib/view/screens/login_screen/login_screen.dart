import 'package:flutter/material.dart';
import 'package:stacklab_e/view/common_widgets/custom_button.dart';
import 'package:stacklab_e/view/common_widgets/custom_textfield.dart';
import 'package:stacklab_e/const/string_const.dart';
import 'package:stacklab_e/view/screens/home_screen/home_screen.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                  customTextField(hint: phoneHint, title: phone),
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
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                        ));
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
