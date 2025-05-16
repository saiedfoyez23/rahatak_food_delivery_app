import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rahatak_food_delivery_app/screen/screen.dart';
import 'package:rahatak_food_delivery_app/utils/utils.dart';

import '../controller/controller.dart';

class LogoutScreenWidget extends GetxController {


  Widget logoutScreenWidget({required BuildContext context}) {
    if(MediaQuery.sizeOf(context).height > 1000) {
      return Container(
        height: 1133.ht(context),
        width: 744.wt(context),
        decoration: BoxDecoration(
          color: ColorUtils.white248,
        ),
        padding: EdgeInsets.symmetric(horizontal: 203.hpmt(context)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Container(
              height: 48.ht(context),
              width: 320.wt(context),
              decoration: BoxDecoration(
                color: ColorUtils.blue192,
                borderRadius: BorderRadius.circular(8.rt(context)),
              ),
              child: TextButton(
                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                onPressed: () async {
                  AppLocalStorageController.getSharedPreferencesRemove(key: "Login");
                  Get.off(()=>LoginScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                },
                child: Center(
                  child: Text(
                    "Login".tr,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.tajawal(
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      fontSize: 18.spt(context),
                      color: ColorUtils.white255,
                    ),
                  ),
                ),
              ),
            ),

            SpacerWidget.spacerWidget(spaceHeight: 12.ht(context)),


            Container(
              alignment: Alignment.center,
              child: Text(
                "You have successfully logged out!".tr,
                textAlign: TextAlign.center,
                style: GoogleFonts.tajawal(
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  fontSize: 18.spt(context),
                  color: ColorUtils.blue181,
                  height: (35.ht(context) / 18.spt(context)),
                ),
              ),
            ),


            Container(
              alignment: Alignment.center,
              child: Text(
                "Log back in to access your account and continue with your orders.".tr,
                textAlign: TextAlign.center,
                style: GoogleFonts.tajawal(
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  fontSize: 18.spt(context),
                  color: ColorUtils.blue181,
                  height: (35.ht(context) / 18.spt(context)),
                ),
              ),
            ),



          ],
        ),
      );
    } else {
      return Container(
        height: 844.hm(context),
        width: 390.wm(context),
        decoration: BoxDecoration(
          color: ColorUtils.white248,
        ),
        padding: EdgeInsets.symmetric(horizontal: 36.hpmm(context)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Container(
              height: 48.hm(context),
              width: 320.wm(context),
              decoration: BoxDecoration(
                color: ColorUtils.blue192,
                borderRadius: BorderRadius.circular(8.rm(context)),
              ),
              child: TextButton(
                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                onPressed: () async {
                  Get.off(()=>LoginScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                },
                child: Center(
                  child: Text(
                    "Login".tr,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.tajawal(
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      fontSize: 18.spm(context),
                      color: ColorUtils.white255,
                    ),
                  ),
                ),
              ),
            ),

            SpacerWidget.spacerWidget(spaceHeight: 12.hm(context)),


            Container(
              alignment: Alignment.center,
              child: Text(
                "You have successfully logged out!".tr,
                textAlign: TextAlign.center,
                style: GoogleFonts.tajawal(
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  fontSize: 18.spm(context),
                  color: ColorUtils.blue181,
                  height: (35.hm(context) / 18.spm(context)),
                ),
              ),
            ),


            Container(
              alignment: Alignment.center,
              child: Text(
                "Log back in to access your account and continue with your orders.".tr,
                textAlign: TextAlign.center,
                style: GoogleFonts.tajawal(
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  fontSize: 18.spm(context),
                  color: ColorUtils.blue181,
                  height: (35.hm(context) / 18.spm(context)),
                ),
              ),
            ),



          ],
        ),
      );
    }
  }



}