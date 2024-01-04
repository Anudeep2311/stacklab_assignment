import 'package:flutter/material.dart';

Widget customButton ({
void Function()? onPressed,
required String title,
}) {
  return ElevatedButton(
    onPressed: onPressed, 
    child: Center(
      child: Text(
        title
        ),
    )
    );
}