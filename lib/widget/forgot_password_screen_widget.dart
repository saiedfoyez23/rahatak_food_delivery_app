import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rahatak_food_delivery_app/utils/utils.dart';

import '../controller/controller.dart';
import '../screen/screen.dart';

class ForgotPasswordScreenWidget extends GetxController {

  Rx<TextEditingController> emailPhoneController = TextEditingController().obs;

  Rx<TextEditingController> otp1 = TextEditingController().obs;
  Rx<TextEditingController> otp2 = TextEditingController().obs;
  Rx<TextEditingController> otp3 = TextEditingController().obs;
  Rx<TextEditingController> otp4 = TextEditingController().obs;
  Rx<TextEditingController> otp5 = TextEditingController().obs;
  Rx<TextEditingController> otp6 = TextEditingController().obs;


  RxBool onSubmit = false.obs;
  RxBool isResendOtp = false.obs;
  RxBool isOtpSubmit = false.obs;
  RxInt timeCounter = 60.obs;


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


  Widget forgotPasswordScreenWidget({required BuildContext context}) {
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
      
      
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          Container(
                            height: 40.hm(context),
                            width: 40.wm(context),
                            decoration: BoxDecoration(
                                color: Colors.transparent
                            ),
                            child: TextButton(
                              style: TextButton.styleFrom(padding: EdgeInsets.zero),
                              onPressed: () {
                                Get.delete<ForgotPasswordScreenWidget>(force: true);
                                Get.off(()=>LoginScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
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
                        ],
                      ),
                    ),


                    SpacerWidget.spacerWidget(spaceHeight: 200.hm(context)),


                    Container(
                      width: 358.wm(context),
                      alignment: Alignment.center,
                      child: Text(
                        "Forgot your password?".tr,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: 24.spm(context),
                          color: ColorUtils.black33,
                        ),
                      ),
                    ),

                    SpacerWidget.spacerWidget(spaceHeight: 16.hm(context)),

                    Container(
                      width: 358.wm(context),
                      alignment: Alignment.center,
                      child: Text(
                        "Enter your registered email address, and we will send you a link to reset your password.".tr,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          fontSize: 16.spm(context),
                          color: ColorUtils.black33,
                          height: (30.hm(context) / 16.spm(context))
                        ),
                      ),
                    ),


                    SpacerWidget.spacerWidget(spaceHeight: 32.hm(context)),



                    TextFormField(
                      controller: emailPhoneController.value,
                      textAlign: TextAlign.start,
                      cursorColor: ColorUtils.blue192,
                      cursorHeight: 20.hm(context),
                      style: GoogleFonts.tajawal(
                        fontSize: 16.spm(context),
                        fontStyle: FontStyle.normal,
                        color: ColorUtils.black51,
                        fontWeight: FontWeight.w400,
                        height: 1.0,
                      ),
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        hintText: "Enter your email".tr,
                        hintStyle: GoogleFonts.tajawal(
                          fontSize: 16.spm(context),
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          color: ColorUtils.gray136,
                          height: 1.0,
                        ),
                        filled: true,
                        fillColor: ColorUtils.white255,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 12.hpmm(context),
                          vertical: 12.vpmm(context),
                        ),
                        constraints: BoxConstraints(
                          maxWidth: 358.wm(context),
                          maxHeight: 48.hm(context),
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

                    SpacerWidget.spacerWidget(spaceHeight: 36.hm(context)),


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
                          if(emailPhoneController.value.text == "") {
                            CustomSnackBar().errorCustomSnackBar(context: context, message: "Please enter your email");
                          } else {
                            showAdaptiveDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) {
                                return Obx(()=>Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 230.vpmm(context),
                                    horizontal: 16.hpmm(context),
                                  ),
                                  child: Container(
                                    width: 358.wm(context),
                                    height: 314.hm(context),
                                    decoration: BoxDecoration(
                                      color: ColorUtils.white255,
                                      borderRadius: BorderRadius.circular(16.rm(context)),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      vertical: 30.vpmm(context),
                                      horizontal: 20.hpmm(context),
                                    ),
                                    child: Column(
                                      children: [


                                        Container(
                                          width: 358.wm(context),
                                          alignment: Alignment.center,
                                          child: Text(
                                            "A reset link has been sent!".tr,
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.tajawal(
                                              fontWeight: FontWeight.w700,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 18.spm(context),
                                              color: ColorUtils.black33,
                                              height: (35.hm(context) / 18.spm(context)),
                                            ),
                                          ),
                                        ),

                                        Container(
                                          width: 358.wt(context),
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Please check your email to create a new password.".tr,
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.tajawal(
                                              fontWeight: FontWeight.w500,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 16.spm(context),
                                              color: ColorUtils.black33,
                                              height: (35.hm(context) / 16.spm(context)),
                                            ),
                                          ),
                                        ),

                                        SpacerWidget.spacerWidget(spaceHeight: 18.hm(context)),


                                        onSubmit.value == false ?
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
                                              onSubmit.value = true;
                                              Map<String,dynamic> data = {
                                                "email": emailPhoneController.value.text,
                                              };
                                              await ForgotPasswordController.getForgotPasswordResponse(
                                                data: data,
                                                onSuccess: (e) async {
                                                  onSubmit.value = false;
                                                  timeCounter.value = 60;
                                                  otp1.value.clear();
                                                  otp2.value.clear();
                                                  otp3.value.clear();
                                                  otp4.value.clear();
                                                  otp5.value.clear();
                                                  otp6.value.clear();
                                                  await otpTimer();
                                                  CustomSnackBar().successCustomSnackBar(context: context, message: e);
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
                                                                    "We have sent a 6-digit verification code to your registered email. Please enter the code below to complete your reset password.".tr,
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
                                                                        isOtpSubmit.value = true;
                                                                        Map<String,dynamic> data = {
                                                                          "email": emailPhoneController.value.text,
                                                                          "otp": "${otp1.value.text}${otp2.value.text}${otp3.value.text}${otp4.value.text}${otp5.value.text}${otp6.value.text}",
                                                                          "verify_email": true
                                                                        };
                                                                        print(data);
                                                                        await ForgotPasswordController.getVerifyOtpResponse(
                                                                          data: data,
                                                                          onSuccess: (e) async {
                                                                            isOtpSubmit.value = false;
                                                                            CustomSnackBar().successCustomSnackBar(context: context, message: e);
                                                                            Get.back();
                                                                            Get.off(()=>CreatePasswordScreen(email: emailPhoneController.value.text,),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
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
                                                                      isResendOtp.value = true;
                                                                      Map<String,dynamic> data = {
                                                                        "email": emailPhoneController.value.text,
                                                                      };
                                                                      print(data);
                                                                      await ForgotPasswordController.getResendOtpResponse(
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
                                                onFail: (e) async {
                                                  onSubmit.value = false;
                                                  CustomSnackBar().errorCustomSnackBar(context: context, message: e);
                                                },
                                                onExceptionFail: (e) async {
                                                  onSubmit.value = false;
                                                  CustomSnackBar().errorCustomSnackBar(context: context, message: e);
                                                },
                                              );

                                            },
                                            child: Center(
                                              child: Text(
                                                "Reset password".tr,
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
                                          height: 48.hm(context),
                                          width: 300.wm(context),
                                          decoration: BoxDecoration(
                                            border: Border.all(color: ColorUtils.gray136,width: 1),
                                            color: ColorUtils.white255,
                                            borderRadius: BorderRadius.circular(8.rm(context)),
                                          ),
                                          child: TextButton(
                                            style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                            onPressed: () async {
                                              Get.back();
                                            },
                                            child: Center(
                                              child: Text(
                                                "Cancel".tr,
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



                                      ],
                                    ),
                                  ),
                                ));
                              },
                            );
                          }
                        },
                        child: Center(
                          child: Text(
                            "Send".tr,
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
    );
  }


}