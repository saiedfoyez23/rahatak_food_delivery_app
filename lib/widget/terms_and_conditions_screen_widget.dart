import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rahatak_food_delivery_app/utils/utils.dart';

import '../screen/screen.dart';

class TermsAndConditionsScreenWidget extends GetxController {


  Widget termsAndConditionsScreenWidget({required BuildContext context}) {
    if(MediaQuery.sizeOf(context).height > 1000) {
      return SafeArea(
        child: Container(
          height: 1133.ht(context),
          width: 744.wt(context),
          decoration: BoxDecoration(
            color: ColorUtils.white248,
          ),
          child: CustomScrollView(
            slivers: [
        
        
              SliverToBoxAdapter(
                child: Column(
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
                                  "Terms and Conditions".tr,
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
                      child: Container(
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
                                "Terms and Conditions of the Application".tr,
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
                      
                      
                            SpacerWidget.spacerWidget(spaceHeight: 20.ht(context)),
                      
                      
                      
                            Container(
                              alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                              child: Text(
                                "1. Acceptance of Terms".tr,
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
                                "By using the Rahtak application, you agree to comply with these terms and conditions.".tr,
                                textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.start,
                                style: GoogleFonts.tajawal(
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16.spt(context),
                                  color: ColorUtils.black255,
                                  height: (25.ht(context) / 16.spt(context)),
                                ),
                              ),
                            ),
                      
                            SpacerWidget.spacerWidget(spaceHeight: 20.ht(context)),
                      
                      
                            Container(
                              alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                              child: Text(
                                "2. Services".tr,
                                textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.start,
                                style: GoogleFonts.tajawal(
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16.spt(context),
                                  color: ColorUtils.black255,
                                  height: (25.ht(context) / 16.spt(context)),
                                ),
                              ),
                            ),
                      
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SpacerWidget.spacerWidget(spaceWidth: 7.wt(context)),
                                Container(
                                  height: 3.ht(context),
                                  width: 3.wt(context),
                                  margin: EdgeInsets.symmetric(vertical: 9.vpmt(context)),
                                  decoration: BoxDecoration(
                                      color: ColorUtils.black255,
                                      shape: BoxShape.circle
                                  ),
                                ),
                                SpacerWidget.spacerWidget(spaceWidth: 7.wt(context)),
                                Expanded(
                                  child: Container(
                                    alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                    child: Text(
                                      "The application provides the ability to order food from available restaurants within the app.".tr,
                                      textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.start,
                                      style: GoogleFonts.tajawal(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 16.spt(context),
                                        color: ColorUtils.black255,
                                        height: (25.ht(context) / 16.spt(context)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                      
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SpacerWidget.spacerWidget(spaceWidth: 7.wt(context)),
                                Container(
                                  height: 3.ht(context),
                                  width: 3.wt(context),
                                  margin: EdgeInsets.symmetric(vertical: 9.vpmt(context)),
                                  decoration: BoxDecoration(
                                      color: ColorUtils.black255,
                                      shape: BoxShape.circle
                                  ),
                                ),
                                SpacerWidget.spacerWidget(spaceWidth: 7.wt(context)),
                                Expanded(
                                  child: Container(
                                    alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                    child: Text(
                                      "Orders are delivered by authorized delivery representatives.".tr,
                                      textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.start,
                                      style: GoogleFonts.tajawal(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 16.spt(context),
                                        color: ColorUtils.black255,
                                        height: (25.ht(context) / 16.spt(context)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                      
                      
                            SpacerWidget.spacerWidget(spaceHeight: 20.ht(context)),
                      
                      
                            Container(
                              alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                              child: Text(
                                "3. Registration and Account".tr,
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
                      
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SpacerWidget.spacerWidget(spaceWidth: 7.wt(context)),
                                Container(
                                  height: 3.ht(context),
                                  width: 3.wt(context),
                                  margin: EdgeInsets.symmetric(vertical: 9.vpmt(context)),
                                  decoration: BoxDecoration(
                                      color: ColorUtils.black255,
                                      shape: BoxShape.circle
                                  ),
                                ),
                                SpacerWidget.spacerWidget(spaceWidth: 7.wt(context)),
                                Expanded(
                                  child: Container(
                                    alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                    child: Text(
                                      "Customers must enter accurate and correct information when registering.".tr,
                                      textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.start,
                                      style: GoogleFonts.tajawal(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 16.spt(context),
                                        color: ColorUtils.black255,
                                        height: (25.ht(context) / 16.spt(context)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                      
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SpacerWidget.spacerWidget(spaceWidth: 7.wt(context)),
                                Container(
                                  height: 3.ht(context),
                                  width: 3.wt(context),
                                  margin: EdgeInsets.symmetric(vertical: 9.vpmt(context)),
                                  decoration: BoxDecoration(
                                      color: ColorUtils.black255,
                                      shape: BoxShape.circle
                                  ),
                                ),
                                SpacerWidget.spacerWidget(spaceWidth: 7.wt(context)),
                                Expanded(
                                  child: Container(
                                    alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                    child: Text(
                                      "The customer is responsible for maintaining the confidentiality of their account and password.".tr,
                                      textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.start,
                                      style: GoogleFonts.tajawal(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 16.spt(context),
                                        color: ColorUtils.black255,
                                        height: (25.ht(context) / 16.spt(context)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                      
                      
                      
                            SpacerWidget.spacerWidget(spaceHeight: 20.ht(context)),
                      
                      
                            Container(
                              alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                              child: Text(
                                "4. Order and Payment".tr,
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
                      
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SpacerWidget.spacerWidget(spaceWidth: 7.wt(context)),
                                Container(
                                  height: 3.ht(context),
                                  width: 3.wt(context),
                                  margin: EdgeInsets.symmetric(vertical: 9.vpmt(context)),
                                  decoration: BoxDecoration(
                                      color: ColorUtils.black255,
                                      shape: BoxShape.circle
                                  ),
                                ),
                                SpacerWidget.spacerWidget(spaceWidth: 7.wt(context)),
                                Expanded(
                                  child: Container(
                                    alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                    child: Text(
                                      "The order is confirmed after completing the payment process (Visa or MasterCard, or cash on delivery).".tr,
                                      textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.start,
                                      style: GoogleFonts.tajawal(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 16.spt(context),
                                        color: ColorUtils.black255,
                                        height: (25.ht(context) / 16.spt(context)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                      
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SpacerWidget.spacerWidget(spaceWidth: 7.wt(context)),
                                Container(
                                  height: 3.ht(context),
                                  width: 3.wt(context),
                                  margin: EdgeInsets.symmetric(vertical: 9.vpmt(context)),
                                  decoration: BoxDecoration(
                                      color: ColorUtils.black255,
                                      shape: BoxShape.circle
                                  ),
                                ),
                                SpacerWidget.spacerWidget(spaceWidth: 7.wt(context)),
                                Expanded(
                                  child: Container(
                                    alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                    child: Text(
                                      "The order cannot be modified after it has been sent except through customer service.".tr,
                                      textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.start,
                                      style: GoogleFonts.tajawal(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 16.spt(context),
                                        color: ColorUtils.black255,
                                        height: (25.ht(context) / 16.spt(context)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                      
                            SpacerWidget.spacerWidget(spaceHeight: 20.ht(context)),
                      
                      
                            Container(
                              alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                              child: Text(
                                "5. Cancellation and Refund".tr,
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
                      
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SpacerWidget.spacerWidget(spaceWidth: 7.wt(context)),
                                Container(
                                  height: 3.ht(context),
                                  width: 3.wt(context),
                                  margin: EdgeInsets.symmetric(vertical: 9.vpmt(context)),
                                  decoration: BoxDecoration(
                                      color: ColorUtils.black255,
                                      shape: BoxShape.circle
                                  ),
                                ),
                                SpacerWidget.spacerWidget(spaceWidth: 7.wt(context)),
                                Expanded(
                                  child: Container(
                                    alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                    child: Text(
                                      "The customer has the right to cancel the order before the restaurant accepts it.".tr,
                                      textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.start,
                                      style: GoogleFonts.tajawal(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 16.spt(context),
                                        color: ColorUtils.black255,
                                        height: (25.ht(context) / 16.spt(context)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                      
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SpacerWidget.spacerWidget(spaceWidth: 7.wt(context)),
                                Container(
                                  height: 3.ht(context),
                                  width: 3.wt(context),
                                  margin: EdgeInsets.symmetric(vertical: 9.vpmt(context)),
                                  decoration: BoxDecoration(
                                      color: ColorUtils.black255,
                                      shape: BoxShape.circle
                                  ),
                                ),
                                SpacerWidget.spacerWidget(spaceWidth: 7.wt(context)),
                                Expanded(
                                  child: Container(
                                    alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                    child: Text(
                                      "Refunds cannot be issued after the order has been prepared or delivered, except in cases of error or defect in the order.".tr,
                                      textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.start,
                                      style: GoogleFonts.tajawal(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 16.spt(context),
                                        color: ColorUtils.black255,
                                        height: (25.ht(context) / 16.spt(context)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                      
                            SpacerWidget.spacerWidget(spaceHeight: 20.ht(context)),
                      
                      
                      
                            Container(
                              alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                              child: Text(
                                "6. Usage Policy".tr,
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
                      
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SpacerWidget.spacerWidget(spaceWidth: 7.wt(context)),
                                Container(
                                  height: 3.ht(context),
                                  width: 3.wt(context),
                                  margin: EdgeInsets.symmetric(vertical: 9.vpmt(context)),
                                  decoration: BoxDecoration(
                                      color: ColorUtils.black255,
                                      shape: BoxShape.circle
                                  ),
                                ),
                                SpacerWidget.spacerWidget(spaceWidth: 7.wt(context)),
                                Expanded(
                                  child: Container(
                                    alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                    child: Text(
                                      "The application is prohibited from being used for any illegal purposes, harassment, or exploitation.".tr,
                                      textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.start,
                                      style: GoogleFonts.tajawal(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 16.spt(context),
                                        color: ColorUtils.black255,
                                        height: (25.ht(context) / 16.spt(context)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                      
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SpacerWidget.spacerWidget(spaceWidth: 7.wt(context)),
                                Container(
                                  height: 3.ht(context),
                                  width: 3.wt(context),
                                  margin: EdgeInsets.symmetric(vertical: 9.vpmt(context)),
                                  decoration: BoxDecoration(
                                      color: ColorUtils.black255,
                                      shape: BoxShape.circle
                                  ),
                                ),
                                SpacerWidget.spacerWidget(spaceWidth: 7.wt(context)),
                                Expanded(
                                  child: Container(
                                    alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                    child: Text(
                                      "The application reserves the right to suspend or delete any user's account in case of violation of the terms.".tr,
                                      textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.start,
                                      style: GoogleFonts.tajawal(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 16.spt(context),
                                        color: ColorUtils.black255,
                                        height: (25.ht(context) / 16.spt(context)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                      
                      
                      
                          ],
                        ),
                      ),
                    ),


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
                  padding: EdgeInsets.symmetric(horizontal: 16.hm(context)),
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
                                  "Terms and Conditions".tr,
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
                                "Terms and Conditions of the Application".tr,
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


                            SpacerWidget.spacerWidget(spaceHeight: 20.hm(context)),



                            Container(
                              alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                              child: Text(
                                "1. Acceptance of Terms".tr,
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
                                "By using the Rahtak application, you agree to comply with these terms and conditions.".tr,
                                textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.start,
                                style: GoogleFonts.tajawal(
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16.spm(context),
                                  color: ColorUtils.black255,
                                  height: (25.hm(context) / 16.spm(context)),
                                ),
                              ),
                            ),

                            SpacerWidget.spacerWidget(spaceHeight: 20.hm(context)),


                            Container(
                              alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                              child: Text(
                                "2. Services".tr,
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

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SpacerWidget.spacerWidget(spaceWidth: 7.wm(context)),
                                Container(
                                  height: 3.hm(context),
                                  width: 3.wm(context),
                                  margin: EdgeInsets.symmetric(vertical: 9.vpmm(context)),
                                  decoration: BoxDecoration(
                                    color: ColorUtils.black255,
                                    shape: BoxShape.circle
                                  ),
                                ),
                                SpacerWidget.spacerWidget(spaceWidth: 7.wm(context)),
                                Expanded(
                                  child: Container(
                                    alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                    child: Text(
                                      "The application provides the ability to order food from available restaurants within the app.".tr,
                                      textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.start,
                                      style: GoogleFonts.tajawal(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 16.spm(context),
                                        color: ColorUtils.black255,
                                        height: (25.hm(context) / 16.spm(context)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SpacerWidget.spacerWidget(spaceWidth: 7.wm(context)),
                                Container(
                                  height: 3.hm(context),
                                  width: 3.wm(context),
                                  margin: EdgeInsets.symmetric(vertical: 9.vpmm(context)),
                                  decoration: BoxDecoration(
                                      color: ColorUtils.black255,
                                      shape: BoxShape.circle
                                  ),
                                ),
                                SpacerWidget.spacerWidget(spaceWidth: 7.wm(context)),
                                Expanded(
                                  child: Container(
                                    alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                    child: Text(
                                      "Orders are delivered by authorized delivery representatives.".tr,
                                      textAlign: Get.locale.toString() == "en" ? TextAlign.start :  TextAlign.start,
                                      style: GoogleFonts.tajawal(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 16.spm(context),
                                        color: ColorUtils.black255,
                                        height: (25.hm(context) / 16.spm(context)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),


                            SpacerWidget.spacerWidget(spaceHeight: 20.hm(context)),


                            Container(
                              alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                              child: Text(
                                "3. Registration and Account".tr,
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

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SpacerWidget.spacerWidget(spaceWidth: 7.wm(context)),
                                Container(
                                  height: 3.hm(context),
                                  width: 3.wm(context),
                                  margin: EdgeInsets.symmetric(vertical: 9.vpmm(context)),
                                  decoration: BoxDecoration(
                                      color: ColorUtils.black255,
                                      shape: BoxShape.circle
                                  ),
                                ),
                                SpacerWidget.spacerWidget(spaceWidth: 7.wm(context)),
                                Expanded(
                                  child: Container(
                                    alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                    child: Text(
                                      "Customers must enter accurate and correct information when registering.".tr,
                                      textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.start,
                                      style: GoogleFonts.tajawal(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 16.spm(context),
                                        color: ColorUtils.black255,
                                        height: (25.hm(context) / 16.spm(context)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SpacerWidget.spacerWidget(spaceWidth: 7.wm(context)),
                                Container(
                                  height: 3.hm(context),
                                  width: 3.wm(context),
                                  margin: EdgeInsets.symmetric(vertical: 9.vpmm(context)),
                                  decoration: BoxDecoration(
                                      color: ColorUtils.black255,
                                      shape: BoxShape.circle
                                  ),
                                ),
                                SpacerWidget.spacerWidget(spaceWidth: 7.wm(context)),
                                Expanded(
                                  child: Container(
                                    alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                    child: Text(
                                      "The customer is responsible for maintaining the confidentiality of their account and password.".tr,
                                      textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.start,
                                      style: GoogleFonts.tajawal(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 16.spm(context),
                                        color: ColorUtils.black255,
                                        height: (25.hm(context) / 16.spm(context)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),



                            SpacerWidget.spacerWidget(spaceHeight: 20.hm(context)),


                            Container(
                              alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                              child: Text(
                                "4. Order and Payment".tr,
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

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SpacerWidget.spacerWidget(spaceWidth: 7.wm(context)),
                                Container(
                                  height: 3.hm(context),
                                  width: 3.wm(context),
                                  margin: EdgeInsets.symmetric(vertical: 9.vpmm(context)),
                                  decoration: BoxDecoration(
                                      color: ColorUtils.black255,
                                      shape: BoxShape.circle
                                  ),
                                ),
                                SpacerWidget.spacerWidget(spaceWidth: 7.wm(context)),
                                Expanded(
                                  child: Container(
                                    alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                    child: Text(
                                      "The order is confirmed after completing the payment process (Visa or MasterCard, or cash on delivery).".tr,
                                      textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.start,
                                      style: GoogleFonts.tajawal(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 16.spm(context),
                                        color: ColorUtils.black255,
                                        height: (25.hm(context) / 16.spm(context)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SpacerWidget.spacerWidget(spaceWidth: 7.wm(context)),
                                Container(
                                  height: 3.hm(context),
                                  width: 3.wm(context),
                                  margin: EdgeInsets.symmetric(vertical: 9.vpmm(context)),
                                  decoration: BoxDecoration(
                                      color: ColorUtils.black255,
                                      shape: BoxShape.circle
                                  ),
                                ),
                                SpacerWidget.spacerWidget(spaceWidth: 7.wm(context)),
                                Expanded(
                                  child: Container(
                                    alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                    child: Text(
                                      "The order cannot be modified after it has been sent except through customer service.".tr,
                                      textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.start,
                                      style: GoogleFonts.tajawal(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 16.spm(context),
                                        color: ColorUtils.black255,
                                        height: (25.hm(context) / 16.spm(context)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SpacerWidget.spacerWidget(spaceHeight: 20.hm(context)),


                            Container(
                              alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                              child: Text(
                                "5. Cancellation and Refund".tr,
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

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SpacerWidget.spacerWidget(spaceWidth: 7.wm(context)),
                                Container(
                                  height: 3.hm(context),
                                  width: 3.wm(context),
                                  margin: EdgeInsets.symmetric(vertical: 9.vpmm(context)),
                                  decoration: BoxDecoration(
                                      color: ColorUtils.black255,
                                      shape: BoxShape.circle
                                  ),
                                ),
                                SpacerWidget.spacerWidget(spaceWidth: 7.wm(context)),
                                Expanded(
                                  child: Container(
                                    alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                    child: Text(
                                      "The customer has the right to cancel the order before the restaurant accepts it.".tr,
                                      textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.start,
                                      style: GoogleFonts.tajawal(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 16.spm(context),
                                        color: ColorUtils.black255,
                                        height: (25.hm(context) / 16.spm(context)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SpacerWidget.spacerWidget(spaceWidth: 7.wm(context)),
                                Container(
                                  height: 3.hm(context),
                                  width: 3.wm(context),
                                  margin: EdgeInsets.symmetric(vertical: 9.vpmm(context)),
                                  decoration: BoxDecoration(
                                      color: ColorUtils.black255,
                                      shape: BoxShape.circle
                                  ),
                                ),
                                SpacerWidget.spacerWidget(spaceWidth: 7.wm(context)),
                                Expanded(
                                  child: Container(
                                    alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                    child: Text(
                                      "Refunds cannot be issued after the order has been prepared or delivered, except in cases of error or defect in the order.".tr,
                                      textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.start,
                                      style: GoogleFonts.tajawal(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 16.spm(context),
                                        color: ColorUtils.black255,
                                        height: (25.hm(context) / 16.spm(context)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SpacerWidget.spacerWidget(spaceHeight: 20.hm(context)),



                            Container(
                              alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                              child: Text(
                                "6. Usage Policy".tr,
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

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SpacerWidget.spacerWidget(spaceWidth: 7.wm(context)),
                                Container(
                                  height: 3.hm(context),
                                  width: 3.wm(context),
                                  margin: EdgeInsets.symmetric(vertical: 9.vpmm(context)),
                                  decoration: BoxDecoration(
                                      color: ColorUtils.black255,
                                      shape: BoxShape.circle
                                  ),
                                ),
                                SpacerWidget.spacerWidget(spaceWidth: 7.wm(context)),
                                Expanded(
                                  child: Container(
                                    alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                    child: Text(
                                      "The application is prohibited from being used for any illegal purposes, harassment, or exploitation.".tr,
                                      textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.start,
                                      style: GoogleFonts.tajawal(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 16.spm(context),
                                        color: ColorUtils.black255,
                                        height: (25.hm(context) / 16.spm(context)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SpacerWidget.spacerWidget(spaceWidth: 7.wm(context)),
                                Container(
                                  height: 3.hm(context),
                                  width: 3.wm(context),
                                  margin: EdgeInsets.symmetric(vertical: 9.vpmm(context)),
                                  decoration: BoxDecoration(
                                      color: ColorUtils.black255,
                                      shape: BoxShape.circle
                                  ),
                                ),
                                SpacerWidget.spacerWidget(spaceWidth: 7.wm(context)),
                                Expanded(
                                  child: Container(
                                    alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                    child: Text(
                                      "The application reserves the right to suspend or delete any user's account in case of violation of the terms.".tr,
                                      textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.start,
                                      style: GoogleFonts.tajawal(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 16.spm(context),
                                        color: ColorUtils.black255,
                                        height: (25.hm(context) / 16.spm(context)),
                                      ),
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
              )


            ],
          ),
        ),
      );
    }
  }


}