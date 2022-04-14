import 'package:e_shop/utils/theme.dart';
import 'package:e_shop/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContainerUnder extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final String textType;

  const ContainerUnder({Key? key, required this.text, required this.onPressed, required this.textType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration:  BoxDecoration(
          color: Get.isDarkMode ? mainColor : pinkClr,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Row( mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextUtils(
              text: text,
              fontSize: 20,
              fontWeight: FontWeight.normal,
              color: Colors.white,
              underLine: TextDecoration.none),

          TextButton(onPressed: onPressed,
              child: TextUtils(
                  text: textType,
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                  underLine: TextDecoration.underline),

          )
        ],
      ),
    );
  }
}
