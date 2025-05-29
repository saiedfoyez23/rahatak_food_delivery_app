import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahatak_food_delivery_app/screen/screen.dart';
import 'package:rahatak_food_delivery_app/utils/utils.dart';

import '../controller/controller.dart';

class SplashScreenWidget extends GetxController {


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(Duration(seconds: 1),() async {
      await LoginController.checkLocalLoginResponse().then((value) {
        print(value?.data?.accessToken);
        if(value?.data?.accessToken == null) {
          Get.off(()=>AuthenticationSplashScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
        } else {
          Get.off(()=>HomeScreen(),preventDuplicates: false,transition: Transition.fadeIn,duration: Duration(milliseconds: 300));
        }
      });
    });
  }


  Widget splashScreenWidget({required BuildContext context}) {
    return Container(
      height: 844.hm(context),
      width: 390.wm(context),
      decoration: BoxDecoration(
        color: ColorUtils.white255,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [


          Container(
            height: 229.hm(context),
            width: 229.wm(context),
            decoration: BoxDecoration(
              color: Colors.transparent
            ),
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.asset(
                ImagePathUtils.logoImagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),


        ],
      ),
    );
  }


}