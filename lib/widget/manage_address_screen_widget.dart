import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rahatak_food_delivery_app/utils/utils.dart';

import '../controller/controller.dart';
import '../screen/screen.dart';

class ManageAddressScreenWidget extends GetxController {

  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<TextEditingController> phoneNumberController = TextEditingController().obs;
  Rx<TextEditingController> governorateController = TextEditingController().obs;
  Rx<TextEditingController> stateController = TextEditingController().obs;
  Rx<TextEditingController> cityController = TextEditingController().obs;


  BuildContext context;
  ManageAddressScreenWidget({required this.context});
  RxBool isSubmit = false.obs;
  RxBool isLoading = false.obs;
  RxString coverImage = "".obs;
  RxString userName = "".obs;

  RxString governorate = "".obs;

  RxList<String> locations = <String>[
    "Muscat",
    "Al Batinah",
    "Ad Dakhiliyah",
    "Musandam",
    //"Al Buraimi",
    "Sharkia",
    "Al Dhahirah",
    "Al Wusta",
    "Dhofar",
  ].obs;
  RxInt bigIndex_1 = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
      await ProfileController.getUserProfileResponse(
        onSuccess: (e) async {
          isLoading.value = false;
          await ProfileController.checkLocalProfileResponse().then((value) {
            print(value?.data?.image);
            if(value?.data != null) {
              coverImage.value = value?.data?.image ?? "";
              stateController.value.text = value?.data?.state ?? "";
              governorate.value = value?.data?.governorate?.first ?? "";
              governorateController.value.text = value?.data?.governorate?.first ?? "";
              cityController.value.text = value?.data?.city ?? "";
            }
          });
        },
        onFail: (e) async {
          isLoading.value = false;
          CustomSnackBar().errorCustomSnackBar(context: context, message: e);
        },
        onExceptionFail: (e) async {
          isLoading.value = false;
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
    });
  }



  Widget manageAddressScreenWidget({required BuildContext context}) {
    // if(MediaQuery.sizeOf(context).height > 1000) {
    //   return Obx(()=>SafeArea(
    //     child: Container(
    //       height: 1133.ht(context),
    //       width: 744.wt(context),
    //       decoration: BoxDecoration(
    //           color: ColorUtils.white248
    //       ),
    //       child: isLoading.value == false ? CustomScrollView(
    //         slivers: [
    //
    //
    //           SliverToBoxAdapter(
    //             child: Column(
    //               children: [
    //
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
    //                                   "Manage Address".tr,
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
    //                     ],
    //                   ),
    //                 ),
    //
    //
    //
    //
    //
    //                 SpacerWidget.spacerWidget(spaceHeight: 35.hm(context)),
    //
    //
    //                 Padding(
    //                   padding: EdgeInsets.symmetric(horizontal: 138.hpmt(context)),
    //                   child: Column(
    //                     children: [
    //
    //                       Container(
    //                         alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
    //                         child: Text(
    //                           "Governorate *".tr,
    //                           textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
    //                           style: GoogleFonts.tajawal(
    //                             fontWeight: FontWeight.w500,
    //                             fontStyle: FontStyle.normal,
    //                             fontSize: 16.spt(context),
    //                             color: ColorUtils.black255,
    //                           ),
    //                         ),
    //                       ),
    //
    //                       SpacerWidget.spacerWidget(spaceHeight: 12.ht(context),),
    //
    //
    //                       TextFormField(
    //                         controller: governorateController.value,
    //                         textAlign: TextAlign.start,
    //                         cursorColor: ColorUtils.blue192,
    //                         cursorHeight: 20.ht(context),
    //                         style: GoogleFonts.tajawal(
    //                           fontSize: 16.spt(context),
    //                           fontStyle: FontStyle.normal,
    //                           color: ColorUtils.black51,
    //                           fontWeight: FontWeight.w400,
    //                         ),
    //                         textAlignVertical: TextAlignVertical.center,
    //                         decoration: InputDecoration(
    //                           hintText: "Muscat".tr,
    //                           hintStyle: GoogleFonts.tajawal(
    //                             fontSize: 16.spt(context),
    //                             fontWeight: FontWeight.w400,
    //                             fontStyle: FontStyle.normal,
    //                             color: ColorUtils.gray136,
    //                           ),
    //                           filled: true,
    //                           enabled: false,
    //                           fillColor: ColorUtils.white233,
    //                           contentPadding: EdgeInsets.symmetric(
    //                             horizontal: 12.hpmt(context),
    //                             vertical: 12.vpmt(context),
    //                           ),
    //                           constraints: BoxConstraints(
    //                             maxWidth: 468.wt(context),
    //                             maxHeight: 48.ht(context),
    //                           ),
    //                           border: OutlineInputBorder(
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
    //                       SpacerWidget.spacerWidget(spaceHeight: 12.ht(context),),
    //
    //
    //                       Container(
    //                         alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
    //                         child: Text(
    //                           "State".tr,
    //                           textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
    //                           style: GoogleFonts.tajawal(
    //                             fontWeight: FontWeight.w500,
    //                             fontStyle: FontStyle.normal,
    //                             fontSize: 16.spt(context),
    //                             color: ColorUtils.black255,
    //                           ),
    //                         ),
    //                       ),
    //
    //                       SpacerWidget.spacerWidget(spaceHeight: 12.ht(context),),
    //
    //
    //                       TextFormField(
    //                         controller: stateController.value,
    //                         textAlign: TextAlign.start,
    //                         cursorColor: ColorUtils.blue192,
    //                         cursorHeight: 20.ht(context),
    //                         style: GoogleFonts.tajawal(
    //                           fontSize: 16.spt(context),
    //                           fontStyle: FontStyle.normal,
    //                           color: ColorUtils.black51,
    //                           fontWeight: FontWeight.w400,
    //                         ),
    //                         textAlignVertical: TextAlignVertical.center,
    //                         decoration: InputDecoration(
    //                           hintText: "Al Khoud".tr,
    //                           hintStyle: GoogleFonts.tajawal(
    //                             fontSize: 16.spt(context),
    //                             fontWeight: FontWeight.w400,
    //                             fontStyle: FontStyle.normal,
    //                             color: ColorUtils.gray136,
    //                           ),
    //                           filled: true,
    //                           enabled: false,
    //                           fillColor: ColorUtils.white233,
    //                           contentPadding: EdgeInsets.symmetric(
    //                             horizontal: 12.hpmt(context),
    //                             vertical: 12.vpmt(context),
    //                           ),
    //                           constraints: BoxConstraints(
    //                             maxWidth: 468.wt(context),
    //                             maxHeight: 48.ht(context),
    //                           ),
    //                           border: OutlineInputBorder(
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
    //                       SpacerWidget.spacerWidget(spaceHeight: 12.ht(context),),
    //
    //
    //
    //                       Container(
    //                         alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
    //                         child: Text(
    //                           "City".tr,
    //                           textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
    //                           style: GoogleFonts.tajawal(
    //                             fontWeight: FontWeight.w500,
    //                             fontStyle: FontStyle.normal,
    //                             fontSize: 16.spt(context),
    //                             color: ColorUtils.black255,
    //                           ),
    //                         ),
    //                       ),
    //
    //                       SpacerWidget.spacerWidget(spaceHeight: 12.ht(context),),
    //
    //
    //                       TextFormField(
    //                         controller: cityController.value,
    //                         textAlign: TextAlign.start,
    //                         cursorColor: ColorUtils.blue192,
    //                         cursorHeight: 20.ht(context),
    //                         style: GoogleFonts.tajawal(
    //                           fontSize: 16.spt(context),
    //                           fontStyle: FontStyle.normal,
    //                           color: ColorUtils.black51,
    //                           fontWeight: FontWeight.w400,
    //                         ),
    //                         textAlignVertical: TextAlignVertical.center,
    //                         decoration: InputDecoration(
    //                           hintText: "Al Khoud".tr,
    //                           hintStyle: GoogleFonts.tajawal(
    //                             fontSize: 16.spt(context),
    //                             fontWeight: FontWeight.w400,
    //                             fontStyle: FontStyle.normal,
    //                             color: ColorUtils.gray136,
    //                           ),
    //                           filled: true,
    //                           enabled: false,
    //                           fillColor: ColorUtils.white233,
    //                           contentPadding: EdgeInsets.symmetric(
    //                             horizontal: 12.hpmt(context),
    //                             vertical: 12.vpmt(context),
    //                           ),
    //                           constraints: BoxConstraints(
    //                             maxWidth: 468.wt(context),
    //                             maxHeight: 48.ht(context),
    //                           ),
    //                           border: OutlineInputBorder(
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
    //                       SpacerWidget.spacerWidget(spaceHeight: 24.ht(context),),
    //
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
    //                             showAdaptiveDialog(
    //                               context: context,
    //                               barrierDismissible: true,
    //                               builder: (context) {
    //                                 return Padding(
    //                                   padding: EdgeInsets.symmetric(
    //                                     vertical: 330.vpmt(context),
    //                                     horizontal: 158.hpmt(context),
    //                                   ),
    //                                   child: Container(
    //                                     width: 468.wt(context),
    //                                     height: 500.ht(context),
    //                                     decoration: BoxDecoration(
    //                                       color: ColorUtils.white255,
    //                                       borderRadius: BorderRadius.circular( 16.rt(context)),
    //                                     ),
    //                                     padding: EdgeInsets.symmetric(
    //                                       vertical: 30.vpmt(context),
    //                                       horizontal: 20.hpmt(context),
    //                                     ),
    //                                     child: Material(
    //                                       color: Colors.transparent,
    //                                       child: Column(
    //                                         mainAxisAlignment: MainAxisAlignment.center,
    //                                         crossAxisAlignment: CrossAxisAlignment.center,
    //                                         children: [
    //
    //
    //                                           SpacerWidget.spacerWidget(spaceHeight: 12.ht(context),),
    //                                           Container(
    //                                             alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
    //                                             child: Text(
    //                                               "Governorate *".tr,
    //                                               textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
    //                                               style: GoogleFonts.tajawal(
    //                                                 fontWeight: FontWeight.w500,
    //                                                 fontStyle: FontStyle.normal,
    //                                                 fontSize: 16.spt(context),
    //                                                 color: ColorUtils.black255,
    //                                               ),
    //                                             ),
    //                                           ),
    //
    //                                           SpacerWidget.spacerWidget(spaceHeight: 12.ht(context),),
    //
    //
    //                                           TextFormField(
    //                                             controller: governorateController.value,
    //                                             textAlign: TextAlign.start,
    //                                             cursorColor: ColorUtils.blue192,
    //                                             cursorHeight: 20.ht(context),
    //                                             style: GoogleFonts.tajawal(
    //                                               fontSize: 16.spt(context),
    //                                               fontStyle: FontStyle.normal,
    //                                               color: ColorUtils.black51,
    //                                               fontWeight: FontWeight.w400,
    //                                             ),
    //                                             textAlignVertical: TextAlignVertical.center,
    //                                             decoration: InputDecoration(
    //                                               hintText: "Muscat".tr,
    //                                               hintStyle: GoogleFonts.tajawal(
    //                                                 fontSize: 16.spt(context),
    //                                                 fontWeight: FontWeight.w400,
    //                                                 fontStyle: FontStyle.normal,
    //                                                 color: ColorUtils.gray136,
    //                                               ),
    //                                               filled: true,
    //                                               fillColor: ColorUtils.white255,
    //                                               contentPadding: EdgeInsets.symmetric(
    //                                                 horizontal: 12.hpmt(context),
    //                                                 vertical: 12.vpmt(context),
    //                                               ),
    //                                               constraints: BoxConstraints(
    //                                                 maxWidth: 468.wt(context),
    //                                                 maxHeight: 48.ht(context),
    //                                               ),
    //                                               border: OutlineInputBorder(
    //                                                 borderRadius: BorderRadius.circular(8.rt(context)),
    //                                                 borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
    //                                               ),
    //                                               enabledBorder: OutlineInputBorder(
    //                                                 borderRadius: BorderRadius.circular(8.rt(context)),
    //                                                 borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
    //                                               ),
    //                                               focusedBorder: OutlineInputBorder(
    //                                                 borderRadius: BorderRadius.circular(8.rt(context)),
    //                                                 borderSide: BorderSide(color: ColorUtils.blue192,width: 1),
    //                                               ),
    //
    //                                             ),
    //                                           ),
    //
    //
    //                                           SpacerWidget.spacerWidget(spaceHeight: 12.ht(context),),
    //
    //
    //                                           Container(
    //                                             alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
    //                                             child: Text(
    //                                               "State".tr,
    //                                               textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
    //                                               style: GoogleFonts.tajawal(
    //                                                 fontWeight: FontWeight.w500,
    //                                                 fontStyle: FontStyle.normal,
    //                                                 fontSize: 16.spt(context),
    //                                                 color: ColorUtils.black255,
    //                                               ),
    //                                             ),
    //                                           ),
    //
    //                                           SpacerWidget.spacerWidget(spaceHeight: 12.ht(context),),
    //
    //
    //                                           TextFormField(
    //                                             controller: stateController.value,
    //                                             textAlign: TextAlign.start,
    //                                             cursorColor: ColorUtils.blue192,
    //                                             cursorHeight: 20.ht(context),
    //                                             style: GoogleFonts.tajawal(
    //                                               fontSize: 16.spt(context),
    //                                               fontStyle: FontStyle.normal,
    //                                               color: ColorUtils.black51,
    //                                               fontWeight: FontWeight.w400,
    //                                             ),
    //                                             textAlignVertical: TextAlignVertical.center,
    //                                             decoration: InputDecoration(
    //                                               hintText: "Al Khoud".tr,
    //                                               hintStyle: GoogleFonts.tajawal(
    //                                                 fontSize: 16.spt(context),
    //                                                 fontWeight: FontWeight.w400,
    //                                                 fontStyle: FontStyle.normal,
    //                                                 color: ColorUtils.gray136,
    //                                               ),
    //                                               filled: true,
    //                                               fillColor: ColorUtils.white255,
    //                                               contentPadding: EdgeInsets.symmetric(
    //                                                 horizontal: 12.hpmt(context),
    //                                                 vertical: 12.vpmt(context),
    //                                               ),
    //                                               constraints: BoxConstraints(
    //                                                 maxWidth: 468.wt(context),
    //                                                 maxHeight: 48.ht(context),
    //                                               ),
    //                                               border: OutlineInputBorder(
    //                                                 borderRadius: BorderRadius.circular(8.rt(context)),
    //                                                 borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
    //                                               ),
    //                                               enabledBorder: OutlineInputBorder(
    //                                                 borderRadius: BorderRadius.circular(8.rt(context)),
    //                                                 borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
    //                                               ),
    //                                               focusedBorder: OutlineInputBorder(
    //                                                 borderRadius: BorderRadius.circular(8.rt(context)),
    //                                                 borderSide: BorderSide(color: ColorUtils.blue192,width: 1),
    //                                               ),
    //
    //                                             ),
    //                                           ),
    //
    //                                           SpacerWidget.spacerWidget(spaceHeight: 12.ht(context),),
    //
    //
    //
    //                                           Container(
    //                                             alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
    //                                             child: Text(
    //                                               "City".tr,
    //                                               textAlign:  Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
    //                                               style: GoogleFonts.tajawal(
    //                                                 fontWeight: FontWeight.w500,
    //                                                 fontStyle: FontStyle.normal,
    //                                                 fontSize: 16.spt(context),
    //                                                 color: ColorUtils.black255,
    //                                               ),
    //                                             ),
    //                                           ),
    //
    //                                           SpacerWidget.spacerWidget(spaceHeight: 12.ht(context),),
    //
    //
    //                                           TextFormField(
    //                                             controller: cityController.value,
    //                                             textAlign: TextAlign.start,
    //                                             cursorColor: ColorUtils.blue192,
    //                                             cursorHeight: 20.ht(context),
    //                                             style: GoogleFonts.tajawal(
    //                                               fontSize: 16.spt(context),
    //                                               fontStyle: FontStyle.normal,
    //                                               color: ColorUtils.black51,
    //                                               fontWeight: FontWeight.w400,
    //                                             ),
    //                                             textAlignVertical: TextAlignVertical.center,
    //                                             decoration: InputDecoration(
    //                                               hintText: "Al Khoud".tr,
    //                                               hintStyle: GoogleFonts.tajawal(
    //                                                 fontSize: 16.spt(context),
    //                                                 fontWeight: FontWeight.w400,
    //                                                 fontStyle: FontStyle.normal,
    //                                                 color: ColorUtils.gray136,
    //                                               ),
    //                                               filled: true,
    //                                               fillColor: ColorUtils.white255,
    //                                               contentPadding: EdgeInsets.symmetric(
    //                                                 horizontal: 12.hpmt(context),
    //                                                 vertical: 12.vpmt(context),
    //                                               ),
    //                                               constraints: BoxConstraints(
    //                                                 maxWidth: 468.wt(context),
    //                                                 maxHeight: 48.ht(context),
    //                                               ),
    //                                               border: OutlineInputBorder(
    //                                                 borderRadius: BorderRadius.circular(8.rt(context)),
    //                                                 borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
    //                                               ),
    //                                               enabledBorder: OutlineInputBorder(
    //                                                 borderRadius: BorderRadius.circular(8.rt(context)),
    //                                                 borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
    //                                               ),
    //                                               focusedBorder: OutlineInputBorder(
    //                                                 borderRadius: BorderRadius.circular(8.rt(context)),
    //                                                 borderSide: BorderSide(color: ColorUtils.blue192,width: 1),
    //                                               ),
    //
    //                                             ),
    //                                           ),
    //
    //
    //                                           SpacerWidget.spacerWidget(spaceHeight: 20.ht(context),),
    //
    //
    //                                           Row(
    //                                             mainAxisAlignment: MainAxisAlignment.center,
    //                                             children: [
    //
    //
    //                                               isSubmit.value == false ? Container(
    //                                                 height: 52.ht(context),
    //                                                 width: 188.wt(context),
    //                                                 decoration: BoxDecoration(
    //                                                   color: ColorUtils.blue192,
    //                                                   borderRadius: BorderRadius.circular(8.rm(context),),
    //                                                 ),
    //                                                 child: TextButton(
    //                                                   style: TextButton.styleFrom(padding: EdgeInsets.zero),
    //                                                   onPressed: () async {
    //                                                     isSubmit.value = true;
    //                                                     await ProfileController.checkLocalProfileResponse().then((value) async {
    //                                                       if(value?.data?.contact != null) {
    //                                                         await ProfileController.getUserAddressDataUpdateResponse(
    //                                                           city: cityController.value.text == "" ? value?.data?.city : cityController.value.text,
    //                                                           governorate: governorateController.value.text == "" ? value?.data?.governorate : governorateController.value.text,
    //                                                           image: File(""),
    //                                                           state: stateController.value.text == "" ? value?.data?.state : stateController.value.text,
    //                                                           onSuccess: (e) async {
    //                                                             Get.back();
    //                                                             CustomSnackBar().successCustomSnackBar(context: context, message: e);
    //                                                             isSubmit.value = false;
    //                                                             Get.off(()=>ManageAddressScreen(),preventDuplicates: false,duration: Duration(milliseconds: 300),transition: Transition.fadeIn);
    //                                                           },
    //                                                           onFail: (e) async {
    //                                                             isSubmit.value = false;
    //                                                             CustomSnackBar().errorCustomSnackBar(context: context, message: e);
    //                                                           },
    //                                                           onExceptionFail: (e) async {
    //                                                             isSubmit.value = false;
    //                                                             CustomSnackBar().errorCustomSnackBar(context: context, message: e);
    //                                                           },
    //                                                         );
    //                                                       }
    //                                                     });
    //                                                   },
    //                                                   child: Center(
    //                                                     child: Text(
    //                                                       "Save".tr,
    //                                                       textAlign: TextAlign.center,
    //                                                       style: GoogleFonts.tajawal(
    //                                                         fontWeight: FontWeight.w700,
    //                                                         fontStyle: FontStyle.normal,
    //                                                         fontSize: 18.spt(context),
    //                                                         color: ColorUtils.white255,
    //                                                       ),
    //                                                     ),
    //                                                   ),
    //                                                 ),
    //                                               ) : Container(
    //                                                 height: 52.ht(context),
    //                                                 width: 188.wt(context),
    //                                                 decoration: BoxDecoration(
    //                                                  color: Colors.transparent
    //                                                 ),
    //                                                 child: Center(child: CircularProgressIndicator(),),
    //                                               ),
    //
    //                                               SpacerWidget.spacerWidget(spaceWidth: 12.wt(context),),
    //
    //
    //                                               Container(
    //                                                 height: 52.ht(context),
    //                                                 width: 188.wt(context),
    //                                                 decoration: BoxDecoration(
    //                                                   border: Border.all(color: ColorUtils.gray136,width: 1),
    //                                                   color: ColorUtils.white255,
    //                                                   borderRadius: BorderRadius.circular(8.rt(context),),
    //                                                 ),
    //                                                 child: TextButton(
    //                                                   style: TextButton.styleFrom(padding: EdgeInsets.zero),
    //                                                   onPressed: () async {
    //                                                     Get.back();
    //                                                   },
    //                                                   child: Center(
    //                                                     child: Text(
    //                                                       "Cancel".tr,
    //                                                       textAlign: TextAlign.center,
    //                                                       style: GoogleFonts.tajawal(
    //                                                         fontWeight: FontWeight.w700,
    //                                                         fontStyle: FontStyle.normal,
    //                                                         fontSize: 18.spt(context),
    //                                                         color: ColorUtils.black51,
    //                                                       ),
    //                                                     ),
    //                                                   ),
    //                                                 ),
    //                                               ),
    //
    //
    //                                             ],
    //                                           )
    //
    //                                         ],
    //                                       ),
    //                                     ),
    //                                   ),
    //                                 );
    //                               },
    //                             );
    //                           },
    //                           child: Center(
    //                             child: Text(
    //                               "Edit".tr,
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
    //                       SpacerWidget.spacerWidget(spaceHeight: 24.ht(context),),
    //
    //
    //                     ],
    //                   ),
    //                 )
    //
    //
    //               ],
    //             )
    //           )
    //
    //
    //         ],
    //       ) : Center(child: CircularProgressIndicator(),),
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
        child: isLoading.value == false ? CustomScrollView(
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
                                "Manage Address".tr,
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


                    Column(
                      children: [

                        Container(
                          alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                          child: Text(
                            "Governorate *".tr,
                            textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                            style: GoogleFonts.tajawal(
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              fontSize: 16.spm(context),
                              color: ColorUtils.black255,
                            ),
                          ),
                        ),

                        SpacerWidget.spacerWidget(spaceHeight: 12.hm(context),),


                        TextFormField(
                          controller: governorateController.value,
                          textAlign: TextAlign.start,
                          cursorColor: ColorUtils.blue192,
                          cursorHeight: 20.hm(context),
                          style: GoogleFonts.tajawal(
                            fontSize: 16.spm(context),
                            fontStyle: FontStyle.normal,
                            color: ColorUtils.black51,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            hintText: "Muscat".tr,
                            hintStyle: GoogleFonts.tajawal(
                              fontSize: 16.spm(context),
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              color: ColorUtils.gray136,
                            ),
                            filled: true,
                            enabled: false,
                            fillColor: ColorUtils.white233,
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


                        SpacerWidget.spacerWidget(spaceHeight: 12.hm(context),),


                        Container(
                          alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                          child: Text(
                            "State".tr,
                            textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                            style: GoogleFonts.tajawal(
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              fontSize: 16.spm(context),
                              color: ColorUtils.black255,
                            ),
                          ),
                        ),

                        SpacerWidget.spacerWidget(spaceHeight: 12.hm(context),),


                        TextFormField(
                          controller: stateController.value,
                          textAlign: TextAlign.start,
                          cursorColor: ColorUtils.blue192,
                          cursorHeight: 20.hm(context),
                          style: GoogleFonts.tajawal(
                            fontSize: 16.spm(context),
                            fontStyle: FontStyle.normal,
                            color: ColorUtils.black51,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            hintText: "Al Khoud".tr,
                            hintStyle: GoogleFonts.tajawal(
                              fontSize: 16.spm(context),
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              color: ColorUtils.gray136,
                            ),
                            filled: true,
                            enabled: false,
                            fillColor: ColorUtils.white233,
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

                        SpacerWidget.spacerWidget(spaceHeight: 12.hm(context),),



                        Container(
                          alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                          child: Text(
                            "City".tr,
                            textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                            style: GoogleFonts.tajawal(
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              fontSize: 16.spm(context),
                              color: ColorUtils.black255,
                            ),
                          ),
                        ),

                        SpacerWidget.spacerWidget(spaceHeight: 12.hm(context),),


                        TextFormField(
                          controller: cityController.value,
                          textAlign: TextAlign.start,
                          cursorColor: ColorUtils.blue192,
                          cursorHeight: 20.hm(context),
                          style: GoogleFonts.tajawal(
                            fontSize: 16.spm(context),
                            fontStyle: FontStyle.normal,
                            color: ColorUtils.black51,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            hintText: "Al Khoud".tr,
                            hintStyle: GoogleFonts.tajawal(
                              fontSize: 16.spm(context),
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              color: ColorUtils.gray136,
                            ),
                            filled: true,
                            enabled: false,
                            fillColor: ColorUtils.white233,
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


                        SpacerWidget.spacerWidget(spaceHeight: 24.hm(context),),

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
                              showAdaptiveDialog(
                                context: context,
                                barrierDismissible: true,
                                builder: (context) {
                                  return Obx(()=> Container(
                                    height: 844.hm(context),
                                    width: 390.wm(context),
                                    decoration: BoxDecoration(
                                        color: Colors.transparent
                                    ),
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 16.hpmm(context),
                                    ),
                                    child: Container(
                                      width: 358.wm(context),
                                      height: 430.hm(context),
                                      decoration: BoxDecoration(
                                        color: ColorUtils.white255,
                                        borderRadius: BorderRadius.circular( 16.rm(context)),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        vertical: 30.vpmm(context),
                                        horizontal: 20.hpmm(context),
                                      ),
                                      child: Material(
                                        color: Colors.transparent,
                                        child: CustomScrollView(
                                          slivers: [

                                            SliverToBoxAdapter(
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [


                                                  SpacerWidget.spacerWidget(spaceHeight: 12.hm(context),),
                                                  Container(
                                                    alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                                    child: Text(
                                                      "Governorate *".tr,
                                                      textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                                      style: GoogleFonts.tajawal(
                                                        fontWeight: FontWeight.w500,
                                                        fontStyle: FontStyle.normal,
                                                        fontSize: 16.spm(context),
                                                        color: ColorUtils.black255,
                                                      ),
                                                    ),
                                                  ),

                                                  SpacerWidget.spacerWidget(spaceHeight: 12.hm(context),),


                                                  Wrap(
                                                    children: List.generate(locations.length, (index) {
                                                      return SizedBox(
                                                        height: 70.hm(context),
                                                        width: 110.wm(context),
                                                        child: TextButton(
                                                          onPressed: () async {
                                                            bigIndex_1.value = index + 1 ;
                                                            String location = locations[index];
                                                            if(location == "Muscat") {
                                                              governorate.value = 'muscat';
                                                            } else if(location == "Al Batinah") {
                                                              governorate.value = 'al-batinah';
                                                            } else if(location == "Ad Dakhiliyah") {
                                                              governorate.value = 'ad-dakhiliyah';
                                                            } else if(location == "Musandam") {
                                                              governorate.value = 'musandam';
                                                            } else if(location == "Al Buraimi") {
                                                              governorate.value = 'al-buraimi';
                                                            } else if(location == "Sharkia") {
                                                              governorate.value = 'sharkia';
                                                            } else if(location == "Al Dhahirah") {
                                                              governorate.value = 'al-dhahirah';
                                                            } else if(location == "Al Wusta") {
                                                              governorate.value = 'al-wusta';
                                                            } else if(location == "Dhofar") {
                                                              governorate.value = 'dhofar';
                                                            }
                                                          },
                                                          style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                                          child: Container(
                                                            height: 70.hm(context),
                                                            width: 110.wm(context),
                                                            decoration: BoxDecoration(
                                                              color: bigIndex_1.value == (index + 1) ? ColorUtils.blue192 : Colors.transparent,
                                                              borderRadius: BorderRadius.circular(8.rm(context)),
                                                              border: Border.all(color: ColorUtils.white217,width: 1),
                                                            ),
                                                            margin: EdgeInsets.only(bottom: 10.bpmm(context),right: 10.rpmm(context)),
                                                            padding: EdgeInsets.symmetric(horizontal: 5.hpmm(context),vertical: 5.vpmm(context)),
                                                            child: Column(
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              crossAxisAlignment: CrossAxisAlignment.end,
                                                              children: [

                                                                Container(
                                                                  alignment: Alignment.center,
                                                                  child: Text(
                                                                    "${locations[index]}".tr,
                                                                    textAlign: TextAlign.center,
                                                                    style: GoogleFonts.tajawal(
                                                                      fontWeight: FontWeight.w700,
                                                                      fontStyle: FontStyle.normal,
                                                                      fontSize: 14.spm(context),
                                                                      color: bigIndex_1.value == (index + 1) ? ColorUtils.white255 : ColorUtils.black51,
                                                                    ),
                                                                  ),
                                                                ),


                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }),
                                                  ),


                                                  SpacerWidget.spacerWidget(spaceHeight: 12.hm(context),),


                                                  Container(
                                                    alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                                    child: Text(
                                                      "State".tr,
                                                      textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                                      style: GoogleFonts.tajawal(
                                                        fontWeight: FontWeight.w500,
                                                        fontStyle: FontStyle.normal,
                                                        fontSize: 16.spm(context),
                                                        color: ColorUtils.black255,
                                                      ),
                                                    ),
                                                  ),

                                                  SpacerWidget.spacerWidget(spaceHeight: 12.hm(context),),


                                                  TextFormField(
                                                    controller: stateController.value,
                                                    textAlign: TextAlign.start,
                                                    cursorColor: ColorUtils.blue192,
                                                    cursorHeight: 20.hm(context),
                                                    style: GoogleFonts.tajawal(
                                                      fontSize: 16.spm(context),
                                                      fontStyle: FontStyle.normal,
                                                      color: ColorUtils.black51,
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                    textAlignVertical: TextAlignVertical.center,
                                                    decoration: InputDecoration(
                                                      hintText: "Al Khoud".tr,
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

                                                  SpacerWidget.spacerWidget(spaceHeight: 12.hm(context),),



                                                  Container(
                                                    alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                                    child: Text(
                                                      "City".tr,
                                                      textAlign:  Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                                      style: GoogleFonts.tajawal(
                                                        fontWeight: FontWeight.w500,
                                                        fontStyle: FontStyle.normal,
                                                        fontSize: 16.spm(context),
                                                        color: ColorUtils.black255,
                                                      ),
                                                    ),
                                                  ),

                                                  SpacerWidget.spacerWidget(spaceHeight: 12.hm(context),),


                                                  TextFormField(
                                                    controller: cityController.value,
                                                    textAlign: TextAlign.start,
                                                    cursorColor: ColorUtils.blue192,
                                                    cursorHeight: 20.hm(context),
                                                    style: GoogleFonts.tajawal(
                                                      fontSize: 16.spm(context),
                                                      fontStyle: FontStyle.normal,
                                                      color: ColorUtils.black51,
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                    textAlignVertical: TextAlignVertical.center,
                                                    decoration: InputDecoration(
                                                      hintText: "Al Khoud".tr,
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


                                                  SpacerWidget.spacerWidget(spaceHeight: 20.hm(context),),


                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [


                                                      isSubmit.value == false ? Container(
                                                        height: 48.hm(context),
                                                        width: 153.wm(context),
                                                        decoration: BoxDecoration(
                                                          color: ColorUtils.blue192,
                                                          borderRadius: BorderRadius.circular(8.rm(context),),
                                                        ),
                                                        child: TextButton(
                                                          style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                                          onPressed: () async {
                                                            isSubmit.value = true;
                                                            await ProfileController.checkLocalProfileResponse().then((value) async {
                                                              if(value?.data?.contact != null) {
                                                                await ProfileController.getUserAddressDataUpdateResponse(
                                                                  city: cityController.value.text == "" ? value?.data?.city : cityController.value.text,
                                                                  governorate: governorateController.value.text == "" ? value!.data!.governorate!.first : governorate.value,
                                                                  image: File(""),
                                                                  state: stateController.value.text == "" ? value?.data?.state : stateController.value.text,
                                                                  onSuccess: (e) async {
                                                                    Get.back();
                                                                    CustomSnackBar().successCustomSnackBar(context: context, message: e);
                                                                    isSubmit.value = false;
                                                                    Get.off(()=>ManageAddressScreen(),preventDuplicates: false,duration: Duration(milliseconds: 300),transition: Transition.fadeIn);
                                                                  },
                                                                  onFail: (e) async {
                                                                    isSubmit.value = false;
                                                                    CustomSnackBar().errorCustomSnackBar(context: context, message: e);
                                                                  },
                                                                  onExceptionFail: (e) async {
                                                                    isSubmit.value = false;
                                                                    CustomSnackBar().errorCustomSnackBar(context: context, message: e);
                                                                  },
                                                                );
                                                              }
                                                            });
                                                          },
                                                          child: Center(
                                                            child: Text(
                                                              "Save".tr,
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
                                                        width: 153.wm(context),
                                                        decoration: BoxDecoration(
                                                          color: Colors.transparent,
                                                        ),
                                                        child: Center(child: CircularProgressIndicator(),),
                                                      ),

                                                      SpacerWidget.spacerWidget(spaceWidth: 12.wm(context),),


                                                      Container(
                                                        height: 48.hm(context),
                                                        width: 153.wm(context),
                                                        decoration: BoxDecoration(
                                                          border: Border.all(color: ColorUtils.gray136,width: 1),
                                                          color: ColorUtils.white255,
                                                          borderRadius: BorderRadius.circular(8.rm(context),),
                                                        ),
                                                        child: TextButton(
                                                          style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                                          onPressed: () async {
                                                            isSubmit.value = false;
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

                                                  SpacerWidget.spacerWidget(spaceHeight: 12.hm(context),),

                                                ],
                                              ),
                                            )


                                          ],
                                        )
                                      ),
                                    ),
                                  ),);
                                },
                              );
                            },
                            child: Center(
                              child: Text(
                                "Edit".tr,
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

                        SpacerWidget.spacerWidget(spaceHeight: 24.hm(context),),


                      ],
                    )


                  ],
                ),
              ),
            )


          ],
        ) : Center(child: CircularProgressIndicator(),),
      ),
    ));
  }



}