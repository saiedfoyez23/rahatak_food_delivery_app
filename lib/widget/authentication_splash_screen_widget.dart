import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rahatak_food_delivery_app/screen/screen.dart';
import 'package:rahatak_food_delivery_app/utils/utils.dart';

class AuthenticationSplashScreenWidget extends GetxController {


  Widget authenticationSplashScreenWidget({required BuildContext context}) {
    return SafeArea(
      child: Container(
        height: MediaQuery.sizeOf(context).height > 1000 ? 1133.ht(context) : 844.hm(context),
        width: MediaQuery.sizeOf(context).width > 500 ? 744.wt(context) : 390.wm(context),
        decoration: BoxDecoration(
          color: ColorUtils.white255,
        ),
        child: CustomScrollView(
          slivers: [

            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.sizeOf(context).height > 1000 ?
                  37.hpmt(context) :
                  16.hpmm(context),
                ),
                child: Column(
                  children: [


                    SpacerWidget.spacerWidget(
                      spaceHeight: MediaQuery.sizeOf(context).height > 1000 ?
                      11.ht(context) :
                      11.hm(context),
                    ),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        Container(
                          height: MediaQuery.sizeOf(context).height > 1000 ? 28.ht(context) : 24.hm(context),
                          width: MediaQuery.sizeOf(context).width > 500 ? 28.wt(context) : 24.wm(context),
                          decoration: BoxDecoration(
                            color: Colors.transparent
                          ),
                          child: TextButton(
                            style: TextButton.styleFrom(padding: EdgeInsets.zero),
                            onPressed: () {},
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
                      spaceHeight: MediaQuery.sizeOf(context).height > 1000 ? 277.ht(context) : 108.hm(context),
                    ),

                    Container(
                      height: MediaQuery.sizeOf(context).height > 1000 ? 231.ht(context) : 186.hm(context),
                      width: MediaQuery.sizeOf(context).width > 500 ? 345.wt(context) : 187.wm(context),
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
                      spaceHeight: MediaQuery.sizeOf(context).height > 1000 ? 71.ht(context) : 78.hm(context),
                    ),


                    Container(
                      height: MediaQuery.sizeOf(context).height > 1000 ? 52.ht(context) : 48.hm(context),
                      width: MediaQuery.sizeOf(context).width > 500 ? 391.wt(context) : 300.wm(context),
                      decoration: BoxDecoration(
                        color: ColorUtils.blue192,
                        borderRadius: BorderRadius.circular(
                          MediaQuery.sizeOf(context).height > 1000 ? 8.rt(context) : 8.rm(context),
                        )
                      ),
                      child: TextButton(
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        onPressed: () async {
                          Get.off(()=>LoginScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                        },
                        child: Center(
                          child: Text(
                            "Login",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.tajawal(
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              fontSize: MediaQuery.sizeOf(context).height > 1000 ? 18.spt(context) : 18.spm(context),
                              color: ColorUtils.white255
                            ),
                          ),
                        ),
                      ),
                    ),

                    SpacerWidget.spacerWidget(
                      spaceHeight: MediaQuery.sizeOf(context).height > 1000 ? 16.ht(context) : 16.hm(context),
                    ),


                    Container(
                      height: MediaQuery.sizeOf(context).height > 1000 ? 52.ht(context) : 48.hm(context),
                      width: MediaQuery.sizeOf(context).width > 500 ? 391.wt(context) : 300.wm(context),
                      decoration: BoxDecoration(
                        border: Border.all(color: ColorUtils.gray136,width: 1),
                        color: ColorUtils.white255,
                        borderRadius: BorderRadius.circular(
                          MediaQuery.sizeOf(context).height > 1000 ? 8.rt(context) : 8.rm(context),
                        ),
                      ),
                      child: TextButton(
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        onPressed: () async {
                          Get.off(()=>RegistrationScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                        },
                        child: Center(
                          child: Text(
                            "Create Account",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.tajawal(
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              fontSize: MediaQuery.sizeOf(context).height > 1000 ? 18.spt(context) : 18.spm(context),
                              color: ColorUtils.black51,
                            ),
                          ),
                        ),
                      ),
                    ),


                    SpacerWidget.spacerWidget(spaceHeight:  MediaQuery.sizeOf(context).height > 1000 ? 260.ht(context) : 201.hm(context)),


                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        "© 2025 All rights reserved.\nDesigned & Developed by Script | Daleel Technology",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: MediaQuery.sizeOf(context).height > 1000 ? 14.spt(context) : 14.spm(context),
                          color: ColorUtils.gray163,
                        ),
                      ),
                    ),

                    SpacerWidget.spacerWidget(spaceHeight: MediaQuery.sizeOf(context).height > 1000 ? 8.ht(context) : 8.hm(context)),

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