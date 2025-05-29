import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rahatak_food_delivery_app/screen/screen.dart';
import 'package:rahatak_food_delivery_app/utils/utils.dart';

class AuthenticationSplashScreenWidget extends GetxController {


  Widget authenticationSplashScreenWidget({required BuildContext context}) {
    return SafeArea(
      child: Container(
        height: 844.hm(context),
        width: 390.wm(context),
        decoration: BoxDecoration(
          color: ColorUtils.white255,
        ),
        child: CustomScrollView(
          slivers: [

            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.hpmm(context),
                ),
                child: Column(
                  children: [


                    SpacerWidget.spacerWidget(
                      spaceHeight: 11.hm(context),
                    ),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        Container(
                          height: 24.hm(context),
                          width: 24.wm(context),
                          decoration: BoxDecoration(
                            color: Colors.transparent
                          ),
                          child: TextButton(
                            style: TextButton.styleFrom(padding: EdgeInsets.zero),
                            onPressed: () {
                              showAdaptiveDialog(
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                        top: 45.tpmm(context),
                                        bottom: 667.tpmm(context),
                                        left: Get.locale.toString() == "en" ? 16.lpmm(context) : 232.rpmm(context),
                                        right: Get.locale.toString() == "en" ? 232.rpmm(context) : 16.lpmm(context),
                                    ),
                                    child: Container(
                                      height: 88.hm(context),
                                      width: 150.wm(context),
                                      decoration: BoxDecoration(
                                        color: ColorUtils.white255,
                                        borderRadius: BorderRadius.circular(10.rm(context)),
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 4,
                                            spreadRadius: 0,
                                            color: ColorUtils.black05,
                                            offset: Offset(0, 0),
                                          )
                                        ],
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [

                                          Container(
                                            height: 42.hm(context),
                                            width: 150.wm(context),
                                            decoration: BoxDecoration(
                                              color: Colors.transparent,
                                            ),
                                            child: TextButton(
                                              style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                              onPressed: () async {
                                                Get.updateLocale(Locale("ar"));
                                                Get.back();
                                              },
                                              child: Center(
                                                child: Text(
                                                  "Arabic".tr,
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.tajawal(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 16.spm(context),
                                                    color: ColorUtils.black33,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),

                                          Container(
                                            height: 42.hm(context),
                                            width: 150.wm(context),
                                            decoration: BoxDecoration(
                                              color: Colors.transparent,
                                            ),
                                            child: TextButton(
                                              style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                              onPressed: () async {
                                                Get.updateLocale(Locale("en"));
                                                Get.back();
                                              },
                                              child: Center(
                                                child: Text(
                                                  "English".tr,
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.tajawal(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 16.spm(context),
                                                    color: ColorUtils.black33,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),



                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: Image.asset(
                                ImagePathUtils.languageButtonImagePath,
                                fit: BoxFit.cover,
                                alignment: Alignment.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SpacerWidget.spacerWidget(
                      spaceHeight: 108.hm(context),
                    ),

                    Container(
                      height: 186.hm(context),
                      width: 187.wm(context),
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


                    SpacerWidget.spacerWidget(
                      spaceHeight: 78.hm(context),
                    ),


                    Container(
                      height: 48.hm(context),
                      width: 300.wm(context),
                      decoration: BoxDecoration(
                        color: ColorUtils.blue192,
                        borderRadius: BorderRadius.circular(8.rm(context),)
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
                              color: ColorUtils.white255
                            ),
                          ),
                        ),
                      ),
                    ),

                    SpacerWidget.spacerWidget(
                      spaceHeight: 16.hm(context),
                    ),


                    Container(
                      height: 48.hm(context),
                      width: 300.wm(context),
                      decoration: BoxDecoration(
                        border: Border.all(color: ColorUtils.gray136,width: 1),
                        color: ColorUtils.white255,
                        borderRadius: BorderRadius.circular(8.rm(context),),
                      ),
                      child: TextButton(
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        onPressed: () async {
                          Get.off(()=>RegistrationScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                        },
                        child: Center(
                          child: Text(
                            "Create Account".tr,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.tajawal(
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              fontSize: 18.spm(context),
                              color: ColorUtils.black51,
                            ),
                          ),
                        ),
                      ),
                    ),


                    SpacerWidget.spacerWidget(spaceHeight: 201.hm(context)),


                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        "© 2025 All rights reserved.\nDesigned & Developed by Script | Daleel Technology".tr,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: 14.spm(context),
                          color: ColorUtils.gray163,
                        ),
                      ),
                    ),

                    SpacerWidget.spacerWidget(spaceHeight: 8.hm(context)),

                  ],
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }


}