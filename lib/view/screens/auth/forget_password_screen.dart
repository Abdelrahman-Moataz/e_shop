import 'package:e_shop/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordScreen extends StatelessWidget {
   ForgetPasswordScreen({Key? key}) : super(key: key);

   final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Get.isDarkMode ? Colors.white : darkGreyCle,
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Forget Password',
          style: TextStyle(color: Get.isDarkMode ? mainColor : pinkClr),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon( Icons.arrow_back,
          color: Get.isDarkMode ?  Colors.black : Colors.white,
          ),
        ),
      ),
          backgroundColor: Get.isDarkMode ? Colors.white :  darkGreyCle,




    )
    );
  }
}
