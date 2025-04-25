import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rahatak_food_delivery_app/utils/utils.dart';

import '../screen/screen.dart';

class HelpCenterScreenWidget extends GetxController {

  Rx<TextEditingController> noteController = TextEditingController().obs;

  Widget helpCenterScreenWidget({required BuildContext context}) {
    if(MediaQuery.sizeOf(context).height > 1000) {
      return SafeArea(
        child: Container(
          height: 1133.ht(context),
          width: 744.wt(context),
          decoration: BoxDecoration(
            color: ColorUtils.white248
          ),
          child: CustomScrollView(
            slivers: [
        
              SliverToBoxAdapter(
                child:Column(
                  children: [


                    SpacerWidget.spacerWidget(spaceHeight: 11.ht(context)),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 37.hpmt(context)),
                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            Container(
                              height: 40.ht(context),
                              width: 40.wt(context),
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
                                  "Help Center".tr,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.tajawal(
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 16.spt(context),
                                    color: ColorUtils.black255,
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),


                    SpacerWidget.spacerWidget(spaceHeight: 35.ht(context)),


                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 138.hpmt(context)),
                      child: Column(
                        children: [

                          Container(
                            alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                            child: Text(
                              "Do you need assistance?".tr,
                              textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                              style: GoogleFonts.tajawal(
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                                fontSize: 16.spt(context),
                                color: ColorUtils.black255,
                                height: (25.ht(context) / 16.spt(context)),
                              ),
                            ),
                          ),

                          Container(
                            alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                            child: Text(
                              "We are here to help you! If you encounter any issues or have any questions, feel free to reach out to us through the form or contact information below.".tr,
                              textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.start,
                              style: GoogleFonts.tajawal(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 16.spt(context),
                                color: ColorUtils.black255,
                                height: (25.ht(context) / 16.spt(context)),
                              ),
                            ),
                          ),


                          SpacerWidget.spacerWidget(spaceHeight: 24.ht(context)),

                          Container(
                            width: 744.wt(context),
                            padding: EdgeInsets.symmetric(horizontal: 20.hpmt(context),vertical: 20.vpmt(context)),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.rt(context)),
                              border: Border.all(
                                color: ColorUtils.gray163,
                                width: 0.5,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [


                                Container(
                                  alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                  child: Text(
                                    "Please describe your issue or question in detail, and we will respond to you as soon as possible.".tr,
                                    textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                    style: GoogleFonts.tajawal(
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 16.spt(context),
                                      color: ColorUtils.black255,
                                      height: (25.ht(context) / 16.spt(context)),
                                    ),
                                  ),
                                ),




                                SpacerWidget.spacerWidget(spaceHeight: 19.ht(context)),


                                Container(
                                  alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                  child: Text(
                                    "Message *".tr,
                                    textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                    style: GoogleFonts.tajawal(
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 20.spt(context),
                                      color: ColorUtils.black255,
                                      height: (25.ht(context) / 20.spt(context)),
                                    ),
                                  ),
                                ),


                                SpacerWidget.spacerWidget(spaceHeight: 12.ht(context)),

                                TextFormField(
                                  controller: noteController.value,
                                  textAlign: TextAlign.start,
                                  cursorColor: ColorUtils.blue192,
                                  cursorHeight: 20.ht(context),
                                  style: GoogleFonts.tajawal(
                                    fontSize: 16.spt(context),
                                    fontStyle: FontStyle.normal,
                                    color: ColorUtils.black51,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  maxLines: 7,
                                  textAlignVertical: TextAlignVertical.center,
                                  decoration: InputDecoration(
                                    hintText: "Please write your inquiry or the issue you are facing here...".tr,
                                    hintStyle: GoogleFonts.tajawal(
                                      fontSize: 16.spt(context),
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      color: ColorUtils.gray136,
                                    ),
                                    filled: true,
                                    fillColor: ColorUtils.white255,
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 12.hpmt(context),
                                      vertical: 12.vpmt(context),
                                    ),
                                    constraints: BoxConstraints(
                                      maxHeight: 164.ht(context),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.rt(context)),
                                      borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.rt(context)),
                                      borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.rt(context)),
                                      borderSide: BorderSide(color: ColorUtils.blue192,width: 1),
                                    ),

                                  ),
                                ),


                                SpacerWidget.spacerWidget(spaceHeight: 19.ht(context)),


                                Container(
                                  alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                  child: Text(
                                    "You can attach a picture (optional)".tr,
                                    textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                    style: GoogleFonts.tajawal(
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 20.spt(context),
                                      color: ColorUtils.black255,
                                      height: (25.ht(context) / 20.spt(context)),
                                    ),
                                  ),
                                ),

                                SpacerWidget.spacerWidget(spaceHeight: 12.ht(context)),


                                Container(
                                  height: 144.ht(context),
                                  width: 744.wt(context),
                                  padding: EdgeInsets.symmetric(horizontal: 5.hpmt(context),vertical: 5.vpmt(context)),
                                  decoration: BoxDecoration(
                                    color: ColorUtils.white217,
                                    borderRadius: BorderRadius.circular(10.rm(context)),
                                    border: Border.all(
                                      color: ColorUtils.gray163,
                                      width: 0.5,
                                    ),
                                  ),
                                  child: TextButton(
                                    onPressed: () async {},
                                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [



                                        Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Add Images".tr,
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.tajawal(
                                              fontWeight: FontWeight.w500,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 16.spt(context),
                                              color: ColorUtils.blue192,
                                            ),
                                          ),
                                        ),

                                        SpacerWidget.spacerWidget(spaceHeight: 6.ht(context)),


                                        Container(
                                          height: 36.ht(context),
                                          width: 36.wt(context),
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                          ),
                                          child:  FittedBox(
                                            fit: BoxFit.fill,
                                            child: Image.asset(
                                              ImagePathUtils.uploadIconImagePath,
                                              fit: BoxFit.cover,
                                              alignment: Alignment.center,
                                            ),
                                          ),
                                        ),



                                      ],
                                    ),
                                  ),
                                ),

                                SpacerWidget.spacerWidget(spaceHeight: 19.ht(context)),

                                Container(
                                  height: 48.ht(context),
                                  width: 320.wt(context),
                                  decoration: BoxDecoration(
                                    color: ColorUtils.blue192,
                                    borderRadius: BorderRadius.circular(8.rt(context)),
                                  ),
                                  child: TextButton(
                                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                    onPressed: () async {},
                                    child: Center(
                                      child: Text(
                                        "Send Message".tr,
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



                              ],
                            ),
                          ),

                          SpacerWidget.spacerWidget(spaceHeight: 24.ht(context)),

                          Container(
                            width: 744.wt(context),
                            padding: EdgeInsets.symmetric(horizontal: 20.hpmt(context),vertical: 20.vpmt(context)),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.rm(context)),
                              border: Border.all(
                                color: ColorUtils.gray163,
                                width: 0.5,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [


                                Container(
                                  alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                  child: Text(
                                    "Other Contact Methods".tr,
                                    textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                    style: GoogleFonts.tajawal(
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 16.spt(context),
                                      color: ColorUtils.black255,
                                      height: (25.ht(context) / 16.spt(context)),
                                    ),
                                  ),
                                ),




                                SpacerWidget.spacerWidget(spaceHeight: 12.ht(context)),



                                Container(
                                  alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                  child: Text(
                                    "Phone Number:".tr,
                                    textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                    style: GoogleFonts.tajawal(
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 16.spt(context),
                                      color: ColorUtils.black255,
                                      height: (25.ht(context) / 16.spt(context)),
                                    ),
                                  ),
                                ),


                                Container(
                                  alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                  child: Text(
                                    "+968 9xxxxxxx".tr,
                                    textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                    style: GoogleFonts.tajawal(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 16.spt(context),
                                      color: ColorUtils.black255,
                                      height: (25.ht(context) / 20.spt(context)),
                                    ),
                                  ),
                                ),


                                SpacerWidget.spacerWidget(spaceHeight: 12.ht(context)),


                                Container(
                                  alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                  child: Text(
                                    "Email:".tr,
                                    textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                    style: GoogleFonts.tajawal(
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 16.spt(context),
                                      color: ColorUtils.black255,
                                      height: (25.ht(context) / 16.spt(context)),
                                    ),
                                  ),
                                ),


                                Container(
                                  alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                  child: Text(
                                    "support@rahatakapp.com".tr,
                                    textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                    style: GoogleFonts.tajawal(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 16.spt(context),
                                      color: ColorUtils.black255,
                                      height: (25.ht(context) / 16.spt(context)),
                                    ),
                                  ),
                                ),


                              ],
                            ),
                          ),


                          SpacerWidget.spacerWidget(spaceHeight: 24.ht(context)),


                        ],
                      ),
                    )








                  ],
                ),
              )
        

            ],
          ),
        ),
      );
    } else {
      return SafeArea(
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
                                  "Help Center".tr,
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
                        alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                        child: Text(
                          "Do you need assistance?".tr,
                          textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                          style: GoogleFonts.tajawal(
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                            fontSize: 16.spm(context),
                            color: ColorUtils.black255,
                            height: (25.hm(context) / 16.spm(context)),
                          ),
                        ),
                      ),

                      Container(
                        alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                        child: Text(
                          "We are here to help you! If you encounter any issues or have any questions, feel free to reach out to us through the form or contact information below.".tr,
                          textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.start,
                          style: GoogleFonts.tajawal(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 16.spm(context),
                            color: ColorUtils.black255,
                            height: (25.hm(context) / 16.spm(context)),
                          ),
                        ),
                      ),


                      SpacerWidget.spacerWidget(spaceHeight: 24.hm(context)),

                      Container(
                        width: 390.wm(context),
                        padding: EdgeInsets.symmetric(horizontal: 20.hpmm(context),vertical: 20.vpmm(context)),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.rm(context)),
                          border: Border.all(
                            color: ColorUtils.gray163,
                            width: 0.5,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [


                            Container(
                              alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                              child: Text(
                                "Please describe your issue or question in detail, and we will respond to you as soon as possible.".tr,
                                textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.start,
                                style: GoogleFonts.tajawal(
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16.spm(context),
                                  color: ColorUtils.black255,
                                  height: (25.hm(context) / 16.spm(context)),
                                ),
                              ),
                            ),




                            SpacerWidget.spacerWidget(spaceHeight: 19.hm(context)),


                            Container(
                              alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                              child: Text(
                                "Message *",
                                textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                style: GoogleFonts.tajawal(
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 20.spm(context),
                                  color: ColorUtils.black255,
                                  height: (25.hm(context) / 20.spm(context)),
                                ),
                              ),
                            ),


                            SpacerWidget.spacerWidget(spaceHeight: 12.hm(context)),

                            TextFormField(
                              controller: noteController.value,
                              textAlign: TextAlign.start,
                              cursorColor: ColorUtils.blue192,
                              cursorHeight: 20.hm(context),
                              style: GoogleFonts.tajawal(
                                fontSize: 16.spm(context),
                                fontStyle: FontStyle.normal,
                                color: ColorUtils.black51,
                                fontWeight: FontWeight.w400,
                              ),
                              maxLines: 7,
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                hintText: "Please write your inquiry or the issue you are facing here...".tr,
                                hintStyle: GoogleFonts.tajawal(
                                  fontSize: 16.spm(context),
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  color: ColorUtils.gray136,
                                ),
                                filled: true,
                                fillColor: ColorUtils.white255,
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 12.hpmm(context),
                                  vertical: 12.vpmm(context),
                                ),
                                constraints: BoxConstraints(
                                  maxWidth: 358.wm(context),
                                  maxHeight: 164.hm(context),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.rm(context)),
                                  borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.rm(context)),
                                  borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.rm(context)),
                                  borderSide: BorderSide(color: ColorUtils.blue192,width: 1),
                                ),

                              ),
                            ),


                            SpacerWidget.spacerWidget(spaceHeight: 19.hm(context)),


                            Container(
                              alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                              child: Text(
                                "You can attach a picture (optional)".tr,
                                textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                style: GoogleFonts.tajawal(
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 20.spm(context),
                                  color: ColorUtils.black255,
                                  height: (25.hm(context) / 20.spm(context)),
                                ),
                              ),
                            ),

                            SpacerWidget.spacerWidget(spaceHeight: 12.hm(context)),


                            Container(
                              height: 144.hm(context),
                              width: 390.wm(context),
                              padding: EdgeInsets.symmetric(horizontal: 5.hpmm(context),vertical: 5.vpmm(context)),
                              decoration: BoxDecoration(
                                color: ColorUtils.white217,
                                borderRadius: BorderRadius.circular(10.rm(context)),
                                border: Border.all(
                                  color: ColorUtils.gray163,
                                  width: 0.5,
                                ),
                              ),
                              child: TextButton(
                                onPressed: () async {},
                                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [



                                    Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Add Images".tr,
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.tajawal(
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 16.spm(context),
                                          color: ColorUtils.blue192,
                                        ),
                                      ),
                                    ),

                                    SpacerWidget.spacerWidget(spaceHeight: 6.hm(context)),


                                    Container(
                                      height: 36.hm(context),
                                      width: 36.wm(context),
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                      ),
                                      child:  FittedBox(
                                        fit: BoxFit.fill,
                                        child: Image.asset(
                                          ImagePathUtils.uploadIconImagePath,
                                          fit: BoxFit.cover,
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                    ),



                                  ],
                                ),
                              ),
                            ),

                            SpacerWidget.spacerWidget(spaceHeight: 19.hm(context)),

                            Container(
                              height: 48.hm(context),
                              width: 320.wm(context),
                              decoration: BoxDecoration(
                                color: ColorUtils.blue192,
                                borderRadius: BorderRadius.circular(8.rm(context)),
                              ),
                              child: TextButton(
                                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                onPressed: () async {},
                                child: Center(
                                  child: Text(
                                    "Send Message".tr,
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

                      SpacerWidget.spacerWidget(spaceHeight: 24.hm(context)),

                      Container(
                        width: 390.wm(context),
                        padding: EdgeInsets.symmetric(horizontal: 20.hpmm(context),vertical: 20.vpmm(context)),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.rm(context)),
                          border: Border.all(
                            color: ColorUtils.gray163,
                            width: 0.5,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [


                            Container(
                              alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                              child: Text(
                                "Other Contact Methods".tr,
                                textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                style: GoogleFonts.tajawal(
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16.spm(context),
                                  color: ColorUtils.black255,
                                  height: (25.hm(context) / 16.spm(context)),
                                ),
                              ),
                            ),




                            SpacerWidget.spacerWidget(spaceHeight: 12.hm(context)),



                            Container(
                              alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                              child: Text(
                                "Phone Number:".tr,
                                textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                style: GoogleFonts.tajawal(
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16.spm(context),
                                  color: ColorUtils.black255,
                                  height: (25.hm(context) / 16.spm(context)),
                                ),
                              ),
                            ),


                            Container(
                              alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                              child: Text(
                                "+968 9xxxxxxx".tr,
                                textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                style: GoogleFonts.tajawal(
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16.spm(context),
                                  color: ColorUtils.black255,
                                  height: (25.hm(context) / 20.spm(context)),
                                ),
                              ),
                            ),


                            SpacerWidget.spacerWidget(spaceHeight: 12.hm(context)),


                            Container(
                              alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                              child: Text(
                                "Email:".tr,
                                textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                style: GoogleFonts.tajawal(
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16.spm(context),
                                  color: ColorUtils.black255,
                                  height: (25.hm(context) / 16.spm(context)),
                                ),
                              ),
                            ),


                            Container(
                              alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                              child: Text(
                                "support@rahatakapp.com".tr,
                                textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                style: GoogleFonts.tajawal(
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16.spm(context),
                                  color: ColorUtils.black255,
                                  height: (25.hm(context) / 16.spm(context)),
                                ),
                              ),
                            ),


                          ],
                        ),
                      ),


                      SpacerWidget.spacerWidget(spaceHeight: 24.hm(context)),
        
        
                    ],
                  ),
                ),
              )
        
        
        
            ],
          ),
        ),
      );
    }
  }



}