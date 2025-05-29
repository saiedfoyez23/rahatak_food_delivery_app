import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rahatak_food_delivery_app/utils/assets_utils/screen_utils.dart';
import 'package:rahatak_food_delivery_app/utils/utils.dart';

import '../screen/screen.dart';

class LanguageChangeScreenWidget extends GetxController {

  RxBool isEnglish = false.obs;

  RxBool isArabic = false.obs;


   @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(Duration(microseconds: 100),() async {
      if(Get.locale.toString() == "en") {
        isEnglish.value = true;
      } else {
        isArabic.value = true;
      }
    });
  }

  Widget languageChangeScreenWidget({required BuildContext context}) {
    // if(MediaQuery.sizeOf(context).height > 1000) {
    //   return Obx(()=>SafeArea(
    //     child: Container(
    //       height: 1133.ht(context),
    //       width: 744.wt(context),
    //       decoration: BoxDecoration(
    //           color: ColorUtils.white248
    //       ),
    //       child: CustomScrollView(
    //         slivers: [
    //
    //           SliverToBoxAdapter(
    //             child: Column(
    //               children: [
    //
    //                 SpacerWidget.spacerWidget(spaceHeight: 11.ht(context)),
    //
    //                 Padding(
    //                   padding: EdgeInsets.symmetric(horizontal: 37.hpmt(context)),
    //                   child: Directionality(
    //                     textDirection: TextDirection.ltr,
    //                     child: Row(
    //                       mainAxisAlignment: MainAxisAlignment.start,
    //                       children: [
    //
    //                         Container(
    //                           height: 40.ht(context),
    //                           width: 40.wt(context),
    //                           decoration: BoxDecoration(
    //                             color: Colors.transparent,
    //                           ),
    //                           child: TextButton(
    //                             style: TextButton.styleFrom(padding: EdgeInsets.zero),
    //                             onPressed: () {
    //                               Get.off(()=>ProfileScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
    //                             },
    //                             child: FittedBox(
    //                               fit: BoxFit.cover,
    //                               child: Image.asset(
    //                                 ImagePathUtils.authorizationBackButtonImagePath,
    //                                 fit: BoxFit.cover,
    //                                 alignment: Alignment.center,
    //                               ),
    //                             ),
    //                           ),
    //                         ),
    //
    //
    //                         Expanded(
    //                           child: Container(
    //                             alignment: Alignment.center,
    //                             child: Text(
    //                               "Change Language".tr,
    //                               textAlign: TextAlign.center,
    //                               style: GoogleFonts.tajawal(
    //                                 fontWeight: FontWeight.w700,
    //                                 fontStyle: FontStyle.normal,
    //                                 fontSize: 16.spt(context),
    //                                 color: ColorUtils.black255,
    //                               ),
    //                             ),
    //                           ),
    //                         ),
    //
    //                       ],
    //                     ),
    //                   ),
    //                 ),
    //
    //
    //                 SpacerWidget.spacerWidget(spaceHeight: 35.ht(context)),
    //
    //                 Padding(
    //                   padding: EdgeInsets.symmetric(horizontal: 138.hpmt(context)),
    //                   child: Column(
    //                     children: [
    //
    //                       Container(
    //                         height: 56.ht(context),
    //                         width: 468.wt(context),
    //                         decoration: BoxDecoration(
    //                           border: isArabic.value == false  ?
    //                           Border.all(color: ColorUtils.white217,width: 1) :
    //                           Border.all(color: ColorUtils.blue192,width: 1),
    //                           borderRadius: BorderRadius.circular(10.rt(context)),
    //                         ),
    //                         padding: EdgeInsets.symmetric(vertical: 12.vpmt(context),horizontal: 12.hpmt(context)),
    //                         child: TextButton(
    //                           style: TextButton.styleFrom(padding: EdgeInsets.zero),
    //                           onPressed: () async {
    //                             if(isArabic.value == true) {
    //                               isArabic.value = false;
    //                               isEnglish.value = false;
    //                             } else {
    //                               isArabic.value = true;
    //                               isEnglish.value = false;
    //                             }
    //                           },
    //                           child: Row(
    //                             children: [
    //
    //
    //                               Container(
    //                                 height: 30.ht(context),
    //                                 width: 30.wt(context),
    //                                 decoration: BoxDecoration(
    //                                   border: isArabic.value  == false  ?
    //                                   Border.all(color: ColorUtils.white217,width: 1) :
    //                                   Border.all(color: ColorUtils.blue192,width: 1),
    //                                   shape: BoxShape.circle,
    //                                 ),
    //                                 child: Center(
    //                                   child: Container(
    //                                     height: 16.ht(context),
    //                                     width: 16.wt(context),
    //                                     decoration: BoxDecoration(
    //                                         shape: BoxShape.circle,
    //                                         color: isArabic.value == false ?
    //                                         Colors.transparent : ColorUtils.blue192
    //                                     ),
    //                                   ),
    //                                 ),
    //                               ),
    //
    //                               SpacerWidget.spacerWidget(spaceWidth: 12.wt(context)),
    //
    //                               Expanded(
    //                                 child: Container(
    //                                   alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
    //                                   child: Text(
    //                                     "Arabic Language".tr,
    //                                     textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
    //                                     style: GoogleFonts.tajawal(
    //                                       fontWeight: FontWeight.w700,
    //                                       fontStyle: FontStyle.normal,
    //                                       fontSize: 18.spt(context),
    //                                       color: ColorUtils.black30,
    //                                     ),
    //                                   ),
    //                                 ),
    //                               ),
    //
    //                             ],
    //                           ),
    //                         ),
    //                       ),
    //
    //                       SpacerWidget.spacerWidget(spaceHeight: 16.ht(context)),
    //
    //
    //                       Container(
    //                         height: 56.ht(context),
    //                         width: 468.wt(context),
    //                         decoration: BoxDecoration(
    //                           border: isEnglish.value == false  ?
    //                           Border.all(color: ColorUtils.white217,width: 1) :
    //                           Border.all(color: ColorUtils.blue192,width: 1),
    //                           borderRadius: BorderRadius.circular(10.rt(context)),
    //                         ),
    //                         padding: EdgeInsets.symmetric(vertical: 12.vpmt(context),horizontal: 12.hpmt(context)),
    //                         child: TextButton(
    //                           style: TextButton.styleFrom(padding: EdgeInsets.zero),
    //                           onPressed: () async {
    //                             if(isEnglish.value == true) {
    //                               isArabic.value = false;
    //                               isEnglish.value = false;
    //                             } else {
    //                               isArabic.value = false;
    //                               isEnglish.value = true;
    //                             }
    //                           },
    //                           child: Row(
    //                             children: [
    //
    //
    //                               Container(
    //                                 height: 30.ht(context),
    //                                 width: 30.wt(context),
    //                                 decoration: BoxDecoration(
    //                                   border: isEnglish.value == false  ?
    //                                   Border.all(color: ColorUtils.white217,width: 1) :
    //                                   Border.all(color: ColorUtils.blue192,width: 1),
    //                                   shape: BoxShape.circle,
    //                                 ),
    //                                 child: Center(
    //                                   child: Container(
    //                                     height: 16.ht(context),
    //                                     width: 16.wt(context),
    //                                     decoration: BoxDecoration(
    //                                         shape: BoxShape.circle,
    //                                         color: isEnglish.value == false ?
    //                                         Colors.transparent : ColorUtils.blue192
    //                                     ),
    //                                   ),
    //                                 ),
    //                               ),
    //
    //                               SpacerWidget.spacerWidget(spaceWidth: 12.wt(context)),
    //
    //                               Expanded(
    //                                 child: Container(
    //                                   alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
    //                                   child: Text(
    //                                     "English Language".tr,
    //                                     textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
    //                                     style: GoogleFonts.tajawal(
    //                                       fontWeight: FontWeight.w700,
    //                                       fontStyle: FontStyle.normal,
    //                                       fontSize: 18.spt(context),
    //                                       color: ColorUtils.black30,
    //                                     ),
    //                                   ),
    //                                 ),
    //                               ),
    //
    //                             ],
    //                           ),
    //                         ),
    //                       ),
    //
    //
    //                       SpacerWidget.spacerWidget(spaceHeight: 32.ht(context)),
    //
    //
    //                       Container(
    //                         height: 48.ht(context),
    //                         width: 320.wt(context),
    //                         decoration: BoxDecoration(
    //                           color: ColorUtils.blue192,
    //                           borderRadius: BorderRadius.circular(8.rt(context)),
    //                         ),
    //                         child: TextButton(
    //                           style: TextButton.styleFrom(padding: EdgeInsets.zero),
    //                           onPressed: () async {
    //                             if(isEnglish.value == true) {
    //                               Get.updateLocale(Locale("en"));
    //                             } else {
    //                               Get.updateLocale(Locale("ar"));
    //                             }
    //                           },
    //                           child: Center(
    //                             child: Text(
    //                               "Change Language".tr,
    //                               textAlign: TextAlign.center,
    //                               style: GoogleFonts.tajawal(
    //                                 fontWeight: FontWeight.w700,
    //                                 fontStyle: FontStyle.normal,
    //                                 fontSize: 18.spt(context),
    //                                 color: ColorUtils.white255,
    //                               ),
    //                             ),
    //                           ),
    //                         ),
    //                       ),
    //
    //                     ],
    //                   ),
    //                 ),
    //
    //               ],
    //             ),
    //           )
    //
    //
    //         ],
    //       ),
    //     ),
    //   ));
    // } else {
    //
    // }
    return Obx(()=>SafeArea(
      child: Container(
        height: 844.hm(context),
        width: 390.wm(context),
        decoration: BoxDecoration(
          color: ColorUtils.white248,
        ),
        child: CustomScrollView(
          slivers: [

            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.hpmm(context)),
                child: Column(
                  children: [

                    SpacerWidget.spacerWidget(spaceHeight: 11.hm(context)),

                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          Container(
                            height: 40.hm(context),
                            width: 40.wm(context),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                            ),
                            child: TextButton(
                              style: TextButton.styleFrom(padding: EdgeInsets.zero),
                              onPressed: () {
                                Get.off(()=>ProfileScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                              },
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: Image.asset(
                                  ImagePathUtils.authorizationBackButtonImagePath,
                                  fit: BoxFit.cover,
                                  alignment: Alignment.center,
                                ),
                              ),
                            ),
                          ),


                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                "Change Language".tr,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.tajawal(
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16.spm(context),
                                  color: ColorUtils.black255,
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),


                    SpacerWidget.spacerWidget(spaceHeight: 35.hm(context)),

                    Container(
                      height: 56.hm(context),
                      width: 358.wm(context),
                      decoration: BoxDecoration(
                        border: isArabic.value == false  ?
                        Border.all(color: ColorUtils.white217,width: 1) :
                        Border.all(color: ColorUtils.blue192,width: 1),
                        borderRadius: BorderRadius.circular(10.rm(context)),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 12.vpmm(context),horizontal: 12.hpmm(context)),
                      child: TextButton(
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        onPressed: () async {
                          if(isArabic.value == true) {
                            isArabic.value = false;
                            isEnglish.value = false;
                          } else {
                            isArabic.value = true;
                            isEnglish.value = false;
                          }
                        },
                        child: Row(
                          children: [


                            Container(
                              height: 30.hm(context),
                              width: 30.wm(context),
                              decoration: BoxDecoration(
                                border: isArabic.value  == false  ?
                                Border.all(color: ColorUtils.white217,width: 1) :
                                Border.all(color: ColorUtils.blue192,width: 1),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Container(
                                  height: 16.hm(context),
                                  width: 16.wm(context),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: isArabic.value == false ?
                                      Colors.transparent : ColorUtils.blue192
                                  ),
                                ),
                              ),
                            ),

                            SpacerWidget.spacerWidget(spaceWidth: 12.wm(context)),

                            Expanded(
                              child: Container(
                                alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                child: Text(
                                  "Arabic Language".tr,
                                  textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                  style: GoogleFonts.tajawal(
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 18.spm(context),
                                    color: ColorUtils.black30,
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),

                    SpacerWidget.spacerWidget(spaceHeight: 16.hm(context)),


                    Container(
                      height: 56.hm(context),
                      width: 358.wm(context),
                      decoration: BoxDecoration(
                        border: isEnglish.value == false  ?
                        Border.all(color: ColorUtils.white217,width: 1) :
                        Border.all(color: ColorUtils.blue192,width: 1),
                        borderRadius: BorderRadius.circular(10.rm(context)),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 12.vpmm(context),horizontal: 12.hpmm(context)),
                      child: TextButton(
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        onPressed: () async {
                          if(isEnglish.value == true) {
                            isArabic.value = false;
                            isEnglish.value = false;
                          } else {
                            isArabic.value = false;
                            isEnglish.value = true;
                          }
                        },
                        child: Row(
                          children: [


                            Container(
                              height: 30.hm(context),
                              width: 30.wm(context),
                              decoration: BoxDecoration(
                                border: isEnglish.value == false  ?
                                Border.all(color: ColorUtils.white217,width: 1) :
                                Border.all(color: ColorUtils.blue192,width: 1),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Container(
                                  height: 16.hm(context),
                                  width: 16.wm(context),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: isEnglish.value == false ?
                                      Colors.transparent : ColorUtils.blue192
                                  ),
                                ),
                              ),
                            ),

                            SpacerWidget.spacerWidget(spaceWidth: 12.wm(context)),

                            Expanded(
                              child: Container(
                                alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                child: Text(
                                  "English Language".tr,
                                  textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                  style: GoogleFonts.tajawal(
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 18.spm(context),
                                    color: ColorUtils.black30,
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),


                    SpacerWidget.spacerWidget(spaceHeight: 32.hm(context)),


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
                          if(isEnglish.value == true) {
                            Get.updateLocale(Locale("en"));
                          } else {
                            Get.updateLocale(Locale("ar"));
                          }
                        },
                        child: Center(
                          child: Text(
                            "Change Language".tr,
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

                  ],
                ),
              ),
            )


          ],
        ),
      ),
    ));
  }


}