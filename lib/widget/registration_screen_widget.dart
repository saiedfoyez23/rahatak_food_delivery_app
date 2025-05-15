import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rahatak_food_delivery_app/controller/controller.dart';
import 'package:rahatak_food_delivery_app/utils/utils.dart';

import '../screen/screen.dart';

class RegistrationScreenWidget extends GetxController {

  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> phoneNumberController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  RxBool obscureText = true.obs;
  RxBool isSubmit = false.obs;
  RxBool isCheckIn = true.obs;
  RxBool isResendOtp = false.obs;
  RxBool isOtpSubmit = false.obs;
  RxInt timeCounter = 60.obs;


  Rx<TextEditingController> otp1 = TextEditingController().obs;
  Rx<TextEditingController> otp2 = TextEditingController().obs;
  Rx<TextEditingController> otp3 = TextEditingController().obs;
  Rx<TextEditingController> otp4 = TextEditingController().obs;
  Rx<TextEditingController> otp5 = TextEditingController().obs;
  Rx<TextEditingController> otp6 = TextEditingController().obs;


  Future<void> otpTimer() async {
    Future.delayed(Duration(seconds: 1), () async {
      if(timeCounter > 0) {
        timeCounter.value = timeCounter.value - 1;
        otpTimer();
      } else {
        timeCounter.value = 0;
      }
    });
  }

  Widget registrationScreenWidget({required BuildContext context}) {
    return Obx(()=>SafeArea(
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
                            onPressed: () {
                              showAdaptiveDialog(
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                        top: MediaQuery.sizeOf(context).height > 1000 ? 50.tpmt(context) : 45.tpmm(context),
                                        bottom: MediaQuery.sizeOf(context).height > 1000 ? 941.tpmt(context) : 667.tpmm(context),
                                        left: Get.locale.toString() == "en" ?
                                        MediaQuery.sizeOf(context).width > 500 ? 37.lpmt(context) : 16.lpmm(context) :
                                        MediaQuery.sizeOf(context).width > 500 ? 557.rpmt(context) : 232.rpmm(context),
                                        right: Get.locale.toString() == "en" ?
                                        MediaQuery.sizeOf(context).width > 500 ? 557.rpmt(context) : 232.rpmm(context) :
                                        MediaQuery.sizeOf(context).width > 500 ? 37.lpmt(context) : 16.lpmm(context)
                                    ),
                                    child: Container(
                                      height: MediaQuery.sizeOf(context).height > 1000 ? 88.ht(context) : 88.hm(context),
                                      width: MediaQuery.sizeOf(context).width > 500 ? 150.wt(context) : 150.wm(context),
                                      decoration: BoxDecoration(
                                        color: ColorUtils.white255,
                                        borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).height > 1000 ? 10.rt(context) : 10.rm(context)),
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
                                            height: MediaQuery.sizeOf(context).height > 1000 ? 42.ht(context) : 42.hm(context),
                                            width: MediaQuery.sizeOf(context).width > 500 ? 150.wt(context) : 150.wm(context),
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
                                                    fontSize: MediaQuery.sizeOf(context).height > 1000 ? 16.spt(context) : 16.spm(context),
                                                    color: ColorUtils.black33,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),

                                          Container(
                                            height: MediaQuery.sizeOf(context).height > 1000 ? 42.ht(context) : 42.hm(context),
                                            width: MediaQuery.sizeOf(context).width > 500 ? 150.wt(context) : 150.wm(context),
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
                                                    fontSize: MediaQuery.sizeOf(context).height > 1000 ? 16.spt(context) : 16.spm(context),
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


                    SpacerWidget.spacerWidget(spaceHeight: MediaQuery.sizeOf(context).height > 1000 ? 127.ht(context) : 44.hm(context)),

                    Container(
                      width: MediaQuery.sizeOf(context).width > 500 ? 468.wt(context) : 358.wm(context),
                      alignment: Alignment.center,
                      child: Text(
                        "Join us to Rahtak and enjoy the best food!".tr,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: MediaQuery.sizeOf(context).height > 1000 ? 24.spt(context) : 24.spm(context),
                          color: ColorUtils.black33,
                        ),
                      ),
                    ),

                    SpacerWidget.spacerWidget(spaceHeight: MediaQuery.sizeOf(context).height > 1000 ? 45.ht(context) : 32.hm(context)),

                    Container(
                      width: MediaQuery.sizeOf(context).width > 500 ? 468.wt(context) : 358.wm(context),
                      alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                      child: Text(
                        "Name *".tr,
                        textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: MediaQuery.sizeOf(context).height > 1000 ? 16.spt(context) : 16.spm(context),
                          color: ColorUtils.black33,
                        ),
                      ),
                    ),

                    SpacerWidget.spacerWidget(spaceHeight: MediaQuery.sizeOf(context).height > 1000 ? 12.ht(context) : 12.hm(context)),


                    TextFormField(
                      controller: nameController.value,
                      textAlign: TextAlign.start,
                      cursorColor: ColorUtils.blue192,
                      cursorHeight: MediaQuery.sizeOf(context).height > 1000 ? 20.ht(context) : 20.hm(context),
                      style: GoogleFonts.tajawal(
                        fontSize: MediaQuery.sizeOf(context).height > 1000 ? 16.spt(context) : 16.spm(context),
                        fontStyle: FontStyle.normal,
                        color: ColorUtils.black51,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        hintText: "Enter your name".tr,
                        hintStyle: GoogleFonts.tajawal(
                          fontSize: MediaQuery.sizeOf(context).height > 1000 ? 16.spt(context) : 16.spm(context),
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          color: ColorUtils.gray136,
                        ),
                        filled: true,
                        fillColor: ColorUtils.white255,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.sizeOf(context).width > 500 ? 12.hpmt(context) : 12.hpmm(context),
                          vertical: MediaQuery.sizeOf(context).height > 1000 ? 12.vpmt(context) : 12.vpmm(context),
                        ),
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.sizeOf(context).width > 500 ? 468.wt(context) : 358.wm(context),
                          maxHeight: MediaQuery.sizeOf(context).height > 1000 ? 52.ht(context) : 48.hm(context),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).height > 1000 ? 8.rt(context) : 8.rm(context)),
                          borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).height > 1000 ? 8.rt(context) : 8.rm(context)),
                          borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).height > 1000 ? 8.rt(context) : 8.rm(context)),
                          borderSide: BorderSide(color: ColorUtils.blue192,width: 1),
                        ),

                      ),
                    ),

                    SpacerWidget.spacerWidget(spaceHeight: MediaQuery.sizeOf(context).height > 1000 ? 24.ht(context) : 24.hm(context)),

                    Container(
                      width: MediaQuery.sizeOf(context).width > 500 ? 468.wt(context) : 358.wm(context),
                      alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                      child: Text(
                        "Email *".tr,
                        textAlign:  Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: MediaQuery.sizeOf(context).height > 1000 ? 16.spt(context) : 16.spm(context),
                          color: ColorUtils.black33,
                        ),
                      ),
                    ),

                    SpacerWidget.spacerWidget(spaceHeight: MediaQuery.sizeOf(context).height > 1000 ? 12.ht(context) : 12.hm(context)),

                    TextFormField(
                      controller: emailController.value,
                      textAlign: TextAlign.start,
                      cursorColor: ColorUtils.blue192,
                      cursorHeight: MediaQuery.sizeOf(context).height > 1000 ? 20.ht(context) : 20.hm(context),
                      style: GoogleFonts.tajawal(
                        fontSize: MediaQuery.sizeOf(context).height > 1000 ? 16.spt(context) : 16.spm(context),
                        fontStyle: FontStyle.normal,
                        color: ColorUtils.black51,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        hintText: "Enter your email".tr,
                        hintStyle: GoogleFonts.tajawal(
                          fontSize: MediaQuery.sizeOf(context).height > 1000 ? 16.spt(context) : 16.spm(context),
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          color: ColorUtils.gray136,
                        ),
                        filled: true,
                        fillColor: ColorUtils.white255,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.sizeOf(context).width > 500 ? 12.hpmt(context) : 12.hpmm(context),
                          vertical: MediaQuery.sizeOf(context).height > 1000 ? 12.vpmt(context) : 12.vpmm(context),
                        ),
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.sizeOf(context).width > 500 ? 468.wt(context) : 358.wm(context),
                          maxHeight: MediaQuery.sizeOf(context).height > 1000 ? 52.ht(context) : 48.hm(context),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).height > 1000 ? 8.rt(context) : 8.rm(context)),
                          borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).height > 1000 ? 8.rt(context) : 8.rm(context)),
                          borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).height > 1000 ? 8.rt(context) : 8.rm(context)),
                          borderSide: BorderSide(color: ColorUtils.blue192,width: 1),
                        ),

                      ),
                    ),

                    SpacerWidget.spacerWidget(spaceHeight: MediaQuery.sizeOf(context).height > 1000 ? 24.ht(context) : 24.hm(context)),

                    Container(
                      width: MediaQuery.sizeOf(context).width > 500 ? 468.wt(context) : 358.wm(context),
                      alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                      child: Text(
                        "Phone Number *".tr,
                        textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: MediaQuery.sizeOf(context).height > 1000 ? 16.spt(context) : 16.spm(context),
                          color: ColorUtils.black33,
                        ),
                      ),
                    ),

                    SpacerWidget.spacerWidget(spaceHeight: MediaQuery.sizeOf(context).height > 1000 ? 12.ht(context) : 12.hm(context)),

                    TextFormField(
                      controller: phoneNumberController.value,
                      textAlign: TextAlign.start,
                      cursorColor: ColorUtils.blue192,
                      cursorHeight: MediaQuery.sizeOf(context).height > 1000 ? 20.ht(context) : 20.hm(context),
                      style: GoogleFonts.tajawal(
                        fontSize: MediaQuery.sizeOf(context).height > 1000 ? 16.spt(context) : 16.spm(context),
                        fontStyle: FontStyle.normal,
                        color: ColorUtils.black51,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        hintText: "Enter your phone number".tr,
                        hintStyle: GoogleFonts.tajawal(
                          fontSize: MediaQuery.sizeOf(context).height > 1000 ? 16.spt(context) : 16.spm(context),
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          color: ColorUtils.gray136,
                        ),
                        filled: true,
                        fillColor: ColorUtils.white255,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.sizeOf(context).width > 500 ? 12.hpmt(context) : 12.hpmm(context),
                          vertical: MediaQuery.sizeOf(context).height > 1000 ? 12.vpmt(context) : 12.vpmm(context),
                        ),
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.sizeOf(context).width > 500 ? 468.wt(context) : 358.wm(context),
                          maxHeight: MediaQuery.sizeOf(context).height > 1000 ? 52.ht(context) : 48.hm(context),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).height > 1000 ? 8.rt(context) : 8.rm(context)),
                          borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).height > 1000 ? 8.rt(context) : 8.rm(context)),
                          borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).height > 1000 ? 8.rt(context) : 8.rm(context)),
                          borderSide: BorderSide(color: ColorUtils.blue192,width: 1),
                        ),

                      ),
                    ),


                    SpacerWidget.spacerWidget(spaceHeight: MediaQuery.sizeOf(context).height > 1000 ? 24.ht(context) : 24.hm(context)),

                    Container(
                      width: MediaQuery.sizeOf(context).width > 500 ? 468.wt(context) : 358.wm(context),
                      alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                      child: Text(
                        "Password".tr,
                        textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: MediaQuery.sizeOf(context).height > 1000 ? 16.spt(context) : 16.spm(context),
                          color: ColorUtils.black33,
                        ),
                      ),
                    ),

                    SpacerWidget.spacerWidget(spaceHeight: MediaQuery.sizeOf(context).height > 1000 ? 12.ht(context) : 12.hm(context)),

                    TextFormField(
                      controller: passwordController.value,
                      textAlign: TextAlign.start,
                      cursorColor: ColorUtils.blue192,
                      style: obscureText.value == true ?
                      GoogleFonts.openSans(
                        fontSize: MediaQuery.sizeOf(context).height > 1000 ? 16.spt(context) : 16.spm(context),
                        fontStyle: FontStyle.normal,
                        color: ColorUtils.black51,
                        fontWeight: FontWeight.w400,
                      ) :
                      GoogleFonts.tajawal(
                        fontSize: MediaQuery.sizeOf(context).height > 1000 ? 16.spt(context) : 16.spm(context),
                        fontStyle: FontStyle.normal,
                        color: ColorUtils.black51,
                        fontWeight: FontWeight.w400,
                      ),
                      cursorHeight: MediaQuery.sizeOf(context).height > 1000 ? 20.ht(context) : 20.hm(context),
                      obscureText: obscureText.value,
                      textAlignVertical: TextAlignVertical.center,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        hintText: "********",
                        hintStyle: GoogleFonts.openSans(
                          fontSize: MediaQuery.sizeOf(context).height > 1000 ? 16.spt(context) : 16.spm(context),
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          color: ColorUtils.gray136,
                        ),
                        filled: true,
                        suffixIcon: Container(
                          height: MediaQuery.sizeOf(context).height > 1000 ? 24.ht(context) : 24.hm(context),
                          width: MediaQuery.sizeOf(context).width > 500 ? 24.wt(context) : 24.wm(context),
                          padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.sizeOf(context).width > 500 ? 12.hpmt(context) : 12.hpmm(context),
                            vertical: MediaQuery.sizeOf(context).height > 1000 ? 12.vpmt(context) : 12.vpmm(context),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.transparent
                          ),
                          child: TextButton(
                            style: TextButton.styleFrom(padding: EdgeInsets.zero),
                            onPressed: () {
                              if(obscureText.value == true) {
                                obscureText.value = false;
                              } else {
                                obscureText.value = true;
                              }
                            },
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: Image.asset(
                                obscureText.value == true ?
                                ImagePathUtils.visibilityOffFocusIconImagePath :
                                ImagePathUtils.visibilityFocusIconImagePath,
                                fit: BoxFit.cover,
                                alignment: Alignment.center,
                              ),
                            ),
                          ),
                        ),
                        fillColor: ColorUtils.white255,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.sizeOf(context).width > 500 ? 12.hpmt(context) : 12.hpmm(context),
                          vertical: MediaQuery.sizeOf(context).height > 1000 ? 12.vpmt(context) : 12.vpmm(context),
                        ),
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.sizeOf(context).width > 500 ? 468.wt(context) : 358.wm(context),
                          maxHeight: MediaQuery.sizeOf(context).height > 1000 ? 52.ht(context) : 48.hm(context),
                        ),
                        border:  OutlineInputBorder(
                          borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).height > 1000 ? 8.rt(context) : 8.rm(context)),
                          borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).height > 1000 ? 8.rt(context) : 8.rm(context)),
                          borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).height > 1000 ? 8.rt(context) : 8.rm(context)),
                          borderSide: BorderSide(color: ColorUtils.blue192,width: 1),
                        ),

                      ),
                    ),



                    SpacerWidget.spacerWidget(spaceHeight: MediaQuery.sizeOf(context).height > 1000 ? 24.ht(context) : 24.hm(context)),


                    Container(
                      height: MediaQuery.sizeOf(context).height > 1000 ? 25.ht(context) : 25.hm(context),
                      width: MediaQuery.sizeOf(context).width > 500 ? 468.wt(context) : 358.wm(context),
                      decoration: BoxDecoration(
                          color: Colors.transparent
                      ),
                      alignment: Alignment.center,
                      child: TextButton(
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        onPressed: () {
                          if(isCheckIn.value == true) {
                            isCheckIn.value = false;
                          } else {
                            isCheckIn.value = true;
                          }
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            Container(
                              height: MediaQuery.sizeOf(context).height > 1000 ? 18.ht(context) : 18.hm(context),
                              width: MediaQuery.sizeOf(context).width > 500 ? 18.wt(context) : 18.wm(context),
                              decoration: BoxDecoration(
                                  color: Colors.transparent
                              ),
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: Image.asset(
                                  isCheckIn.value == true ?
                                  ImagePathUtils.checkBoxImagePath :
                                  ImagePathUtils.uncheckBoxImagePath,
                                  fit: BoxFit.cover,
                                  alignment: Alignment.center,
                                ),
                              ),
                            ),

                            SpacerWidget.spacerWidget(spaceWidth: MediaQuery.sizeOf(context).width > 500 ? 8.wt(context) : 8.wm(context)),

                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: "I agree to ".tr,
                                style: GoogleFonts.tajawal(
                                  fontStyle: FontStyle.normal,
                                  fontSize: MediaQuery.sizeOf(context).height > 1000 ? 14.spt(context) : 14.spm(context),
                                  color: ColorUtils.black51,
                                  fontWeight: FontWeight.w500,
                                ),
                                children: [
                                  TextSpan(
                                    text: "the terms and conditions".tr,
                                    style: GoogleFonts.tajawal(
                                      fontStyle: FontStyle.normal,
                                      fontSize: MediaQuery.sizeOf(context).height > 1000 ? 14.spt(context) : 14.spm(context),
                                      color: ColorUtils.blue192,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),


                          ],
                        ),
                      ),
                    ),


                    SpacerWidget.spacerWidget(spaceHeight: MediaQuery.sizeOf(context).height > 1000 ? 48.ht(context) : 45.hm(context)),


                      isSubmit.value == true ?
                      Container(
                        height: MediaQuery.sizeOf(context).height > 1000 ? 52.ht(context) : 48.hm(context),
                        width: MediaQuery.sizeOf(context).width > 500 ? 300.wt(context) : 300.wm(context),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: Center(child: CircularProgressIndicator(),),
                      ) :
                      Container(
                      height: MediaQuery.sizeOf(context).height > 1000 ? 52.ht(context) : 48.hm(context),
                      width: MediaQuery.sizeOf(context).width > 500 ? 300.wt(context) : 300.wm(context),
                      decoration: BoxDecoration(
                        color: ColorUtils.blue192,
                        borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).height > 1000 ? 8.rt(context) : 8.rm(context)),
                      ),
                      child: TextButton(
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        onPressed: () async {
                          if(nameController.value.text == "") {
                            CustomSnackBar().errorCustomSnackBar(context: context, message: "Please enter your name");
                          } else if(emailController.value.text == "") {
                            CustomSnackBar().errorCustomSnackBar(context: context, message: "Please enter your email");
                          } else if(phoneNumberController.value.text == "") {
                            CustomSnackBar().errorCustomSnackBar(context: context, message: "Please enter your phone number");
                          } else if(passwordController.value.text == "") {
                            CustomSnackBar().errorCustomSnackBar(context: context, message: "Please enter your password");
                          } else {
                            isSubmit.value = true;
                            Map<String,dynamic> data = {
                              "name": nameController.value.text,
                              "email": emailController.value.text,
                              "password": passwordController.value.text,
                              "contact": phoneNumberController.value.text,
                            };
                            await SignUpController.getCreateAccountResponse(
                              data: data,
                              onSuccess: (e) async {
                                isSubmit.value = false;
                                timeCounter.value = 60;
                                otp1.value.clear();
                                otp2.value.clear();
                                otp3.value.clear();
                                otp4.value.clear();
                                otp5.value.clear();
                                otp6.value.clear();
                                await otpTimer();
                                showAdaptiveDialog(
                                  context: context,
                                  barrierDismissible: true,
                                  builder: (context) {
                                    return Obx(()=>Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 180.vpmm(context),
                                        horizontal: 16.hpmm(context),
                                      ),
                                      child: Container(
                                        width: 358.wm(context),
                                        height: 468.hm(context),
                                        decoration: BoxDecoration(
                                          color: ColorUtils.white255,
                                          borderRadius: BorderRadius.circular(16.rm(context)),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                          vertical: 30.vpmm(context),
                                          horizontal: 20.hpmm(context),
                                        ),
                                        child: Material(
                                          color: Colors.transparent,
                                          shadowColor: Colors.transparent,
                                          surfaceTintColor: Colors.transparent,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [


                                              Container(
                                                width: 358.wm(context),
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "Verify Your Otp".tr,
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.tajawal(
                                                    fontWeight: FontWeight.w700,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 24.spm(context),
                                                    color: ColorUtils.black33,
                                                    height: (35.hm(context) / 24.spm(context)),
                                                  ),
                                                ),
                                              ),



                                              Container(
                                                width: 358.wm(context),
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "We have sent a 6-digit verification code to your registered email. Please enter the code below to complete your registration.".tr,
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.tajawal(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 18.spm(context),
                                                    color: ColorUtils.black33,
                                                    height: (35.hm(context) / 18.spm(context)),
                                                  ),
                                                ),
                                              ),





                                              SpacerWidget.spacerWidget(spaceHeight: 18.hm(context)),



                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [

                                                  TextFormField(
                                                    controller: otp1.value,
                                                    textAlign: TextAlign.center,
                                                    keyboardType: TextInputType.number,
                                                    cursorColor: ColorUtils.blue192,
                                                    cursorHeight: 20.hm(context),
                                                    style: GoogleFonts.tajawal(
                                                      fontSize: 20.spm(context),
                                                      fontStyle: FontStyle.normal,
                                                      color: ColorUtils.black51,
                                                      fontWeight: FontWeight.w700,
                                                    ),
                                                    onChanged: (pin) {
                                                      if (pin.isNotEmpty) {
                                                        FocusScope.of(context).nextFocus();
                                                      }
                                                    },
                                                    textAlignVertical: TextAlignVertical.center,
                                                    decoration: InputDecoration(
                                                      filled: true,
                                                      fillColor: ColorUtils.white255,
                                                      contentPadding: EdgeInsets.symmetric(
                                                        horizontal: 12.hpmm(context),
                                                        vertical: 12.vpmm(context),
                                                      ),
                                                      constraints: BoxConstraints(
                                                        maxWidth: 40.wm(context),
                                                        maxHeight: 50.hm(context),
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
                                                  SpacerWidget.spacerWidget(spaceWidth: 6.wm(context)),
                                                  TextFormField(
                                                    controller: otp2.value,
                                                    textAlign: TextAlign.center,
                                                    keyboardType: TextInputType.number,
                                                    cursorColor: ColorUtils.blue192,
                                                    cursorHeight: 20.hm(context),
                                                    style: GoogleFonts.tajawal(
                                                      fontSize: 20.spm(context),
                                                      fontStyle: FontStyle.normal,
                                                      color: ColorUtils.black51,
                                                      fontWeight: FontWeight.w700,
                                                    ),
                                                    onChanged: (pin) {
                                                      if (pin.isNotEmpty) {
                                                        FocusScope.of(context).nextFocus();
                                                      }
                                                    },
                                                    textAlignVertical: TextAlignVertical.center,
                                                    decoration: InputDecoration(
                                                      filled: true,
                                                      fillColor: ColorUtils.white255,
                                                      contentPadding: EdgeInsets.symmetric(
                                                        horizontal: 12.hpmm(context),
                                                        vertical: 12.vpmm(context),
                                                      ),
                                                      constraints: BoxConstraints(
                                                        maxWidth: 40.wm(context),
                                                        maxHeight: 50.hm(context),
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
                                                  SpacerWidget.spacerWidget(spaceWidth: 6.wm(context)),
                                                  TextFormField(
                                                    controller: otp3.value,
                                                    textAlign: TextAlign.center,
                                                    keyboardType: TextInputType.number,
                                                    cursorColor: ColorUtils.blue192,
                                                    cursorHeight: 20.hm(context),
                                                    style: GoogleFonts.tajawal(
                                                      fontSize: 20.spm(context),
                                                      fontStyle: FontStyle.normal,
                                                      color: ColorUtils.black51,
                                                      fontWeight: FontWeight.w700,
                                                    ),
                                                    onChanged: (pin) {
                                                      if (pin.isNotEmpty) {
                                                        FocusScope.of(context).nextFocus();
                                                      }
                                                    },
                                                    textAlignVertical: TextAlignVertical.center,
                                                    decoration: InputDecoration(
                                                      filled: true,
                                                      fillColor: ColorUtils.white255,
                                                      contentPadding: EdgeInsets.symmetric(
                                                        horizontal: 12.hpmm(context),
                                                        vertical: 12.vpmm(context),
                                                      ),
                                                      constraints: BoxConstraints(
                                                        maxWidth: 40.wm(context),
                                                        maxHeight: 50.hm(context),
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
                                                  SpacerWidget.spacerWidget(spaceWidth: 6.wm(context)),
                                                  TextFormField(
                                                    controller: otp4.value,
                                                    textAlign: TextAlign.center,
                                                    keyboardType: TextInputType.number,
                                                    cursorColor: ColorUtils.blue192,
                                                    cursorHeight: 20.hm(context),
                                                    style: GoogleFonts.tajawal(
                                                      fontSize: 20.spm(context),
                                                      fontStyle: FontStyle.normal,
                                                      color: ColorUtils.black51,
                                                      fontWeight: FontWeight.w700,
                                                    ),
                                                    onChanged: (pin) {
                                                      if (pin.isNotEmpty) {
                                                        FocusScope.of(context).nextFocus();
                                                      }
                                                    },
                                                    textAlignVertical: TextAlignVertical.center,
                                                    decoration: InputDecoration(
                                                      filled: true,
                                                      fillColor: ColorUtils.white255,
                                                      contentPadding: EdgeInsets.symmetric(
                                                        horizontal: 12.hpmm(context),
                                                        vertical: 12.vpmm(context),
                                                      ),
                                                      constraints: BoxConstraints(
                                                        maxWidth: 40.wm(context),
                                                        maxHeight: 50.hm(context),
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
                                                  SpacerWidget.spacerWidget(spaceWidth: 6.wm(context)),
                                                  TextFormField(
                                                    controller: otp5.value,
                                                    textAlign: TextAlign.center,
                                                    keyboardType: TextInputType.number,
                                                    cursorColor: ColorUtils.blue192,
                                                    cursorHeight: 20.hm(context),
                                                    style: GoogleFonts.tajawal(
                                                      fontSize: 20.spm(context),
                                                      fontStyle: FontStyle.normal,
                                                      color: ColorUtils.black51,
                                                      fontWeight: FontWeight.w700,
                                                    ),
                                                    onChanged: (pin) {
                                                      if (pin.isNotEmpty) {
                                                        FocusScope.of(context).nextFocus();
                                                      }
                                                    },
                                                    textAlignVertical: TextAlignVertical.center,
                                                    decoration: InputDecoration(
                                                      filled: true,
                                                      fillColor: ColorUtils.white255,
                                                      contentPadding: EdgeInsets.symmetric(
                                                        horizontal: 12.hpmm(context),
                                                        vertical: 12.vpmm(context),
                                                      ),
                                                      constraints: BoxConstraints(
                                                        maxWidth: 40.wm(context),
                                                        maxHeight: 50.hm(context),
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
                                                  SpacerWidget.spacerWidget(spaceWidth: 6.wm(context)),
                                                  TextFormField(
                                                    controller: otp6.value,
                                                    textAlign: TextAlign.center,
                                                    keyboardType: TextInputType.number,
                                                    cursorColor: ColorUtils.blue192,
                                                    cursorHeight: 20.hm(context),
                                                    style: GoogleFonts.tajawal(
                                                      fontSize: 20.spm(context),
                                                      fontStyle: FontStyle.normal,
                                                      color: ColorUtils.black51,
                                                      fontWeight: FontWeight.w700,
                                                    ),
                                                    onChanged: (pin) {
                                                      if (pin.isNotEmpty) {
                                                        FocusScope.of(context).unfocus();
                                                      }
                                                    },
                                                    textAlignVertical: TextAlignVertical.center,
                                                    decoration: InputDecoration(
                                                      filled: true,
                                                      fillColor: ColorUtils.white255,
                                                      contentPadding: EdgeInsets.symmetric(
                                                        horizontal: 12.hpmm(context),
                                                        vertical: 12.vpmm(context),
                                                      ),
                                                      constraints: BoxConstraints(
                                                        maxWidth: 40.wm(context),
                                                        maxHeight: 50.hm(context),
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



                                                ],
                                              ),


                                              SpacerWidget.spacerWidget(spaceHeight: 18.hm(context)),


                                              isOtpSubmit.value == false ?
                                              Container(
                                                height: 48.hm(context),
                                                width: 300.wm(context),
                                                decoration: BoxDecoration(
                                                  color: ColorUtils.blue192,
                                                  borderRadius: BorderRadius.circular(8.rm(context)),
                                                ),
                                                child: TextButton(
                                                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                                  onPressed: () async {
                                                    if(otp1.value.text == "" || otp2.value.text == "" || otp3.value.text == "" || otp4.value.text == "" || otp5.value.text == "" || otp6.value.text == "") {
                                                      CustomSnackBar().errorCustomSnackBar(context: context, message: "Please fill the otp");
                                                    } else {
                                                      await SignUpController.checkLocalCreateAccountResponse().then((value) async {
                                                        if(value?.data != null) {
                                                          isOtpSubmit.value = true;
                                                          Map<String,dynamic> data = {
                                                            "email": value?.data?.user?.email,
                                                            "otp": "${otp1.value.text}${otp2.value.text}${otp3.value.text}${otp4.value.text}${otp5.value.text}${otp6.value.text}",
                                                            "verify_account": true
                                                          };
                                                          print(data);
                                                          await SignUpController.getVerifyOtpResponse(
                                                            data: data,
                                                            onSuccess: (e) async {
                                                              isOtpSubmit.value = false;
                                                              CustomSnackBar().successCustomSnackBar(context: context, message: e);
                                                              Get.back();
                                                              showAdaptiveDialog(
                                                                context: context,
                                                                barrierDismissible: false,
                                                                builder: (context) {
                                                                  return Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                      vertical: MediaQuery.sizeOf(context).height > 1000 ? 406.vpmt(context) : 251.vpmm(context),
                                                                      horizontal: MediaQuery.sizeOf(context).width > 500 ? 158.hpmt(context) : 16.hpmm(context),
                                                                    ),
                                                                    child: Container(
                                                                      width: MediaQuery.sizeOf(context).width > 500 ? 414.wt(context) : 358.wm(context),
                                                                      height: MediaQuery.sizeOf(context).height > 1000 ? 247.ht(context) : 303.hm(context),
                                                                      decoration: BoxDecoration(
                                                                        color: ColorUtils.white255,
                                                                        borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).height > 1000 ? 16.rt(context) : 16.rm(context)),
                                                                      ),
                                                                      padding: EdgeInsets.symmetric(
                                                                        vertical: MediaQuery.sizeOf(context).height > 1000 ? 30.vpmt(context) : 30.vpmm(context),
                                                                        horizontal: MediaQuery.sizeOf(context).width > 500 ? 20.hpmt(context) : 20.hpmm(context),
                                                                      ),
                                                                      child: Column(
                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                                        children: [


                                                                          Container(
                                                                            height: MediaQuery.sizeOf(context).height > 1000 ? 64.ht(context) : 64.hm(context),
                                                                            width: MediaQuery.sizeOf(context).width > 500 ? 64.wt(context) : 64.wm(context),
                                                                            decoration: BoxDecoration(
                                                                                color: Colors.transparent
                                                                            ),
                                                                            child: FittedBox(
                                                                              fit: BoxFit.cover,
                                                                              child: Image.asset(
                                                                                ImagePathUtils.signUpScreenImagePath,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                          ),


                                                                          SpacerWidget.spacerWidget(spaceHeight: MediaQuery.sizeOf(context).height > 1000 ? 18.ht(context) : 18.hm(context)),


                                                                          Container(
                                                                            width: MediaQuery.sizeOf(context).width > 500  ? 428.wt(context) : 358.wm(context),
                                                                            alignment: Alignment.center,
                                                                            child: Text(
                                                                              "Your account has been created successfully!".tr,
                                                                              textAlign: TextAlign.center,
                                                                              style: GoogleFonts.tajawal(
                                                                                fontWeight: FontWeight.w700,
                                                                                fontStyle: FontStyle.normal,
                                                                                fontSize: MediaQuery.sizeOf(context).height > 1000 ? 18.spt(context) : 18.spm(context),
                                                                                color: ColorUtils.black33,
                                                                                height: MediaQuery.sizeOf(context).height > 1000 ? (35.ht(context) / 18.spt(context)) : (35.hm(context) / 18.spm(context)),
                                                                              ),
                                                                            ),
                                                                          ),

                                                                          Container(
                                                                            width: MediaQuery.sizeOf(context).width > 500  ? 428.wt(context) : 358.wm(context),
                                                                            alignment: Alignment.center,
                                                                            child: Text(
                                                                              "You can now log in and start ordering your favorite meals with ease.".tr,
                                                                              textAlign: TextAlign.center,
                                                                              style: GoogleFonts.tajawal(
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FontStyle.normal,
                                                                                fontSize: MediaQuery.sizeOf(context).height > 1000 ? 18.spt(context) : 16.spm(context),
                                                                                color: ColorUtils.black33,
                                                                                height: MediaQuery.sizeOf(context).height > 1000 ? (35.ht(context) / 18.spt(context)) : (35.hm(context) / 16.spm(context)),
                                                                              ),
                                                                            ),
                                                                          ),

                                                                        ],
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                              Future.delayed(Duration(seconds: 2),() async {
                                                                Get.back();
                                                                Get.off(()=>LoginScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                                                              });
                                                            },
                                                            onFail: (e) {
                                                              isOtpSubmit.value = false;
                                                              CustomSnackBar().errorCustomSnackBar(context: context, message: e);
                                                            },
                                                            onExceptionFail: (e) {
                                                              isOtpSubmit.value = false;
                                                              CustomSnackBar().errorCustomSnackBar(context: context, message: e);
                                                            },
                                                          );
                                                        }
                                                      });
                                                    }
                                                  },
                                                  child: Center(
                                                    child: Text(
                                                      "Verify Otp".tr,
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
                                              ) :
                                              Container(
                                                height: 48.hm(context),
                                                width: 300.wm(context),
                                                decoration: BoxDecoration(
                                                  color: Colors.transparent,
                                                ),
                                                child: Center(child: CircularProgressIndicator(),),
                                              ),

                                              SpacerWidget.spacerWidget(spaceHeight: 18.hm(context)),


                                              Container(
                                                width: 358.wm(context),
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "Didn't receive the code?".tr,
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.tajawal(
                                                    fontWeight: FontWeight.w700,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 14.spm(context),
                                                    color: ColorUtils.black33,
                                                    height: (25.hm(context) / 14.spm(context)),
                                                  ),
                                                ),
                                              ),


                                              timeCounter.value == 0 ?
                                              Container(
                                                height: 20.hm(context),
                                                width: 358.wm(context),
                                                alignment: Alignment.center,
                                                child: isResendOtp.value == false ?
                                                TextButton(
                                                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                                  onPressed: () async {
                                                    await SignUpController.checkLocalCreateAccountResponse().then((value) async {
                                                      if(value?.data != null) {
                                                        isResendOtp.value = true;
                                                        Map<String,dynamic> data = {
                                                          "email": value?.data?.user?.email,
                                                        };
                                                        print(data);
                                                        await SignUpController.getResendOtpResponse(
                                                          data: data,
                                                          onSuccess: (e) async {
                                                            timeCounter.value = 60;
                                                            otp1.value.clear();
                                                            otp2.value.clear();
                                                            otp3.value.clear();
                                                            otp4.value.clear();
                                                            otp5.value.clear();
                                                            otp6.value.clear();
                                                            await otpTimer();
                                                            isResendOtp.value = false;
                                                            CustomSnackBar().successCustomSnackBar(context: context, message: e);
                                                          },
                                                          onFail: (e) {
                                                            isResendOtp.value = false;
                                                            CustomSnackBar().errorCustomSnackBar(context: context, message: e);
                                                          },
                                                          onExceptionFail: (e) {
                                                            isResendOtp.value = false;
                                                            CustomSnackBar().errorCustomSnackBar(context: context, message: e);
                                                          },
                                                        );
                                                      }
                                                    });
                                                  },
                                                  child: Text(
                                                    "Resend Otp".tr,
                                                    textAlign: TextAlign.center,
                                                    style: GoogleFonts.tajawal(
                                                      fontWeight: FontWeight.w500,
                                                      fontStyle: FontStyle.normal,
                                                      fontSize: 14.spm(context),
                                                      color: ColorUtils.blue192,
                                                      height: (25.hm(context) / 14.spm(context)),
                                                    ),
                                                  ),
                                                ) :
                                                Center(
                                                  child: CircularProgressIndicator(),
                                                ),
                                              ) :
                                              Container(
                                                width: 358.wm(context),
                                                alignment: Alignment.center,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "Resend after".tr,
                                                      textAlign: TextAlign.center,
                                                      style: GoogleFonts.tajawal(
                                                        fontWeight: FontWeight.w500,
                                                        fontStyle: FontStyle.normal,
                                                        fontSize: 14.spm(context),
                                                        color: ColorUtils.black33,
                                                        height: (25.hm(context) / 14.spm(context)),
                                                      ),
                                                    ),
                                                    Text(
                                                      "(${timeCounter.value}s)",
                                                      textAlign: TextAlign.center,
                                                      style: GoogleFonts.tajawal(
                                                        fontWeight: FontWeight.w500,
                                                        fontStyle: FontStyle.normal,
                                                        fontSize: 14.spm(context),
                                                        color: ColorUtils.black33,
                                                        height: (25.hm(context) / 14.spm(context)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),

                                            ],
                                          ),
                                        ),
                                      ),
                                    ));
                                  },
                                );
                              },
                              onFail: (e) {
                                isSubmit.value = false;
                                CustomSnackBar().errorCustomSnackBar(context: context, message: e);
                              },
                              onExceptionFail: (e) {
                                isSubmit.value = false;
                                CustomSnackBar().errorCustomSnackBar(context: context, message: e);
                              },
                            );
                          }
                        },
                        child: Center(
                          child: Text(
                            "Create account".tr,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.tajawal(
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              fontSize: MediaQuery.sizeOf(context).height > 1000 ? 18.spt(context) : 18.spm(context),
                              color: ColorUtils.white255,
                            ),
                          ),
                        ),
                      ),
                    ),

                    SpacerWidget.spacerWidget(spaceHeight: MediaQuery.sizeOf(context).height > 1000 ? 28.ht(context) : 28.hm(context)),


                    Container(
                      width: MediaQuery.sizeOf(context).width > 500 ? 468.wt(context) : 358.wm(context),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: "Already have an account? ".tr,
                          style: GoogleFonts.tajawal(
                            fontStyle: FontStyle.normal,
                            fontSize: MediaQuery.sizeOf(context).height > 1000 ? 14.spt(context) : 14.spm(context),
                            color: ColorUtils.black255,
                            fontWeight: FontWeight.w500,
                          ),
                          children: [
                            TextSpan(
                              text: "Login ".tr,
                              style: GoogleFonts.tajawal(
                                fontStyle: FontStyle.normal,
                                fontSize: MediaQuery.sizeOf(context).height > 1000 ? 14.spt(context) : 14.spm(context),
                                color: ColorUtils.black51,
                                fontWeight: FontWeight.w500,
                              ),
                              recognizer: TapGestureRecognizer()..onTap = () {
                                Get.off(()=>LoginScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                              },
                            ),
                          ],
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