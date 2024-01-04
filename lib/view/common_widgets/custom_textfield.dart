import 'package:flutter/material.dart';
import 'package:stacklab_e/const/string_const.dart';
import 'package:velocity_x/velocity_x.dart';

Widget customTextField ({
  String? title,
  String? hint,
  controller
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title!.text.color(Colors.blueAccent.shade200).size(16).make(),
      const SizedBox(height: 5,),
      TextFormField(
        controller: controller,
        decoration:  InputDecoration(
          hintStyle: const TextStyle(
            color: Colors.black26
          ),
          hintText: hint,
          isDense: true,
          fillColor: Colors.white60,
          filled: true,
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blueAccent.shade200)
          )
        ),
      )
    ],
  );
}