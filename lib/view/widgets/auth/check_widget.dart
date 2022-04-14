import 'package:e_shop/logic/Controller/auth_controller.dart';
import 'package:e_shop/utils/theme.dart';
import 'package:e_shop/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckWidget extends StatelessWidget {
   CheckWidget({Key? key}) : super(key: key);

  final Controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (_){
      return  Row(
        children: [
          InkWell(
            onTap: () {
              Controller.checkBox();
            },
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Controller.isCheckBox ?
               Get.isDarkMode ? Image.asset('assets/check.png') : const Icon(Icons.done,color: pinkClr,)
                  : Container(),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Row(
            children:  [
              TextUtils(
                  text: 'I accept ',
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Get.isDarkMode ?  Colors.black : Colors.white,
                  underLine: TextDecoration.none),

              TextUtils(
                  text: 'terms & Conditions',
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Get.isDarkMode ?  Colors.black : Colors.white,
                  underLine: TextDecoration.underline),
            ],
          )
        ],
      );

    });
  }
}
