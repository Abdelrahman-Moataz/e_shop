import 'package:e_shop/logic/Controller/auth_controller.dart';
import 'package:e_shop/routes/routes.dart';
import 'package:e_shop/utils/my_string.dart';
import 'package:e_shop/view/widgets/auth/auth_button.dart';
import 'package:e_shop/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import '../../../utils/theme.dart';
import '../../widgets/auth/auth_text_form_field.dart';
import '../../widgets/auth/check_widget.dart';
import '../../widgets/auth/container_under.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final Controller = Get.find<AuthController>();

  //final Controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return
      SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Get.isDarkMode? Colors.white : darkGreyCle,
            elevation: 0,
          ),
          backgroundColor: Get.isDarkMode? Colors.white : darkGreyCle,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 1.3,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 25, right: 25, top: 40),
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            Row(
                              children:  [
                                TextUtils(
                                    text: "SIGN",
                                    fontSize: 28,
                                    fontWeight: FontWeight.w500,
                                    color: Get.isDarkMode ? mainColor : pinkClr,
                                    underLine: TextDecoration.none),
                                const SizedBox(
                                  width: 3,
                                ),
                                TextUtils(
                                    text: "UP",
                                    fontSize: 28,
                                    fontWeight: FontWeight.w500,
                                    color: Get.isDarkMode ? Colors.black : Colors.white,
                                    underLine: TextDecoration.none),
                              ],
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            AuthTextFormField(
                              controller: nameController,
                              obscureText: false,
                              validator: (value) {
                                if (value.toString().length <=2 || !RegExp(validationName).hasMatch(value)){
                                  return 'Enter valid name';
                                }else{
                                  return null;
                                }

                              },
                              prefixIcon: Get.isDarkMode ? Image.asset('assets/user.png')
                                  : const Icon(Icons.person,color: pinkClr,size: 30,),
                              suffixIcon: const Text(''),
                              hintText: "user name",
                            ),
                            const SizedBox(height: 20,),

                            AuthTextFormField(
                              controller: emailController,
                              obscureText: false,
                              validator: (value) {
                                if(!RegExp(validationEmail).hasMatch(value)){
                                  return 'Enter valid Email';
                                }else {
                                  return null;
                                }
                              },
                              prefixIcon:Get.isDarkMode ? Image.asset('assets/email.png')
                              : const Icon(Icons.email,color: pinkClr,size: 30,),
                              suffixIcon: const Text(''),
                              hintText: "Email",
                            ),
                            const SizedBox(height: 20,),


                            GetBuilder<AuthController>(builder: (_){
                              return AuthTextFormField(
                                controller: passwordController,
                                obscureText: Controller.isVisibility ? false : true,
                                validator: (value) {
                                  if(value.toString().length < 6){
                                    return 'Password must be more than 6';
                                  }else{
                                    return null;
                                  }
                                },
                                prefixIcon: Get.isDarkMode ? Image.asset('assets/lock.png')
                                    : const Icon(Icons.lock,color: pinkClr,size: 30,),
                                suffixIcon: IconButton(onPressed: (){
                                  Controller.visibilty();
                                },
                                    icon: Controller.isVisibility ?
                                    const Icon(Icons.visibility_off, color: Colors.black,) :
                                   const Icon(Icons.visibility,color: Colors.black,)
                                ),
                                hintText: "Password",
                              );
                            }),


                            const SizedBox(height: 50,),

                             CheckWidget(

                             ),

                            AuthButton(text: 'SIGN UP', onPressed: (){

                            })
                          ],
                        ),
                      ),
                    )),

                    ContainerUnder(text: 'Already have an Account',
                      onPressed: () {
                        Get.offNamed(Routes.loginScreen);
                      },
                      textType: 'Log in',),

              ],
            ),
          )),
    );
  }
}
