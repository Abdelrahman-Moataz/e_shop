import 'package:e_shop/utils/theme.dart';
import 'package:e_shop/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final Function() onPressed;

   const AuthButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Get.isDarkMode ? mainColor : pinkClr,
        maximumSize: const Size(360,50),
      ),
        onPressed: onPressed,
        child:  TextUtils(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          text: text,
          underLine: TextDecoration.none,
          fontSize: 18,

        )
    );
  }
}
