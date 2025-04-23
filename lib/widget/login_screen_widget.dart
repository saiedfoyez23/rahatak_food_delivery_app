import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rahatak_food_delivery_app/screen/screen.dart';
import 'package:rahatak_food_delivery_app/utils/utils.dart';

class LoginScreenWidget extends GetxController {

  Rx<TextEditingController> emailPhoneController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  RxBool obscureText = true.obs;
  RxBool isCheckIn = false.obs;

  Widget loginScreenWidget({required BuildContext context}) {
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
                padding:  EdgeInsets.symmetric(
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


                    SpacerWidget.spacerWidget(
                      spaceHeight: MediaQuery.sizeOf(context).height > 1000 ? 281.ht(context) : 139.hm(context),
                    ),

                    Container(
                      width: MediaQuery.sizeOf(context).width > 500 ? 468.wt(context) : 358.wm(context),
                      alignment: Alignment.center,
                      child: Text(
                        "Welcome to Rahtak!".tr,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: MediaQuery.sizeOf(context).height > 1000 ? 24.spt(context) : 24.spm(context),
                          color: ColorUtils.black33,
                        ),
                      ),
                    ),

                    SpacerWidget.spacerWidget(
                      spaceHeight: MediaQuery.sizeOf(context).height > 1000 ? 32.ht(context) : 32.hm(context),
                    ),

                    Container(
                      width: MediaQuery.sizeOf(context).width > 500 ? 468.wt(context) : 358.wm(context),
                      alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                      child: Text(
                        "Email/Phone Number".tr,
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
                      controller: emailPhoneController.value,
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
                        hintText: "moha.ali@gmail.com".tr,
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

                    SpacerWidget.spacerWidget(spaceHeight: MediaQuery.sizeOf(context).height > 1000 ? 20.ht(context) : 24.hm(context)),

                    Container(
                      width: MediaQuery.sizeOf(context).width > 500 ? 468.wt(context) : 358.wm(context),
                      alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                      child: Text(
                        "Password".tr,
                        textAlign: Get.locale.toString() == "en" ?  TextAlign.start : TextAlign.end,
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


                    SpacerWidget.spacerWidget(spaceHeight: MediaQuery.sizeOf(context).height > 1000 ? 13.ht(context) : 13.hm(context)),


                    Container(
                      width: MediaQuery.sizeOf(context).width > 500 ? 468.wt(context) : 358.wm(context),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Container(
                            height: MediaQuery.sizeOf(context).height > 1000 ? 25.ht(context) : 25.hm(context),
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

                                  Text(
                                    "Remember me".tr,
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.tajawal(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                      fontSize: MediaQuery.sizeOf(context).height > 1000 ? 14.spt(context) : 14.spm(context),
                                      color: ColorUtils.black33,
                                    ),
                                  ),


                                ],
                              ),
                            ),
                          ),



                          Container(
                            alignment: Alignment.center,
                            height: MediaQuery.sizeOf(context).height > 1000 ? 25.ht(context) : 25.hm(context),
                            child: TextButton(
                              style: TextButton.styleFrom(padding: EdgeInsets.zero),
                              onPressed: () async {
                                Get.off(()=>ForgotPasswordScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                              },
                              child: Text(
                                "Forgot your password?".tr,
                                textAlign: TextAlign.start,
                                style: GoogleFonts.tajawal(
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                  fontSize: MediaQuery.sizeOf(context).height > 1000 ? 14.spt(context) : 14.spm(context),
                                  color: ColorUtils.black33,
                                ),
                              ),
                            ),
                          ),


                        ],
                      ),
                    ),


                    SpacerWidget.spacerWidget(spaceHeight: MediaQuery.sizeOf(context).height > 1000 ? 32.ht(context) : 46.hm(context)),

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
                          Get.off(()=>HomeScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                        },
                        child: Center(
                          child: Text(
                            "Login".tr,
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


                    SpacerWidget.spacerWidget(spaceHeight: MediaQuery.sizeOf(context).height > 1000 ? 24.ht(context) : 46.hm(context)),


                    Container(
                      width: MediaQuery.sizeOf(context).width > 500 ? 468.wt(context) : 358.wm(context),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: "Don't have an account? ".tr,
                          style: GoogleFonts.tajawal(
                            fontStyle: FontStyle.normal,
                            fontSize: MediaQuery.sizeOf(context).height > 1000 ? 16.spt(context) : 14.spm(context),
                            color: ColorUtils.black51,
                            fontWeight: FontWeight.w500,
                          ),
                          children: [
                            TextSpan(
                              text: "Create a new account ".tr,
                              style: GoogleFonts.tajawal(
                                fontStyle: FontStyle.normal,
                                fontSize: MediaQuery.sizeOf(context).height > 1000 ? 16.spt(context) : 14.spm(context),
                                color: ColorUtils.black255,
                                fontWeight: FontWeight.w500,
                              ),
                              recognizer: TapGestureRecognizer()..onTap = () {
                                Get.off(()=>RegistrationScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),

                    SpacerWidget.spacerWidget(spaceHeight: MediaQuery.sizeOf(context).height > 1000 ? 24.ht(context) : 24.hm(context)),


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