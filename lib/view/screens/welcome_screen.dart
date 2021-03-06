import 'package:e_shop/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_shop/routes/routes.dart';

import '../widgets/text_utils.dart';



class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'assets/Mask.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.2),
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 60,
                  width: 190,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(5)),
                  child: const Center(
                    child: TextUtils(
                      underLine: TextDecoration.none,
                      text: 'Welcome',
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    height: 60,
                    width: 230,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        TextUtils(
                            underLine: TextDecoration.none,
                            text: 'Asroo',
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: mainColor),
                        SizedBox(
                          width: 7,
                        ),
                        TextUtils(
                            underLine: TextDecoration.none,
                            text: 'Shop',
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ],
                    )),
                const SizedBox(
                  height: 250,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: mainColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 12)),
                    onPressed: () {
                      Get.offNamed(Routes.loginScreen);
                    },
                    child: const TextUtils(
                        underLine: TextDecoration.none,
                        text: 'Get Start',
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    const TextUtils(
                        underLine: TextDecoration.none,
                        text: 'Don\'t have an Account? ',
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.white),

                    TextButton(onPressed: (){
                      Get.offNamed(Routes.signUpScreen);
                    }, child:
                    const TextUtils(
                        underLine: TextDecoration.underline,
                        text: 'SignUp',
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.white)
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
