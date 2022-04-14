import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../logic/Controller/auth_controller.dart';
import '../../../routes/routes.dart';
import '../../../utils/my_string.dart';
import '../../../utils/theme.dart';
import '../../widgets/auth/auth_button.dart';
import '../../widgets/auth/auth_text_form_field.dart';
import '../../widgets/auth/container_under.dart';
import '../../widgets/text_utils.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final Controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                                    text: "LOG",
                                    fontSize: 28,
                                    fontWeight: FontWeight.w500,
                                    color: Get.isDarkMode ? mainColor : pinkClr,
                                    underLine: TextDecoration.none),
                                const SizedBox(
                                  width: 3,
                                ),
                                TextUtils(
                                    text: "IN",
                                    fontSize: 28,
                                    fontWeight: FontWeight.w500,
                                    color: Get.isDarkMode ? Colors.black : Colors.white,
                                    underLine: TextDecoration.none),
                              ],
                            ),
                            const SizedBox(
                              height: 50,
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

                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(onPressed: () {
                                Get.offNamed(Routes.forgetPassword);
                              },
                                child: TextUtils(
                                  text: 'Forget Password?',
                                  fontSize: 14,
                                  color: Get.isDarkMode ? Colors.black :Colors.white,
                                  underLine: TextDecoration.none,
                                  fontWeight: FontWeight.normal,
                                ),)
                            ),


                            const SizedBox(height: 50,),

                            AuthButton(text: 'LOG IN', onPressed: (){

                            }),

                            const SizedBox(height: 20),

                            TextUtils(
                                text: "OR",
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Get.isDarkMode ? Colors.black : Colors.white,
                                underLine: TextDecoration.none),

                            const SizedBox(height: 20),

                            Row( mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell( onTap: (){} ,child: Image.asset("assets/facebook.png")),
                                const SizedBox(width: 10,),
                                InkWell( onTap: (){},   child : Image.asset("assets/google.png")),
                              ],
                            )


                          ],
                        ),
                      ),
                    )),

                ContainerUnder(text: 'Don\'t have an account',
                  onPressed: () {
                    Get.offNamed(Routes.signUpScreen);
                  },
                  textType: 'Sign Up',),

              ],
            ),
          )),
    );
  }
}
