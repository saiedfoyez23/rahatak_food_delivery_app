import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rahatak_food_delivery_app/utils/utils.dart';

import '../controller/controller.dart';
import '../screen/screen.dart';

class ChangePasswordScreenWidget extends GetxController {

  RxBool isSubmit = false.obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  RxBool obscureText = true.obs;
  Rx<TextEditingController> currentPasswordController = TextEditingController().obs;
  RxBool currentObscureText = true.obs;
  Rx<TextEditingController> confirmPasswordController = TextEditingController().obs;
  RxBool confirmObscureText = true.obs;

  Widget changePasswordScreenWidget({required BuildContext context}) {
    // if(MediaQuery.sizeOf(context).height > 1000) {
    //   return Obx(()=>SafeArea(
    //     child: Container(
    //       height: 1133.ht(context),
    //       width: 744.wt(context),
    //       decoration: BoxDecoration(
    //         color: ColorUtils.white248,
    //       ),
    //       child: CustomScrollView(
    //         slivers: [
    //
    //           SliverToBoxAdapter(
    //             child: Column(
    //               children: [
    //
    //
    //                 Padding(
    //                   padding: EdgeInsets.symmetric(horizontal: 37.hpmt(context)),
    //                   child: Column(
    //                     children: [
    //
    //                       SpacerWidget.spacerWidget(spaceHeight: 11.ht(context)),
    //
    //                       Directionality(
    //                         textDirection: TextDirection.ltr,
    //                         child: Row(
    //                           mainAxisAlignment: MainAxisAlignment.start,
    //                           children: [
    //
    //                             Container(
    //                               height: 40.ht(context),
    //                               width: 40.wt(context),
    //                               decoration: BoxDecoration(
    //                                 color: Colors.transparent,
    //                               ),
    //                               child: TextButton(
    //                                 style: TextButton.styleFrom(padding: EdgeInsets.zero),
    //                                 onPressed: () {
    //                                   Get.off(()=>ProfileScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
    //                                 },
    //                                 child: FittedBox(
    //                                   fit: BoxFit.cover,
    //                                   child: Image.asset(
    //                                     ImagePathUtils.authorizationBackButtonImagePath,
    //                                     fit: BoxFit.cover,
    //                                     alignment: Alignment.center,
    //                                   ),
    //                                 ),
    //                               ),
    //                             ),
    //
    //
    //                             Expanded(
    //                               child: Container(
    //                                 alignment: Alignment.center,
    //                                 child: Text(
    //                                   "Change Password".tr,
    //                                   textAlign: TextAlign.center,
    //                                   style: GoogleFonts.tajawal(
    //                                     fontWeight: FontWeight.w700,
    //                                     fontStyle: FontStyle.normal,
    //                                     fontSize: 16.spt(context),
    //                                     color: ColorUtils.black255,
    //                                   ),
    //                                 ),
    //                               ),
    //                             ),
    //
    //                           ],
    //                         ),
    //                       ),
    //
    //
    //                       SpacerWidget.spacerWidget(spaceHeight: 35.ht(context)),
    //
    //                     ],
    //                   ),
    //                 ),
    //
    //
    //                 Padding(
    //                   padding: EdgeInsets.symmetric(horizontal: 138.hpmt(context)),
    //                   child: Column(
    //                     children: [
    //                       Container(
    //                         width: 468.wt(context),
    //                         alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
    //                         child: Text(
    //                           "Current Password".tr,
    //                           textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
    //                           style: GoogleFonts.tajawal(
    //                             fontWeight: FontWeight.w700,
    //                             fontStyle: FontStyle.normal,
    //                             fontSize: 16.spt(context),
    //                             color: ColorUtils.black33,
    //                           ),
    //                         ),
    //                       ),
    //
    //                       SpacerWidget.spacerWidget(spaceHeight: 12.ht(context)),
    //
    //                       TextFormField(
    //                         controller: currentPasswordController.value,
    //                         textAlign: TextAlign.start,
    //                         cursorColor: ColorUtils.blue192,
    //                         style: currentObscureText.value == true ?
    //                         GoogleFonts.openSans(
    //                           fontSize: 16.spt(context),
    //                           fontStyle: FontStyle.normal,
    //                           color: ColorUtils.black51,
    //                           fontWeight: FontWeight.w400,
    //                         ) :
    //                         GoogleFonts.tajawal(
    //                           fontSize: 16.spt(context),
    //                           fontStyle: FontStyle.normal,
    //                           color: ColorUtils.black51,
    //                           fontWeight: FontWeight.w400,
    //                         ),
    //                         cursorHeight: 20.ht(context),
    //                         obscureText: currentObscureText.value,
    //                         textAlignVertical: TextAlignVertical.center,
    //                         obscuringCharacter: "*",
    //                         decoration: InputDecoration(
    //                           alignLabelWithHint: true,
    //                           hintText: "********",
    //                           hintStyle: GoogleFonts.openSans(
    //                             fontSize: 16.spt(context),
    //                             fontWeight: FontWeight.w400,
    //                             fontStyle: FontStyle.normal,
    //                             color: ColorUtils.gray136,
    //                           ),
    //                           filled: true,
    //                           suffixIcon: Container(
    //                             height: 24.ht(context),
    //                             width: 24.wt(context),
    //                             padding: EdgeInsets.symmetric(
    //                               horizontal: 12.hpmt(context),
    //                               vertical: 12.vpmt(context),
    //                             ),
    //                             decoration: BoxDecoration(
    //                                 color: Colors.transparent
    //                             ),
    //                             child: TextButton(
    //                               style: TextButton.styleFrom(padding: EdgeInsets.zero),
    //                               onPressed: () {
    //                                 if(currentObscureText.value == true) {
    //                                   currentObscureText.value = false;
    //                                 } else {
    //                                   currentObscureText.value = true;
    //                                 }
    //                               },
    //                               child: FittedBox(
    //                                 fit: BoxFit.cover,
    //                                 child: Image.asset(
    //                                   currentObscureText.value == true ?
    //                                   ImagePathUtils.visibilityOffFocusIconImagePath :
    //                                   ImagePathUtils.visibilityFocusIconImagePath,
    //                                   fit: BoxFit.cover,
    //                                   alignment: Alignment.center,
    //                                 ),
    //                               ),
    //                             ),
    //                           ),
    //                           fillColor: ColorUtils.white255,
    //                           contentPadding: EdgeInsets.symmetric(
    //                             horizontal: 12.hpmt(context),
    //                             vertical: 12.vpmt(context),
    //                           ),
    //                           constraints: BoxConstraints(
    //                             maxHeight: 48.ht(context),
    //                           ),
    //                           border:  OutlineInputBorder(
    //                             borderRadius: BorderRadius.circular(8.rt(context)),
    //                             borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
    //                           ),
    //                           enabledBorder: OutlineInputBorder(
    //                             borderRadius: BorderRadius.circular(8.rt(context)),
    //                             borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
    //                           ),
    //                           focusedBorder: OutlineInputBorder(
    //                             borderRadius: BorderRadius.circular(8.rt(context)),
    //                             borderSide: BorderSide(color: ColorUtils.blue192,width: 1),
    //                           ),
    //
    //                         ),
    //                       ),
    //
    //
    //                       SpacerWidget.spacerWidget(spaceHeight: 24.ht(context)),
    //
    //
    //
    //                       Container(
    //                         width: 468.wt(context),
    //                         alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
    //                         child: Text(
    //                           "New Password".tr,
    //                           textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
    //                           style: GoogleFonts.tajawal(
    //                             fontWeight: FontWeight.w700,
    //                             fontStyle: FontStyle.normal,
    //                             fontSize: 16.spt(context),
    //                             color: ColorUtils.black33,
    //                           ),
    //                         ),
    //                       ),
    //
    //                       SpacerWidget.spacerWidget(spaceHeight: 12.ht(context)),
    //
    //                       TextFormField(
    //                         controller: passwordController.value,
    //                         textAlign: TextAlign.start,
    //                         cursorColor: ColorUtils.blue192,
    //                         style: obscureText.value == true ?
    //                         GoogleFonts.openSans(
    //                           fontSize: 16.spt(context),
    //                           fontStyle: FontStyle.normal,
    //                           color: ColorUtils.black51,
    //                           fontWeight: FontWeight.w400,
    //                         ) :
    //                         GoogleFonts.tajawal(
    //                           fontSize: 16.spt(context),
    //                           fontStyle: FontStyle.normal,
    //                           color: ColorUtils.black51,
    //                           fontWeight: FontWeight.w400,
    //                         ),
    //                         cursorHeight: 20.ht(context),
    //                         obscureText: obscureText.value,
    //                         textAlignVertical: TextAlignVertical.center,
    //                         obscuringCharacter: "*",
    //                         decoration: InputDecoration(
    //                           alignLabelWithHint: true,
    //                           hintText: "********",
    //                           hintStyle: GoogleFonts.openSans(
    //                             fontSize: 16.spt(context),
    //                             fontWeight: FontWeight.w400,
    //                             fontStyle: FontStyle.normal,
    //                             color: ColorUtils.gray136,
    //                           ),
    //                           filled: true,
    //                           suffixIcon: Container(
    //                             height: 24.ht(context),
    //                             width: 24.wt(context),
    //                             padding: EdgeInsets.symmetric(
    //                               horizontal: 12.hpmt(context),
    //                               vertical: 12.vpmt(context),
    //                             ),
    //                             decoration: BoxDecoration(
    //                                 color: Colors.transparent
    //                             ),
    //                             child: TextButton(
    //                               style: TextButton.styleFrom(padding: EdgeInsets.zero),
    //                               onPressed: () {
    //                                 if(obscureText.value == true) {
    //                                   obscureText.value = false;
    //                                 } else {
    //                                   obscureText.value = true;
    //                                 }
    //                               },
    //                               child: FittedBox(
    //                                 fit: BoxFit.cover,
    //                                 child: Image.asset(
    //                                   obscureText.value == true ?
    //                                   ImagePathUtils.visibilityOffFocusIconImagePath :
    //                                   ImagePathUtils.visibilityFocusIconImagePath,
    //                                   fit: BoxFit.cover,
    //                                   alignment: Alignment.center,
    //                                 ),
    //                               ),
    //                             ),
    //                           ),
    //                           fillColor: ColorUtils.white255,
    //                           contentPadding: EdgeInsets.symmetric(
    //                             horizontal: 12.hpmt(context),
    //                             vertical: 12.vpmt(context),
    //                           ),
    //                           constraints: BoxConstraints(
    //                             maxHeight: 48.ht(context),
    //                           ),
    //                           border:  OutlineInputBorder(
    //                             borderRadius: BorderRadius.circular(8.rt(context)),
    //                             borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
    //                           ),
    //                           enabledBorder: OutlineInputBorder(
    //                             borderRadius: BorderRadius.circular(8.rt(context)),
    //                             borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
    //                           ),
    //                           focusedBorder: OutlineInputBorder(
    //                             borderRadius: BorderRadius.circular(8.rt(context)),
    //                             borderSide: BorderSide(color: ColorUtils.blue192,width: 1),
    //                           ),
    //
    //                         ),
    //                       ),
    //
    //
    //                       SpacerWidget.spacerWidget(spaceHeight: 24.ht(context)),
    //
    //
    //                       Container(
    //                         width: 468.wt(context),
    //                         alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
    //                         child: Text(
    //                           "Confirm Password".tr,
    //                           textAlign:  Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
    //                           style: GoogleFonts.tajawal(
    //                             fontWeight: FontWeight.w700,
    //                             fontStyle: FontStyle.normal,
    //                             fontSize: 16.spt(context),
    //                             color: ColorUtils.black33,
    //                           ),
    //                         ),
    //                       ),
    //
    //                       SpacerWidget.spacerWidget(spaceHeight: 12.ht(context)),
    //
    //
    //                       TextFormField(
    //                         controller: confirmPasswordController.value,
    //                         textAlign: TextAlign.start,
    //                         cursorColor: ColorUtils.blue192,
    //                         style: confirmObscureText.value == true ?
    //                         GoogleFonts.openSans(
    //                           fontSize: 16.spt(context),
    //                           fontStyle: FontStyle.normal,
    //                           color: ColorUtils.black51,
    //                           fontWeight: FontWeight.w400,
    //                         ) :
    //                         GoogleFonts.tajawal(
    //                           fontSize: 16.spt(context),
    //                           fontStyle: FontStyle.normal,
    //                           color: ColorUtils.black51,
    //                           fontWeight: FontWeight.w400,
    //                         ),
    //                         cursorHeight: 20.ht(context),
    //                         obscureText: confirmObscureText.value,
    //                         textAlignVertical: TextAlignVertical.center,
    //                         obscuringCharacter: "*",
    //                         decoration: InputDecoration(
    //                           alignLabelWithHint: true,
    //                           hintText: "********",
    //                           hintStyle: GoogleFonts.openSans(
    //                             fontSize: 16.spt(context),
    //                             fontWeight: FontWeight.w400,
    //                             fontStyle: FontStyle.normal,
    //                             color: ColorUtils.gray136,
    //                           ),
    //                           filled: true,
    //                           suffixIcon: Container(
    //                             height: 24.ht(context),
    //                             width: 24.wt(context),
    //                             padding: EdgeInsets.symmetric(
    //                               horizontal: 12.hpmt(context),
    //                               vertical: 12.vpmt(context),
    //                             ),
    //                             decoration: BoxDecoration(
    //                                 color: Colors.transparent
    //                             ),
    //                             child: TextButton(
    //                               style: TextButton.styleFrom(padding: EdgeInsets.zero),
    //                               onPressed: () {
    //                                 if(confirmObscureText.value == true) {
    //                                   confirmObscureText.value = false;
    //                                 } else {
    //                                   confirmObscureText.value = true;
    //                                 }
    //                               },
    //                               child: FittedBox(
    //                                 fit: BoxFit.cover,
    //                                 child: Image.asset(
    //                                   confirmObscureText.value == true ?
    //                                   ImagePathUtils.visibilityOffFocusIconImagePath :
    //                                   ImagePathUtils.visibilityFocusIconImagePath,
    //                                   fit: BoxFit.cover,
    //                                   alignment: Alignment.center,
    //                                 ),
    //                               ),
    //                             ),
    //                           ),
    //                           fillColor: ColorUtils.white255,
    //                           contentPadding: EdgeInsets.symmetric(
    //                             horizontal: 12.hpmt(context),
    //                             vertical: 12.vpmt(context),
    //                           ),
    //                           constraints: BoxConstraints(
    //                             maxHeight: 48.hm(context),
    //                           ),
    //                           border:  OutlineInputBorder(
    //                             borderRadius: BorderRadius.circular(8.rt(context)),
    //                             borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
    //                           ),
    //                           enabledBorder: OutlineInputBorder(
    //                             borderRadius: BorderRadius.circular(8.rt(context)),
    //                             borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
    //                           ),
    //                           focusedBorder: OutlineInputBorder(
    //                             borderRadius: BorderRadius.circular(8.rt(context)),
    //                             borderSide: BorderSide(color: ColorUtils.blue192,width: 1),
    //                           ),
    //
    //                         ),
    //                       ),
    //
    //
    //
    //                       SpacerWidget.spacerWidget(spaceHeight: 36.ht(context)),
    //
    //                       isSubmit.value == false ?
    //                       Container(
    //                         height: 52.ht(context),
    //                         width: 300.wt(context),
    //                         decoration: BoxDecoration(
    //                           color: ColorUtils.blue192,
    //                           borderRadius: BorderRadius.circular(8.rt(context)),
    //                         ),
    //                         child: TextButton(
    //                           style: TextButton.styleFrom(padding: EdgeInsets.zero),
    //                           onPressed: () async {
    //                             if(currentPasswordController.value.text == "") {
    //                               CustomSnackBar().errorCustomSnackBar(context: context, message: "Please enter the old password");
    //                             } else if(passwordController.value.text == "") {
    //                               CustomSnackBar().errorCustomSnackBar(context: context, message: "Please enter the password");
    //                             } else if(confirmPasswordController.value.text == "") {
    //                               CustomSnackBar().errorCustomSnackBar(context: context, message: "Please enter the confirm password");
    //                             } else if(passwordController.value.text != confirmPasswordController.value.text) {
    //                               CustomSnackBar().errorCustomSnackBar(context: context, message: "Password is not match");
    //                             } else {
    //                               isSubmit.value = true;
    //                               Map<String,dynamic> data = {
    //                                 "oldPassword": currentPasswordController.value.text,
    //                                 "newPassword": passwordController.value.text,
    //                               };
    //                               print(data);
    //                               await ForgotPasswordController.getChangePasswordResponse(
    //                                 data: data,
    //                                 onSuccess: (e) async {
    //                                   isSubmit.value = false;
    //                                   CustomSnackBar().successCustomSnackBar(context: context, message: e);
    //                                   await AppLocalStorageController.getSharedPreferencesRemove(key: "Login");
    //                                   Get.off(()=>LoginScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
    //                                 },
    //                                 onFail: (e) {
    //                                   isSubmit.value = false;
    //                                   CustomSnackBar().errorCustomSnackBar(context: context, message: e);
    //                                 },
    //                                 onExceptionFail: (e) {
    //                                   isSubmit.value = false;
    //                                   CustomSnackBar().errorCustomSnackBar(context: context, message: e);
    //                                 },
    //                               );
    //                             }
    //                           },
    //                           child: Center(
    //                             child: Text(
    //                               "Save Password".tr,
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
    //                       ) :
    //                       Container(
    //                         height: 52.ht(context),
    //                         width: 300.wt(context),
    //                         decoration: BoxDecoration(
    //                           color: Colors.transparent
    //                         ),
    //                       ),
    //
    //                       SpacerWidget.spacerWidget(spaceHeight: 36.ht(context)),
    //
    //                     ],
    //                   ),
    //                 )
    //
    //
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
                                "Change Password".tr,
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
                      width: 358.wm(context),
                      alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                      child: Text(
                        "Current Password".tr,
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
                      controller: currentPasswordController.value,
                      textAlign: TextAlign.start,
                      cursorColor: ColorUtils.blue192,
                      style: currentObscureText.value == true ?
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
                      obscureText: currentObscureText.value,
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
                              if(currentObscureText.value == true) {
                                currentObscureText.value = false;
                              } else {
                                currentObscureText.value = true;
                              }
                            },
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: Image.asset(
                                currentObscureText.value == true ?
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


                    isSubmit.value == false ?
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
                          if(currentPasswordController.value.text == "") {
                            CustomSnackBar().errorCustomSnackBar(context: context, message: "Please enter the old password");
                          } else if(passwordController.value.text == "") {
                            CustomSnackBar().errorCustomSnackBar(context: context, message: "Please enter the password");
                          } else if(confirmPasswordController.value.text == "") {
                            CustomSnackBar().errorCustomSnackBar(context: context, message: "Please enter the confirm password");
                          } else if(passwordController.value.text != confirmPasswordController.value.text) {
                            CustomSnackBar().errorCustomSnackBar(context: context, message: "Password is not match");
                          } else {
                            isSubmit.value = true;
                            Map<String,dynamic> data = {
                              "oldPassword": currentPasswordController.value.text,
                              "newPassword": passwordController.value.text,
                            };
                            print(data);
                            await ForgotPasswordController.getChangePasswordResponse(
                              data: data,
                              onSuccess: (e) async {
                                isSubmit.value = false;
                                CustomSnackBar().successCustomSnackBar(context: context, message: e);
                                await AppLocalStorageController.getSharedPreferencesRemove(key: "Login");
                                Get.off(()=>LoginScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                              },
                              onFail: (e) async {
                                isSubmit.value = false;
                                CustomSnackBar().errorCustomSnackBar(context: context, message: e);
                              },
                              onExceptionFail: (e) async {
                                isSubmit.value = false;
                                if(e == "jwt expired") {
                                  await AppLocalStorageController.getSharedPreferencesRemove(key: "Login");
                                  Get.off(()=>LoginScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                                  // LoginController.getAccessTokenResponse(
                                  //   onSuccess: (e) async {
                                  //     isLoading.value = false;
                                  //     Get.off(()=>ProfileScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                                  //   },
                                  //   onFail: (e) async {
                                  //     isLoading.value = false;
                                  //     CustomSnackBar().errorCustomSnackBar(context: context, message: e);
                                  //   },
                                  //   onExceptionFail: (e) async {
                                  //     isLoading.value = false;
                                  //     CustomSnackBar().errorCustomSnackBar(context: context, message: e);
                                  //   },
                                  // );
                                }
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
                    ) : Container(
                      height: 48.hm(context),
                      width: 300.wm(context),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: Center(child: CircularProgressIndicator(),),
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