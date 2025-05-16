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
      height: MediaQuery.sizeOf(context).height > 1000 ? 1133.ht(context) : 844.hm(context),
      width: MediaQuery.sizeOf(context).width > 500 ? 744.wt(context) : 390.wm(context),
      decoration: BoxDecoration(
        color: ColorUtils.white255,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [


          Container(
            height: MediaQuery.sizeOf(context).height > 1000 ? 319.ht(context) :229.hm(context),
            width: MediaQuery.sizeOf(context).width > 500 ? 439.wt(context) : 229.wm(context),
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