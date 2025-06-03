import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rahatak_food_delivery_app/screen/screen.dart';
import 'package:rahatak_food_delivery_app/utils/utils.dart';

import '../controller/controller.dart';

class CreatePasswordScreenWidget extends GetxController {

  Rx<TextEditingController> passwordController = TextEditingController().obs;
  RxBool obscureText = true.obs;
  Rx<TextEditingController> confirmPasswordController = TextEditingController().obs;
  RxBool confirmObscureText = true.obs;
  RxBool isSubmit = false.obs;


  Widget createPasswordScreenWidget({required BuildContext context,required String email}) {
    return Obx(()=>SafeArea(
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
                              color: Colors.transparent,
                            ),
                            child: TextButton(
                              style: TextButton.styleFrom(padding: EdgeInsets.zero),
                              onPressed: () {
                                Get.off(()=>ForgotPasswordScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
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

                    SpacerWidget.spacerWidget(spaceHeight: 169.hm(context)),

                    Container(
                      width: 358.wm(context),
                      alignment: Alignment.center,
                      child: Text(
                        "Enter new password".tr,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: 24.spm(context),
                          color: ColorUtils.black33,
                        ),
                      ),
                    ),

                    SpacerWidget.spacerWidget(spaceHeight: 36.hm(context)),



                    Container(
                      width: 358.wm(context),
                      alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                      child: Text(
                        "New Password".tr,
                        textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: 16.spm(context),
                          color: ColorUtils.black33,
                        ),
                      ),
                    ),

                    SpacerWidget.spacerWidget(spaceHeight: 12.hm(context)),

                    TextFormField(
                      controller: passwordController.value,
                      textAlign: TextAlign.start,
                      cursorColor: ColorUtils.blue192,
                      style: obscureText.value == true ?
                      GoogleFonts.openSans(
                        fontSize: 16.spm(context),
                        fontStyle: FontStyle.normal,
                        color: ColorUtils.black51,
                        fontWeight: FontWeight.w400,
                      ) :
                      GoogleFonts.tajawal(
                        fontSize: 16.spm(context),
                        fontStyle: FontStyle.normal,
                        color: ColorUtils.black51,
                        fontWeight: FontWeight.w400,
                      ),
                      cursorHeight: 20.hm(context),
                      obscureText: obscureText.value,
                      textAlignVertical: TextAlignVertical.center,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        hintText: "********",
                        hintStyle: GoogleFonts.openSans(
                          fontSize: 16.spm(context),
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          color: ColorUtils.gray136,
                        ),
                        filled: true,
                        suffixIcon: Container(
                          height: 24.hm(context),
                          width: 24.wm(context),
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.hpmm(context),
                            vertical: 12.vpmm(context),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
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
                          horizontal: 12.hpmm(context),
                          vertical: 12.vpmm(context),
                        ),
                        constraints: BoxConstraints(
                          maxWidth: 358.wm(context),
                          maxHeight: 48.hm(context),
                        ),
                        border:  OutlineInputBorder(
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


                    SpacerWidget.spacerWidget(spaceHeight: 24.hm(context)),


                    Container(
                      width: 358.wm(context),
                      alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                      child: Text(
                        "Confirm Password".tr,
                        textAlign:  Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: 16.spm(context),
                          color: ColorUtils.black33,
                        ),
                      ),
                    ),

                    SpacerWidget.spacerWidget(spaceHeight: 12.hm(context)),


                    TextFormField(
                      controller: confirmPasswordController.value,
                      textAlign: TextAlign.start,
                      cursorColor: ColorUtils.blue192,
                      style: confirmObscureText.value == true ?
                      GoogleFonts.openSans(
                        fontSize: 16.spm(context),
                        fontStyle: FontStyle.normal,
                        color: ColorUtils.black51,
                        fontWeight: FontWeight.w400,
                      ) :
                      GoogleFonts.tajawal(
                        fontSize: 16.spm(context),
                        fontStyle: FontStyle.normal,
                        color: ColorUtils.black51,
                        fontWeight: FontWeight.w400,
                      ),
                      cursorHeight: 20.hm(context),
                      obscureText: confirmObscureText.value,
                      textAlignVertical: TextAlignVertical.center,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        hintText: "********",
                        hintStyle: GoogleFonts.openSans(
                          fontSize: 16.spm(context),
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          color: ColorUtils.gray136,
                        ),
                        filled: true,
                        suffixIcon: Container(
                          height: 24.hm(context),
                          width: 24.wm(context),
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.hpmm(context),
                            vertical: 12.vpmm(context),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.transparent
                          ),
                          child: TextButton(
                            style: TextButton.styleFrom(padding: EdgeInsets.zero),
                            onPressed: () {
                              if(confirmObscureText.value == true) {
                                confirmObscureText.value = false;
                              } else {
                                confirmObscureText.value = true;
                              }
                            },
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: Image.asset(
                                confirmObscureText.value == true ?
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
                          horizontal: 12.hpmm(context),
                          vertical: 12.vpmm(context),
                        ),
                        constraints: BoxConstraints(
                          maxWidth: 358.wm(context),
                          maxHeight: 48.hm(context),
                        ),
                        border:  OutlineInputBorder(
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


                      isSubmit.value == true ?  Container(
                        height: 48.hm(context),
                        width: 300.wm(context),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: Center(child: CircularProgressIndicator(),),
                      ) : Container(
                      height: 48.hm(context),
                      width: 300.wm(context),
                      decoration: BoxDecoration(
                        color: ColorUtils.blue192,
                        borderRadius: BorderRadius.circular(8.rm(context)),
                      ),
                      child: TextButton(
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        onPressed: () async {
                          if(passwordController.value.text == "") {
                            CustomSnackBar().errorCustomSnackBar(context: context, message: "Please enter the password");
                          } else if(confirmPasswordController.value.text == "") {
                            CustomSnackBar().errorCustomSnackBar(context: context, message: "Please enter the confirm password");
                          } else if(passwordController.value.text != confirmPasswordController.value.text) {
                            CustomSnackBar().errorCustomSnackBar(context: context, message: "Password is not match");
                          } else if(passwordController.value.text.toString().length < 8) {
                            CustomSnackBar().errorCustomSnackBar(context: context, message: "The password should be more than 8 characters");
                          } else {
                            isSubmit.value = true;
                            Map<String,dynamic> data = {
                              "email": email,
                              "password": passwordController.value.text,
                            };
                            print(data);
                            await ForgotPasswordController.getResetPasswordResponse(
                              data: data,
                              onSuccess: (e) async {
                                isSubmit.value = false;
                                CustomSnackBar().successCustomSnackBar(context: context, message: e);
                                showAdaptiveDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (context) {
                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: MediaQuery.sizeOf(context).height > 1000 ? 415.vpmt(context) : 272.vpmm(context),
                                        horizontal: MediaQuery.sizeOf(context).width > 500 ? 158.hpmt(context) : 16.hpmm(context),
                                      ),
                                      child: Container(
                                        width: MediaQuery.sizeOf(context).width > 500  ? 428.wt(context) : 358.wm(context),
                                        height: MediaQuery.sizeOf(context).height > 1000 ? 220.ht(context) : 248.hm(context),
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
                                                  ImagePathUtils.newPasswordScreenImagePath,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),


                                            SpacerWidget.spacerWidget(spaceHeight: MediaQuery.sizeOf(context).height > 1000 ? 18.ht(context) : 18.hm(context)),


                                            Container(
                                              width: MediaQuery.sizeOf(context).width > 500  ? 428.wt(context) : 358.wm(context),
                                              alignment: Alignment.center,
                                              child: Text(
                                                "Your password has been updated successfully!".tr,
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
                                                "You can now log in with your new password.".tr,
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.tajawal(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize:  MediaQuery.sizeOf(context).height > 1000 ? 18.spt(context) : 16.spm(context),
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
                            "Save Password".tr,
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

                    SpacerWidget.spacerWidget(spaceHeight: 36.hm(context)),


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