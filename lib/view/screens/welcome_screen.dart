
import 'package:asrooshop/routes/routes.dart';
import 'package:asrooshop/utils/theme.dart';
import 'package:asrooshop/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

  class WelcomeScreen extends StatelessWidget{
    const WelcomeScreen({ Key? key }) : super(key: key);

    @override
    Widget build(BuildContext context){
      return SafeArea(//to be just all the width and hieght of the screen but not touch the wifi and battry icons
        child: Scaffold(
          body: Stack(
            children: [

                 SizedBox(
                   width: double.infinity,
                   height: double.infinity,
                   child: Image.asset(
                       'assets/images/bg1.jpg',
                        fit: BoxFit.cover
                   ),
                 ),
                Container(
                  color: Colors.black.withOpacity(.2),
                  width: double.infinity,
                  height: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      Container(
                        height: 60,
                        width: 190,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child:
                            TextUtils(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                text: "Welcome",
                                color: Colors.white,
                              underLine: TextDecoration.none,

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
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                              TextUtils(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                text: "Asroo",
                                color: mainColor,
                                underLine: TextDecoration.none,

                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              TextUtils(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                text: "Shop",
                                color: Colors.white,
                                underLine: TextDecoration.none,

                              ),
                         ],
                        ),
                      ),
                      const SizedBox(
                        height: 250,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: mainColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 40,
                              vertical: 12,
                            ),
                        ),
                        onPressed: (){
                          Get.offNamed(Routes.loginScreen);
                        },
                        child: TextUtils(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            text: "Get Start",
                          underLine: TextDecoration.none,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextUtils(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          text: 'Don\'t have an account',
                          underLine: TextDecoration.none,
                          ),
                          TextButton(
                            onPressed: () {
                              Get.offNamed(Routes.signUpScreen);
                            },
                            child: const Text(
                              'Sign up',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.white, // <-- Add this line to change the underline color
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      );
    }
  }

