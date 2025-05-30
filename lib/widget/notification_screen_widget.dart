import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rahatak_food_delivery_app/controller/controller.dart';
import 'package:rahatak_food_delivery_app/model/model.dart';
import 'package:rahatak_food_delivery_app/screen/screen.dart';
import 'package:rahatak_food_delivery_app/utils/utils.dart';

class NotificationScreenWidget extends GetxController {


  RxBool isLoading = false.obs;
  Rx<NotificationResponseModel> notificationResponseModel = NotificationResponseModel().obs;
  BuildContext context;
  NotificationScreenWidget({required this.context});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
      await NotificationController.getNotificationResponse(
        onSuccess: (e) async {
          isLoading.value = false;
        },
        onFail: (e) async {
          isLoading.value = false;
          CustomSnackBar().errorCustomSnackBar(context: context, message: e);
        },
        onExceptionFail: (e) async {
          isLoading.value = false;
          CustomSnackBar().errorCustomSnackBar(context: context, message: e);
        },
      ).then((value) {
        notificationResponseModel.value = value;
      });
    });
  }



  Widget notificationScreenWidget({required BuildContext context}) {
    // if(MediaQuery.sizeOf(context).height > 1000) {
    //   return SafeArea(
    //     child: Container(
    //       height: 1133.ht(context),
    //       width: 744.wt(context),
    //       decoration: BoxDecoration(
    //         color: ColorUtils.white255,
    //       ),
    //       child: CustomScrollView(
    //         slivers: [
    //
    //           SliverToBoxAdapter(
    //             child: Column(
    //               children: [
    //
    //                 SpacerWidget.spacerWidget(spaceHeight: 11.ht(context),),
    //
    //                 Directionality(
    //                   textDirection: TextDirection.ltr,
    //                   child: Padding(
    //                     padding: EdgeInsets.symmetric(horizontal: 37.hpmt(context)),
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
    //                               Get.off(()=>HomeScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
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
    //                               "Notification".tr,
    //                               textAlign: TextAlign.center,
    //                               style: GoogleFonts.tajawal(
    //                                 fontWeight: FontWeight.w700,
    //                                 fontStyle: FontStyle.normal,
    //                                 fontSize: 20.spt(context),
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
    //                 Padding(
    //                   padding: EdgeInsets.symmetric(horizontal: 138.hpmt(context)),
    //                   child: Column(
    //                     children: [
    //                       SpacerWidget.spacerWidget(spaceHeight: 26.ht(context),),
    //
    //                       Container(
    //                         height: 95.ht(context),
    //                         decoration: BoxDecoration(
    //                           color: Colors.transparent,
    //                           borderRadius: BorderRadius.circular(10.rt(context)),
    //                           border: Border.all(color: ColorUtils.white217,width: 0.5),
    //                         ),
    //                         child: Row(
    //                           children: [
    //
    //
    //                             Container(
    //                               height: 95.ht(context),
    //                               width: 38.wt(context),
    //                               alignment: Alignment.center,
    //                               decoration: BoxDecoration(
    //                                   borderRadius: BorderRadius.only(
    //                                     topLeft: Radius.circular(10.rt(context)),
    //                                     bottomLeft: Radius.circular(10.rt(context)),
    //                                   ),
    //                                   color: ColorUtils.blue192
    //                               ),
    //                               child:  Container(
    //                                 height: 24.ht(context),
    //                                 width: 24.wt(context),
    //                                 decoration: BoxDecoration(
    //                                   color: Colors.transparent,
    //                                 ),
    //                                 child: FittedBox(
    //                                   fit: BoxFit.cover,
    //                                   child: Image.asset(
    //                                     ImagePathUtils.passwordResetIconImagePath,
    //                                     fit: BoxFit.cover,
    //                                     alignment: Alignment.center,
    //                                   ),
    //                                 ),
    //                               ),
    //                             ),
    //
    //                             Expanded(
    //                               child: Container(
    //                                 height: 95.ht(context),
    //                                 padding: EdgeInsets.symmetric(
    //                                   horizontal: 10.hpmt(context),
    //                                 ),
    //                                 decoration: BoxDecoration(
    //                                   borderRadius: BorderRadius.only(
    //                                     topRight: Radius.circular(10.rt(context)),
    //                                     bottomRight: Radius.circular(10.rt(context)),
    //                                   ),
    //                                   color: ColorUtils.white255,
    //                                 ),
    //                                 child: Column(
    //                                   mainAxisAlignment: MainAxisAlignment.center,
    //                                   crossAxisAlignment: CrossAxisAlignment.center,
    //                                   children: [
    //
    //
    //                                     Container(
    //                                       alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
    //                                       child: Text(
    //                                         "Password Changed".tr,
    //                                         textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
    //                                         style: GoogleFonts.tajawal(
    //                                           fontWeight: FontWeight.w700,
    //                                           fontStyle: FontStyle.normal,
    //                                           fontSize: 16.spt(context),
    //                                           color: ColorUtils.black255,
    //                                         ),
    //                                       ),
    //                                     ),
    //
    //
    //                                     SpacerWidget.spacerWidget(spaceHeight: 10.ht(context)),
    //
    //                                     Container(
    //                                       alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
    //                                       child: Text(
    //                                         "Your account password has been changed successfully.".tr,
    //                                         textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.start,
    //                                         style: GoogleFonts.tajawal(
    //                                           fontWeight: FontWeight.w400,
    //                                           fontStyle: FontStyle.normal,
    //                                           fontSize: 16.spt(context),
    //                                           color: ColorUtils.black255,
    //                                         ),
    //                                       ),
    //                                     ),
    //
    //                                   ],
    //                                 ),
    //                               ),
    //                             ),
    //
    //                           ],
    //                         ),
    //                       ),
    //
    //                       SpacerWidget.spacerWidget(spaceHeight: 12.ht(context),),
    //
    //                       Container(
    //                         height: 95.ht(context),
    //                         decoration: BoxDecoration(
    //                           color: Colors.transparent,
    //                           borderRadius: BorderRadius.circular(10.rt(context)),
    //                           border: Border.all(color: ColorUtils.white217,width: 0.5),
    //                         ),
    //                         child: Row(
    //                           children: [
    //
    //
    //                             Container(
    //                               height: 95.ht(context),
    //                               width: 38.wt(context),
    //                               alignment: Alignment.center,
    //                               decoration: BoxDecoration(
    //                                 borderRadius: BorderRadius.only(
    //                                   topLeft: Radius.circular(10.rt(context)),
    //                                   bottomLeft: Radius.circular(10.rt(context)),
    //                                 ),
    //                                 color: ColorUtils.green142,
    //                               ),
    //                               child:  Container(
    //                                 height: 24.ht(context),
    //                                 width: 24.wt(context),
    //                                 decoration: BoxDecoration(
    //                                   color: Colors.transparent,
    //                                 ),
    //                                 child: FittedBox(
    //                                   fit: BoxFit.cover,
    //                                   child: Image.asset(
    //                                     ImagePathUtils.checkIconImagePath,
    //                                     fit: BoxFit.cover,
    //                                     alignment: Alignment.center,
    //                                   ),
    //                                 ),
    //                               ),
    //                             ),
    //
    //                             Expanded(
    //                               child: Container(
    //                                 height: 95.ht(context),
    //                                 padding: EdgeInsets.symmetric(
    //                                   horizontal: 10.hpmt(context),
    //                                 ),
    //                                 decoration: BoxDecoration(
    //                                   borderRadius: BorderRadius.only(
    //                                     topRight: Radius.circular(10.rt(context)),
    //                                     bottomRight: Radius.circular(10.rt(context)),
    //                                   ),
    //                                   color: ColorUtils.white255,
    //                                 ),
    //                                 child: Column(
    //                                   mainAxisAlignment: MainAxisAlignment.center,
    //                                   crossAxisAlignment: CrossAxisAlignment.center,
    //                                   children: [
    //
    //
    //                                     Container(
    //                                       alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
    //                                       child: Text(
    //                                         "Order Delivered".tr,
    //                                         textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
    //                                         style: GoogleFonts.tajawal(
    //                                           fontWeight: FontWeight.w700,
    //                                           fontStyle: FontStyle.normal,
    //                                           fontSize: 16.spt(context),
    //                                           color: ColorUtils.black255,
    //                                         ),
    //                                       ),
    //                                     ),
    //
    //
    //                                     SpacerWidget.spacerWidget(spaceHeight: 10.ht(context)),
    //
    //                                     Container(
    //                                       alignment:Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
    //                                       child: Text(
    //                                         "Your order has been successfully delivered! Enjoy your meal 🍽️".tr,
    //                                         textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.start,
    //                                         style: GoogleFonts.tajawal(
    //                                           fontWeight: FontWeight.w400,
    //                                           fontStyle: FontStyle.normal,
    //                                           fontSize: 16.spt(context),
    //                                           color: ColorUtils.black255,
    //                                         ),
    //                                       ),
    //                                     ),
    //
    //                                   ],
    //                                 ),
    //                               ),
    //                             ),
    //
    //                           ],
    //                         ),
    //                       ),
    //
    //                       SpacerWidget.spacerWidget(spaceHeight: 12.ht(context),),
    //
    //                       Container(
    //                         height: 95.ht(context),
    //                         decoration: BoxDecoration(
    //                           color: Colors.transparent,
    //                           borderRadius: BorderRadius.circular(10.rt(context)),
    //                           border: Border.all(color: ColorUtils.white217,width: 0.5),
    //                         ),
    //                         child: Row(
    //                           children: [
    //
    //
    //                             Container(
    //                               height: 95.ht(context),
    //                               width: 38.wt(context),
    //                               alignment: Alignment.center,
    //                               decoration: BoxDecoration(
    //                                 borderRadius: BorderRadius.only(
    //                                   topLeft: Radius.circular(10.rt(context)),
    //                                   bottomLeft: Radius.circular(10.rt(context)),
    //                                 ),
    //                                 color: ColorUtils.blue192,
    //                               ),
    //                               child:  Container(
    //                                 height: 24.ht(context),
    //                                 width: 24.wt(context),
    //                                 decoration: BoxDecoration(
    //                                   color: Colors.transparent,
    //                                 ),
    //                                 child: FittedBox(
    //                                   fit: BoxFit.cover,
    //                                   child: Image.asset(
    //                                     ImagePathUtils.deliveryFilledIconImagePath,
    //                                     fit: BoxFit.cover,
    //                                     alignment: Alignment.center,
    //                                   ),
    //                                 ),
    //                               ),
    //                             ),
    //
    //                             Expanded(
    //                               child: Container(
    //                                 height: 95.ht(context),
    //                                 padding: EdgeInsets.symmetric(
    //                                   horizontal: 10.hpmt(context),
    //                                 ),
    //                                 decoration: BoxDecoration(
    //                                   borderRadius: BorderRadius.only(
    //                                     topRight: Radius.circular(10.rt(context)),
    //                                     bottomRight: Radius.circular(10.rt(context)),
    //                                   ),
    //                                   color: ColorUtils.white255,
    //                                 ),
    //                                 child: Column(
    //                                   mainAxisAlignment: MainAxisAlignment.center,
    //                                   crossAxisAlignment: CrossAxisAlignment.center,
    //                                   children: [
    //
    //
    //                                     Container(
    //                                       alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
    //                                       child: Text(
    //                                         "Order on the Way".tr,
    //                                         textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
    //                                         style: GoogleFonts.tajawal(
    //                                           fontWeight: FontWeight.w700,
    //                                           fontStyle: FontStyle.normal,
    //                                           fontSize: 16.spt(context),
    //                                           color: ColorUtils.black255,
    //                                         ),
    //                                       ),
    //                                     ),
    //
    //
    //                                     SpacerWidget.spacerWidget(spaceHeight: 10.ht(context)),
    //
    //                                     Container(
    //                                       alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
    //                                       child: Text(
    //                                         "The delivery person is on their way to you, track their location live.".tr,
    //                                         textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.start,
    //                                         style: GoogleFonts.tajawal(
    //                                           fontWeight: FontWeight.w400,
    //                                           fontStyle: FontStyle.normal,
    //                                           fontSize: 16.spt(context),
    //                                           color: ColorUtils.black255,
    //                                         ),
    //                                       ),
    //                                     ),
    //
    //                                   ],
    //                                 ),
    //                               ),
    //                             ),
    //
    //                           ],
    //                         ),
    //                       ),
    //
    //
    //                       SpacerWidget.spacerWidget(spaceHeight: 12.ht(context),),
    //
    //                       Container(
    //                         height: 95.ht(context),
    //                         decoration: BoxDecoration(
    //                           color: Colors.transparent,
    //                           borderRadius: BorderRadius.circular(10.rt(context)),
    //                           border: Border.all(color: ColorUtils.white217,width: 0.5),
    //                         ),
    //                         child: Row(
    //                           children: [
    //
    //
    //                             Container(
    //                               height: 95.ht(context),
    //                               width: 38.wt(context),
    //                               alignment: Alignment.center,
    //                               decoration: BoxDecoration(
    //                                   borderRadius: BorderRadius.only(
    //                                     topLeft: Radius.circular(10.rt(context)),
    //                                     bottomLeft: Radius.circular(10.rt(context)),
    //                                   ),
    //                                   color: ColorUtils.green142
    //                               ),
    //                               child:  Container(
    //                                 height: 24.ht(context),
    //                                 width: 24.wt(context),
    //                                 decoration: BoxDecoration(
    //                                   color: Colors.transparent,
    //                                 ),
    //                                 child: FittedBox(
    //                                   fit: BoxFit.cover,
    //                                   child: Image.asset(
    //                                     ImagePathUtils.checkIconImagePath,
    //                                     fit: BoxFit.cover,
    //                                     alignment: Alignment.center,
    //                                   ),
    //                                 ),
    //                               ),
    //                             ),
    //
    //                             Expanded(
    //                               child: Container(
    //                                 height: 95.ht(context),
    //                                 padding: EdgeInsets.symmetric(
    //                                   horizontal: 10.hpmt(context),
    //                                 ),
    //                                 decoration: BoxDecoration(
    //                                   borderRadius: BorderRadius.only(
    //                                     topRight: Radius.circular(10.rt(context)),
    //                                     bottomRight: Radius.circular(10.rt(context)),
    //                                   ),
    //                                   color: ColorUtils.white255,
    //                                 ),
    //                                 child: Column(
    //                                   mainAxisAlignment: MainAxisAlignment.center,
    //                                   crossAxisAlignment: CrossAxisAlignment.center,
    //                                   children: [
    //
    //
    //                                     Container(
    //                                       alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
    //                                       child: Text(
    //                                         "Confirm Order".tr,
    //                                         textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
    //                                         style: GoogleFonts.tajawal(
    //                                           fontWeight: FontWeight.w700,
    //                                           fontStyle: FontStyle.normal,
    //                                           fontSize: 16.spt(context),
    //                                           color: ColorUtils.black255,
    //                                         ),
    //                                       ),
    //                                     ),
    //
    //
    //                                     SpacerWidget.spacerWidget(spaceHeight: 10.ht(context)),
    //
    //                                     Container(
    //                                       alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
    //                                       child: Text(
    //                                         "Your order has been received successfully! Order number: #123456".tr,
    //                                         textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.start,
    //                                         style: GoogleFonts.tajawal(
    //                                           fontWeight: FontWeight.w400,
    //                                           fontStyle: FontStyle.normal,
    //                                           fontSize: 16.spt(context),
    //                                           color: ColorUtils.black255,
    //                                         ),
    //                                       ),
    //                                     ),
    //
    //                                   ],
    //                                 ),
    //                               ),
    //                             ),
    //
    //                           ],
    //                         ),
    //                       ),
    //
    //
    //                       SpacerWidget.spacerWidget(spaceHeight: 12.ht(context),),
    //
    //                       Container(
    //                         height: 95.ht(context),
    //                         decoration: BoxDecoration(
    //                           color: Colors.transparent,
    //                           borderRadius: BorderRadius.circular(10.rt(context)),
    //                           border: Border.all(color: ColorUtils.white217,width: 0.5),
    //                         ),
    //                         child: Row(
    //                           children: [
    //
    //
    //                             Container(
    //                               height: 95.ht(context),
    //                               width: 38.wt(context),
    //                               alignment: Alignment.center,
    //                               decoration: BoxDecoration(
    //                                 borderRadius: BorderRadius.only(
    //                                   topLeft: Radius.circular(10.rt(context)),
    //                                   bottomLeft: Radius.circular(10.rt(context)),
    //                                 ),
    //                                 color: ColorUtils.yellow160,
    //                               ),
    //                               child:  Container(
    //                                 height: 24.ht(context),
    //                                 width: 24.wt(context),
    //                                 decoration: BoxDecoration(
    //                                   color: Colors.transparent,
    //                                 ),
    //                                 child: FittedBox(
    //                                   fit: BoxFit.cover,
    //                                   child: Image.asset(
    //                                     ImagePathUtils.bxsErrorIconImagePath,
    //                                     fit: BoxFit.cover,
    //                                     alignment: Alignment.center,
    //                                   ),
    //                                 ),
    //                               ),
    //                             ),
    //
    //                             Expanded(
    //                               child: Container(
    //                                 height: 95.ht(context),
    //                                 padding: EdgeInsets.symmetric(
    //                                   horizontal: 10.hpmm(context),
    //                                 ),
    //                                 decoration: BoxDecoration(
    //                                   borderRadius: BorderRadius.only(
    //                                     topRight: Radius.circular(10.rt(context)),
    //                                     bottomRight: Radius.circular(10.rt(context)),
    //                                   ),
    //                                   color: ColorUtils.white255,
    //                                 ),
    //                                 child: Column(
    //                                   mainAxisAlignment: MainAxisAlignment.center,
    //                                   crossAxisAlignment: CrossAxisAlignment.center,
    //                                   children: [
    //
    //
    //                                     Container(
    //                                       alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
    //                                       child: Text(
    //                                         "Payment Failed".tr,
    //                                         textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
    //                                         style: GoogleFonts.tajawal(
    //                                           fontWeight: FontWeight.w700,
    //                                           fontStyle: FontStyle.normal,
    //                                           fontSize: 16.spt(context),
    //                                           color: ColorUtils.black255,
    //                                         ),
    //                                       ),
    //                                     ),
    //
    //
    //                                     SpacerWidget.spacerWidget(spaceHeight: 10.ht(context)),
    //
    //                                     Container(
    //                                       alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
    //                                       child: Text(
    //                                         "There was a problem during payment, please try again.".tr,
    //                                         textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.start,
    //                                         style: GoogleFonts.tajawal(
    //                                           fontWeight: FontWeight.w400,
    //                                           fontStyle: FontStyle.normal,
    //                                           fontSize: 16.spt(context),
    //                                           color: ColorUtils.black255,
    //                                         ),
    //                                       ),
    //                                     ),
    //
    //                                   ],
    //                                 ),
    //                               ),
    //                             ),
    //
    //                           ],
    //                         ),
    //                       ),
    //
    //
    //                       SpacerWidget.spacerWidget(spaceHeight: 12.ht(context),),
    //
    //                       Container(
    //                         height: 95.ht(context),
    //                         decoration: BoxDecoration(
    //                           color: Colors.transparent,
    //                           borderRadius: BorderRadius.circular(10.rt(context)),
    //                           border: Border.all(color: ColorUtils.white217,width: 0.5),
    //                         ),
    //                         child: Row(
    //                           children: [
    //
    //
    //                             Container(
    //                               height: 95.ht(context),
    //                               width: 38.wt(context),
    //                               alignment: Alignment.center,
    //                               decoration: BoxDecoration(
    //                                 borderRadius: BorderRadius.only(
    //                                   topLeft: Radius.circular(10.rt(context)),
    //                                   bottomLeft: Radius.circular(10.rt(context)),
    //                                 ),
    //                                 color: ColorUtils.green142,
    //                               ),
    //                               child:  Container(
    //                                 height: 24.ht(context),
    //                                 width: 24.wt(context),
    //                                 decoration: BoxDecoration(
    //                                   color: Colors.transparent,
    //                                 ),
    //                                 child: FittedBox(
    //                                   fit: BoxFit.cover,
    //                                   child: Image.asset(
    //                                     ImagePathUtils.checkIconImagePath,
    //                                     fit: BoxFit.cover,
    //                                     alignment: Alignment.center,
    //                                   ),
    //                                 ),
    //                               ),
    //                             ),
    //
    //                             Expanded(
    //                               child: Container(
    //                                 height: 95.ht(context),
    //                                 padding: EdgeInsets.symmetric(
    //                                   horizontal: 10.hpmt(context),
    //                                 ),
    //                                 decoration: BoxDecoration(
    //                                   borderRadius: BorderRadius.only(
    //                                     topRight: Radius.circular(10.rt(context)),
    //                                     bottomRight: Radius.circular(10.rt(context)),
    //                                   ),
    //                                   color: ColorUtils.white255,
    //                                 ),
    //                                 child: Column(
    //                                   mainAxisAlignment: MainAxisAlignment.center,
    //                                   crossAxisAlignment: CrossAxisAlignment.center,
    //                                   children: [
    //
    //
    //                                     Container(
    //                                       alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
    //                                       child: Text(
    //                                         "Payment Successful".tr,
    //                                         textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
    //                                         style: GoogleFonts.tajawal(
    //                                           fontWeight: FontWeight.w700,
    //                                           fontStyle: FontStyle.normal,
    //                                           fontSize: 16.spt(context),
    //                                           color: ColorUtils.black255,
    //                                         ),
    //                                       ),
    //                                     ),
    //
    //
    //                                     SpacerWidget.spacerWidget(spaceHeight: 10.ht(context)),
    //
    //                                     Container(
    //                                       alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
    //                                       child: Text(
    //                                         "Your payment has been completed successfully, and your order has been confirmed.".tr,
    //                                         textAlign:Get.locale.toString() == "en" ? TextAlign.start : TextAlign.start,
    //                                         style: GoogleFonts.tajawal(
    //                                           fontWeight: FontWeight.w400,
    //                                           fontStyle: FontStyle.normal,
    //                                           fontSize: 16.spt(context),
    //                                           color: ColorUtils.black255,
    //                                         ),
    //                                       ),
    //                                     ),
    //
    //                                   ],
    //                                 ),
    //                               ),
    //                             ),
    //
    //                           ],
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 )
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
    //   );
    // } else {
    //
    // }
    return Obx(()=>SafeArea(
      child: Container(
        height: 844.hm(context),
        width: 390.wm(context),
        decoration: BoxDecoration(
          color: ColorUtils.white255,
        ),
        child: isLoading.value == false ?
        CustomScrollView(
          slivers: [

            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.hpmm(context)),
                child: Column(
                  children: [

                    SpacerWidget.spacerWidget(spaceHeight: 11.hm(context),),

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
                                Get.off(()=>HomeScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
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
                                "Notification".tr,
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

                    SpacerWidget.spacerWidget(spaceHeight: 26.hm(context),),


                  ],
                ),
              ),
            ),


            SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context,int index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.hpmm(context)),
                      child: Container(
                        margin: EdgeInsets.only(bottom: 16.bpmm(context)),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(10.rm(context)),
                          border: Border.all(color: ColorUtils.white217,width: 0.5),
                        ),
                        child: Row(
                          children: [


                            Container(
                              height: 95.hm(context),
                              width: 38.wm(context),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.rm(context)),
                                  bottomLeft: Radius.circular(10.rm(context)),
                                ),
                                color: ColorUtils.green142,
                              ),
                              child:  Container(
                                height: 24.hm(context),
                                width: 24.wm(context),
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                ),
                                child: FittedBox(
                                  fit: BoxFit.cover,
                                  child: Image.asset(
                                    ImagePathUtils.checkIconImagePath,
                                    fit: BoxFit.cover,
                                    alignment: Alignment.center,
                                  ),
                                ),
                              ),
                            ),

                            Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10.hpmm(context),
                                  vertical: 10.vpmm(context),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10.rm(context)),
                                    bottomRight: Radius.circular(10.rm(context)),
                                  ),
                                  color: ColorUtils.white255,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [


                                    Container(
                                      alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                      child: Text(
                                        "${notificationResponseModel.value.data?.data?[index].title ?? ""}".tr,
                                        textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                        style: GoogleFonts.tajawal(
                                          fontWeight: FontWeight.w700,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 16.spm(context),
                                          color: ColorUtils.black255,
                                        ),
                                      ),
                                    ),


                                    SpacerWidget.spacerWidget(spaceHeight: 10.hm(context)),

                                    Container(
                                      alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                      child: Text(
                                        "${notificationResponseModel.value.data?.data?[index].body ?? ""}".tr,
                                        textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.start,
                                        style: GoogleFonts.tajawal(
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 16.spm(context),
                                          color: ColorUtils.black255,
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    );
                  },
                childCount: notificationResponseModel.value.data?.data?.length
              ),
            )


          ],
        ) :
        Center(child: CircularProgressIndicator(),),
      ),
    ));
  }



}