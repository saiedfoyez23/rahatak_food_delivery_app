import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rahatak_food_delivery_app/controller/controller.dart';
import 'package:rahatak_food_delivery_app/screen/screen.dart';
import 'package:rahatak_food_delivery_app/utils/utils.dart';

class ProfileScreenWidget extends GetxController {

  BuildContext context;
  ProfileScreenWidget({required this.context});
  Rx<File> imageFile = File("").obs;
  RxBool isLoading = false.obs;
  RxString coverImage = "".obs;
  RxString userName = "".obs;

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
              userName.value = value?.data?.name ?? "";
            }
          });
          CustomSnackBar().successCustomSnackBar(context: context, message: e);
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


  Widget profileScreenWidget({required BuildContext context}) {
    // if(MediaQuery.sizeOf(context).height > 1133) {
    //   return Obx(()=>SafeArea(
    //     child: Container(
    //       height: 1133.ht(context),
    //       width: 744.wt(context),
    //       decoration: BoxDecoration(
    //         color: ColorUtils.white248,
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
    //                 SpacerWidget.spacerWidget(spaceHeight: 20.ht(context)),
    //
    //
    //                 Container(
    //                   alignment: Alignment.center,
    //                   child: Text(
    //                     "My Account".tr,
    //                     textAlign: TextAlign.center,
    //                     style: GoogleFonts.tajawal(
    //                       fontWeight: FontWeight.w700,
    //                       fontStyle: FontStyle.normal,
    //                       fontSize: 20.spt(context),
    //                       color: ColorUtils.black255,
    //                     ),
    //                   ),
    //                 ),
    //
    //                 SpacerWidget.spacerWidget(spaceHeight: 36.ht(context)),
    //
    //
    //                 Padding(
    //                   padding: EdgeInsets.symmetric(
    //                     horizontal: 138.hpmt(context),
    //                   ),
    //                   child: Container(
    //                     width: 744.wt(context),
    //                     decoration: BoxDecoration(
    //                       border: Border.all(color: ColorUtils.white217,width: .5),
    //                       borderRadius: BorderRadius.circular(12.rt(context)),
    //                     ),
    //                     padding: EdgeInsets.only(
    //                       left: 20.lpmt(context),
    //                       right: 20.rpmt(context),
    //                       top: 20.tpmt(context),
    //                       bottom: 10.bpmt(context),
    //                     ),
    //                     child: Column(
    //                       mainAxisAlignment: MainAxisAlignment.center,
    //                       crossAxisAlignment: CrossAxisAlignment.center,
    //                       children: [
    //
    //                         Directionality(
    //                           textDirection: TextDirection.ltr,
    //                           child: Container(
    //                             height: 100.ht(context),
    //                             width: 100.wt(context),
    //                             decoration: BoxDecoration(
    //                                 color: Colors.transparent
    //                             ),
    //                             child: Stack(
    //                               fit: StackFit.expand,
    //                               children: [
    //
    //                                 SizedBox(
    //                                   height: 100.ht(context),
    //                                   width: 100.wt(context),
    //                                 ),
    //
    //
    //                                 imageFile.value.path != "" ?
    //                                 Container(
    //                                   height: 100.ht(context),
    //                                   width: 100.wt(context),
    //                                   decoration: BoxDecoration(
    //                                     color: ColorUtils.white252,
    //                                     shape: BoxShape.circle,
    //                                     image: DecorationImage(
    //                                       image: FileImage(imageFile.value,),
    //                                       fit: BoxFit.fill,
    //                                     ),
    //                                     boxShadow: [
    //                                       BoxShadow(
    //                                           color: ColorUtils.black025,
    //                                           spreadRadius: 0,
    //                                           blurRadius: 4,
    //                                           offset: Offset(0, 0)
    //                                       )
    //                                     ],
    //                                   ),
    //                                 ) :
    //                                 coverImage.value != "" ?
    //                                 Container(
    //                                   height: 100.ht(context),
    //                                   width: 100.wt(context),
    //                                   decoration: BoxDecoration(
    //                                     color: ColorUtils.white252,
    //                                     shape: BoxShape.circle,
    //                                     image: DecorationImage(
    //                                       image: NetworkImage(coverImage.value,),
    //                                       fit: BoxFit.fill,
    //                                     ),
    //                                     boxShadow: [
    //                                       BoxShadow(
    //                                           color: ColorUtils.black025,
    //                                           spreadRadius: 0,
    //                                           blurRadius: 4,
    //                                           offset: Offset(0, 0)
    //                                       )
    //                                     ],
    //                                   ),
    //                                 ) :
    //                                 Container(
    //                                   height: 100.ht(context),
    //                                   width: 100.wt(context),
    //                                   decoration: BoxDecoration(
    //                                     color: ColorUtils.white252,
    //                                     shape: BoxShape.circle,
    //                                     boxShadow: [
    //                                       BoxShadow(
    //                                           color: ColorUtils.black025,
    //                                           spreadRadius: 0,
    //                                           blurRadius: 4,
    //                                           offset: Offset(0, 0)
    //                                       )
    //                                     ],
    //                                   ),
    //                                   alignment: Alignment.center,
    //                                   child: Container(
    //                                     height: 59.ht(context),
    //                                     width: 59.wt(context),
    //                                     decoration: BoxDecoration(
    //                                       color: Colors.transparent,
    //                                     ),
    //                                     child: FittedBox(
    //                                       fit: BoxFit.cover,
    //                                       child: Image.asset(
    //                                         ImagePathUtils.noImageIconImagePath,
    //                                         fit: BoxFit.cover,
    //                                       ),
    //                                     ),
    //                                   ),
    //                                 ),
    //
    //
    //                                 Positioned(
    //                                   child: Container(
    //                                     height: 100.ht(context),
    //                                     width: 100.wt(context),
    //                                     decoration: BoxDecoration(
    //                                         color: Colors.transparent
    //                                     ),
    //                                     child: Column(
    //                                       mainAxisAlignment: MainAxisAlignment.end,
    //                                       crossAxisAlignment: CrossAxisAlignment.end,
    //                                       children: [
    //
    //                                         SizedBox(
    //                                           height: 30.ht(context),
    //                                           width: 30.wt(context),
    //                                           child: TextButton(
    //                                             style: TextButton.styleFrom(padding: EdgeInsets.zero),
    //                                             onPressed: () async {
    //                                               showDialog(
    //                                                 context: context,
    //                                                 builder: (BuildContext context) {
    //                                                   return AlertDialog(
    //                                                     title: Text('Select Profile Image'),
    //                                                     content: Column(
    //                                                       mainAxisSize: MainAxisSize.min,
    //                                                       children: <Widget>[
    //                                                         ListTile(
    //                                                           leading: Icon(Icons.photo_library),
    //                                                           title: Text('Gallery'),
    //                                                           onTap: () async {
    //                                                             final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    //                                                             if (pickedFile != null) {
    //                                                               print('Image selected: ${pickedFile.path}');
    //                                                               imageFile.value = File(pickedFile.path);
    //                                                               Get.back();
    //                                                               isLoading.value = true;
    //                                                               await ProfileController.getUserImageUpdateResponse(
    //                                                                 name: userName.value,
    //                                                                 image: imageFile.value,
    //                                                                 onSuccess: (e) async {
    //                                                                   isLoading.value = false;
    //                                                                   CustomSnackBar().successCustomSnackBar(context: context, message: e);
    //                                                                   Get.off(()=>ProfileScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
    //                                                                 },
    //                                                                 onFail: (e) async {
    //                                                                   isLoading.value = false;
    //                                                                   CustomSnackBar().errorCustomSnackBar(context: context, message: e);
    //                                                                 },
    //                                                                 onExceptionFail: (e) async {
    //                                                                   isLoading.value = false;
    //                                                                   CustomSnackBar().errorCustomSnackBar(context: context, message: e);
    //                                                                 },
    //                                                               );
    //                                                               Get.back();
    //                                                             } else {
    //                                                               CustomSnackBar().normalCustomSnackBar(context: context, message: 'No image selected');
    //                                                               Get.back();
    //                                                             }
    //                                                           },
    //                                                         ),
    //                                                         ListTile(
    //                                                           leading: Icon(Icons.camera_alt),
    //                                                           title: Text('Camera'),
    //                                                           onTap: () async {
    //                                                             final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
    //                                                             if (pickedFile != null) {
    //                                                               imageFile.value = File(pickedFile.path);
    //                                                               Get.back();
    //                                                               isLoading.value = true;
    //                                                               await ProfileController.getUserImageUpdateResponse(
    //                                                                 name: userName.value,
    //                                                                 image: imageFile.value,
    //                                                                 onSuccess: (e) async {
    //                                                                   isLoading.value = false;
    //                                                                   CustomSnackBar().successCustomSnackBar(context: context, message: e);
    //                                                                   Get.off(()=>ProfileScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
    //                                                                 },
    //                                                                 onFail: (e) async {
    //                                                                   isLoading.value = false;
    //                                                                   CustomSnackBar().errorCustomSnackBar(context: context, message: e);
    //                                                                 },
    //                                                                 onExceptionFail: (e) async {
    //                                                                   isLoading.value = false;
    //                                                                   CustomSnackBar().errorCustomSnackBar(context: context, message: e);
    //                                                                 },
    //                                                               );
    //                                                             } else {
    //                                                               CustomSnackBar().normalCustomSnackBar(context: context, message: 'No image selected');
    //                                                               Get.back();
    //                                                             }
    //                                                           },
    //                                                         ),
    //                                                       ],
    //                                                     ),
    //                                                   );
    //                                                 },
    //                                               );
    //
    //                                             },
    //                                             child: Container(
    //                                               height: 30.ht(context),
    //                                               width: 30.wt(context),
    //                                               decoration: BoxDecoration(
    //                                                 color: Colors.transparent,
    //                                               ),
    //                                               child: FittedBox(
    //                                                 fit: BoxFit.cover,
    //                                                 child: Image.asset(
    //                                                   ImagePathUtils.editImageIconImagePath,
    //                                                   fit: BoxFit.cover,
    //                                                 ),
    //                                               ),
    //                                             ),
    //                                           ),
    //                                         ),
    //
    //
    //                                       ],
    //                                     ),
    //                                   ),
    //                                 )
    //
    //
    //                               ],
    //                             ),
    //                           ),
    //                         ),
    //
    //
    //                         SpacerWidget.spacerWidget(spaceHeight: 20.ht(context)),
    //
    //
    //                         Container(
    //                           alignment: Alignment.center,
    //                           child: Text(
    //                             userName.value,
    //                             textAlign: TextAlign.center,
    //                             style: GoogleFonts.tajawal(
    //                               fontWeight: FontWeight.w700,
    //                               fontStyle: FontStyle.normal,
    //                               fontSize: 20.spt(context),
    //                               color: ColorUtils.black33,
    //                             ),
    //                           ),
    //                         ),
    //
    //
    //                         SpacerWidget.spacerWidget(spaceHeight: 20.ht(context)),
    //
    //
    //                         Container(
    //                           height: 1.5.ht(context),
    //                           width: 744.wt(context),
    //                           decoration: BoxDecoration(
    //                             color: ColorUtils.white217,
    //                           ),
    //                         ),
    //
    //
    //                         SpacerWidget.spacerWidget(spaceHeight: 20.ht(context)),
    //
    //
    //
    //
    //                         SizedBox(
    //                           height: 54.ht(context),
    //                           width: 744.wt(context),
    //                           child: TextButton(
    //                             style: TextButton.styleFrom(padding: EdgeInsets.zero),
    //                             onPressed: () async {
    //                               Get.off(()=>PersonalInformationScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
    //                             },
    //                             child: Container(
    //                               height: 54.ht(context),
    //                               width: 744.wt(context),
    //                               decoration: BoxDecoration(
    //                                   color: Colors.transparent
    //                               ),
    //                               child: Row(
    //                                 children: [
    //
    //
    //                                   Expanded(
    //                                     child: Row(
    //                                       children: [
    //
    //
    //                                         Container(
    //                                           height: 24.ht(context),
    //                                           width: 24.wt(context),
    //                                           decoration: BoxDecoration(
    //                                             color: Colors.transparent,
    //                                           ),
    //                                           child: FittedBox(
    //                                             fit: BoxFit.cover,
    //                                             child: Image.asset(ImagePathUtils.profileInformationIconImagePath),
    //                                           ),
    //                                         ),
    //
    //
    //                                         SpacerWidget.spacerWidget(spaceWidth: 10.wt(context)),
    //
    //                                         Container(
    //                                           alignment: Alignment.centerLeft,
    //                                           child: Text(
    //                                             "Personal Information".tr,
    //                                             textAlign: TextAlign.center,
    //                                             style: GoogleFonts.tajawal(
    //                                               fontWeight: FontWeight.w700,
    //                                               fontStyle: FontStyle.normal,
    //                                               fontSize: 20.spt(context),
    //                                               color: ColorUtils.black33,
    //                                             ),
    //                                           ),
    //                                         ),
    //
    //
    //                                       ],
    //                                     ),
    //                                   ),
    //
    //
    //                                   SpacerWidget.spacerWidget(spaceWidth: 10.wt(context)),
    //
    //                                   Container(
    //                                     height: 24.ht(context),
    //                                     width: 24.wt(context),
    //                                     decoration: BoxDecoration(
    //                                       color: Colors.transparent,
    //                                     ),
    //                                     child: FittedBox(
    //                                       fit: BoxFit.contain,
    //                                       child: Image.asset(
    //                                         Get.locale.toString() == "en" ?
    //                                         ImagePathUtils.arrowFilledIconImagePath :
    //                                         ImagePathUtils.arrowFilledBackIconImagePath,
    //                                         fit: BoxFit.cover,
    //                                         alignment: Alignment.center,
    //                                       ),
    //                                     ),
    //                                   ),
    //
    //
    //
    //                                 ],
    //                               ),
    //                             ),
    //                           ),
    //                         ),
    //
    //
    //                         SpacerWidget.spacerWidget(spaceHeight: 8.ht(context)),
    //
    //                         SizedBox(
    //                           height: 54.ht(context),
    //                           width: 744.wt(context),
    //                           child: TextButton(
    //                             style: TextButton.styleFrom(padding: EdgeInsets.zero),
    //                             onPressed: () async {
    //                               Get.off(()=>ManageAddressScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
    //                             },
    //                             child: Container(
    //                               height: 54.ht(context),
    //                               width: 744.wt(context),
    //                               decoration: BoxDecoration(
    //                                   color: Colors.transparent
    //                               ),
    //                               child: Row(
    //                                 children: [
    //
    //
    //                                   Expanded(
    //                                     child: Row(
    //                                       children: [
    //
    //
    //                                         Container(
    //                                           height: 24.ht(context),
    //                                           width: 24.wt(context),
    //                                           decoration: BoxDecoration(
    //                                             color: Colors.transparent,
    //                                           ),
    //                                           child: FittedBox(
    //                                             fit: BoxFit.cover,
    //                                             child: Image.asset(ImagePathUtils.manageAddressIconImagePath),
    //                                           ),
    //                                         ),
    //
    //
    //                                         SpacerWidget.spacerWidget(spaceWidth: 10.wt(context)),
    //
    //                                         Container(
    //                                           alignment: Alignment.centerLeft,
    //                                           child: Text(
    //                                             "Manage Address".tr,
    //                                             textAlign: TextAlign.center,
    //                                             style: GoogleFonts.tajawal(
    //                                               fontWeight: FontWeight.w700,
    //                                               fontStyle: FontStyle.normal,
    //                                               fontSize: 20.spt(context),
    //                                               color: ColorUtils.black33,
    //                                             ),
    //                                           ),
    //                                         ),
    //
    //
    //                                       ],
    //                                     ),
    //                                   ),
    //
    //
    //                                   SpacerWidget.spacerWidget(spaceWidth: 10.wt(context)),
    //
    //                                   Container(
    //                                     height: 24.ht(context),
    //                                     width: 24.wt(context),
    //                                     decoration: BoxDecoration(
    //                                       color: Colors.transparent,
    //                                     ),
    //                                     child: FittedBox(
    //                                       fit: BoxFit.contain,
    //                                       child: Image.asset(
    //                                         Get.locale.toString() == "en" ?
    //                                         ImagePathUtils.arrowFilledIconImagePath :
    //                                         ImagePathUtils.arrowFilledBackIconImagePath,
    //                                         fit: BoxFit.cover,
    //                                         alignment: Alignment.center,
    //                                       ),
    //                                     ),
    //                                   ),
    //
    //
    //
    //                                 ],
    //                               ),
    //                             ),
    //                           ),
    //                         ),
    //
    //
    //                         SpacerWidget.spacerWidget(spaceHeight: 8.ht(context)),
    //
    //                         // SizedBox(
    //                         //   height: 54.ht(context),
    //                         //   width: 744.wt(context),
    //                         //   child: TextButton(
    //                         //     style: TextButton.styleFrom(padding: EdgeInsets.zero),
    //                         //     onPressed: () async {
    //                         //       Get.off(()=>PaymentMethodsScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
    //                         //     },
    //                         //     child: Container(
    //                         //       height: 54.ht(context),
    //                         //       width: 744.wt(context),
    //                         //       decoration: BoxDecoration(
    //                         //           color: Colors.transparent
    //                         //       ),
    //                         //       child: Row(
    //                         //         children: [
    //                         //
    //                         //
    //                         //           Expanded(
    //                         //             child: Row(
    //                         //               children: [
    //                         //
    //                         //
    //                         //                 Container(
    //                         //                   height: 24.ht(context),
    //                         //                   width: 24.wt(context),
    //                         //                   decoration: BoxDecoration(
    //                         //                     color: Colors.transparent,
    //                         //                   ),
    //                         //                   child: FittedBox(
    //                         //                     fit: BoxFit.cover,
    //                         //                     child: Image.asset(ImagePathUtils.paymentMethodIconImagePath),
    //                         //                   ),
    //                         //                 ),
    //                         //
    //                         //
    //                         //                 SpacerWidget.spacerWidget(spaceWidth: 10.wt(context)),
    //                         //
    //                         //                 Container(
    //                         //                   alignment: Alignment.centerLeft,
    //                         //                   child: Text(
    //                         //                     "Payment Methods".tr,
    //                         //                     textAlign: TextAlign.center,
    //                         //                     style: GoogleFonts.tajawal(
    //                         //                       fontWeight: FontWeight.w700,
    //                         //                       fontStyle: FontStyle.normal,
    //                         //                       fontSize: 20.spt(context),
    //                         //                       color: ColorUtils.black33,
    //                         //                     ),
    //                         //                   ),
    //                         //                 ),
    //                         //
    //                         //
    //                         //               ],
    //                         //             ),
    //                         //           ),
    //                         //
    //                         //
    //                         //           SpacerWidget.spacerWidget(spaceWidth: 10.wt(context)),
    //                         //
    //                         //           Container(
    //                         //             height: 24.ht(context),
    //                         //             width: 24.wt(context),
    //                         //             decoration: BoxDecoration(
    //                         //               color: Colors.transparent,
    //                         //             ),
    //                         //             child: FittedBox(
    //                         //               fit: BoxFit.contain,
    //                         //               child: Image.asset(
    //                         //                 Get.locale.toString() == "en" ?
    //                         //                 ImagePathUtils.arrowFilledIconImagePath :
    //                         //                 ImagePathUtils.arrowFilledBackIconImagePath,
    //                         //                 fit: BoxFit.cover,
    //                         //                 alignment: Alignment.center,
    //                         //               ),
    //                         //             ),
    //                         //           ),
    //                         //
    //                         //
    //                         //
    //                         //         ],
    //                         //       ),
    //                         //     ),
    //                         //   ),
    //                         // ),
    //
    //
    //                         SpacerWidget.spacerWidget(spaceHeight: 8.ht(context)),
    //
    //                         SizedBox(
    //                           height: 54.ht(context),
    //                           width: 744.wt(context),
    //                           child: TextButton(
    //                             style: TextButton.styleFrom(padding: EdgeInsets.zero),
    //                             onPressed: () async {
    //                               Get.off(()=>ChangePasswordScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
    //                             },
    //                             child: Container(
    //                               height: 54.ht(context),
    //                               width: 744.wt(context),
    //                               decoration: BoxDecoration(
    //                                   color: Colors.transparent
    //                               ),
    //                               child: Row(
    //                                 children: [
    //
    //
    //                                   Expanded(
    //                                     child: Row(
    //                                       children: [
    //
    //
    //                                         Container(
    //                                           height: 24.ht(context),
    //                                           width: 24.wt(context),
    //                                           decoration: BoxDecoration(
    //                                             color: Colors.transparent,
    //                                           ),
    //                                           child: FittedBox(
    //                                             fit: BoxFit.cover,
    //                                             child: Image.asset(ImagePathUtils.changePasswordIconImagePath),
    //                                           ),
    //                                         ),
    //
    //
    //                                         SpacerWidget.spacerWidget(spaceWidth: 10.wt(context)),
    //
    //                                         Container(
    //                                           alignment: Alignment.centerLeft,
    //                                           child: Text(
    //                                             "Change Password".tr,
    //                                             textAlign: TextAlign.center,
    //                                             style: GoogleFonts.tajawal(
    //                                               fontWeight: FontWeight.w700,
    //                                               fontStyle: FontStyle.normal,
    //                                               fontSize: 20.spt(context),
    //                                               color: ColorUtils.black33,
    //                                             ),
    //                                           ),
    //                                         ),
    //
    //
    //                                       ],
    //                                     ),
    //                                   ),
    //
    //
    //                                   SpacerWidget.spacerWidget(spaceWidth: 10.wt(context)),
    //
    //                                   Container(
    //                                     height: 24.ht(context),
    //                                     width: 24.wt(context),
    //                                     decoration: BoxDecoration(
    //                                       color: Colors.transparent,
    //                                     ),
    //                                     child: FittedBox(
    //                                       fit: BoxFit.contain,
    //                                       child: Image.asset(
    //                                         Get.locale.toString() == "en" ?
    //                                         ImagePathUtils.arrowFilledIconImagePath :
    //                                         ImagePathUtils.arrowFilledBackIconImagePath,
    //                                         fit: BoxFit.cover,
    //                                         alignment: Alignment.center,
    //                                       ),
    //                                     ),
    //                                   ),
    //
    //
    //
    //                                 ],
    //                               ),
    //                             ),
    //                           ),
    //                         ),
    //
    //
    //                         SpacerWidget.spacerWidget(spaceHeight: 8.ht(context)),
    //
    //                         SizedBox(
    //                           height: 54.ht(context),
    //                           width: 744.wt(context),
    //                           child: TextButton(
    //                             style: TextButton.styleFrom(padding: EdgeInsets.zero),
    //                             onPressed: () async {
    //                               Get.off(()=>RatingAndReviewScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
    //                             },
    //                             child: Container(
    //                               height: 54.ht(context),
    //                               width: 744.wt(context),
    //                               decoration: BoxDecoration(
    //                                   color: Colors.transparent
    //                               ),
    //                               child: Row(
    //                                 children: [
    //
    //
    //                                   Expanded(
    //                                     child: Row(
    //                                       children: [
    //
    //
    //                                         Container(
    //                                           height: 24.ht(context),
    //                                           width: 24.wt(context),
    //                                           decoration: BoxDecoration(
    //                                             color: Colors.transparent,
    //                                           ),
    //                                           child: FittedBox(
    //                                             fit: BoxFit.cover,
    //                                             child: Image.asset(ImagePathUtils.ratingAndReviewIconImagePath),
    //                                           ),
    //                                         ),
    //
    //
    //                                         SpacerWidget.spacerWidget(spaceWidth: 10.wt(context)),
    //
    //                                         Container(
    //                                           alignment: Alignment.centerLeft,
    //                                           child: Text(
    //                                             "Rating and Review".tr,
    //                                             textAlign: TextAlign.center,
    //                                             style: GoogleFonts.tajawal(
    //                                               fontWeight: FontWeight.w700,
    //                                               fontStyle: FontStyle.normal,
    //                                               fontSize: 20.spt(context),
    //                                               color: ColorUtils.black33,
    //                                             ),
    //                                           ),
    //                                         ),
    //
    //
    //                                       ],
    //                                     ),
    //                                   ),
    //
    //
    //                                   SpacerWidget.spacerWidget(spaceWidth: 10.wt(context)),
    //
    //                                   Container(
    //                                     height: 24.ht(context),
    //                                     width: 24.wt(context),
    //                                     decoration: BoxDecoration(
    //                                       color: Colors.transparent,
    //                                     ),
    //                                     child: FittedBox(
    //                                       fit: BoxFit.contain,
    //                                       child: Image.asset(
    //                                         Get.locale.toString() == "en" ?
    //                                         ImagePathUtils.arrowFilledIconImagePath :
    //                                         ImagePathUtils.arrowFilledBackIconImagePath,
    //                                         fit: BoxFit.cover,
    //                                         alignment: Alignment.center,
    //                                       ),
    //                                     ),
    //                                   ),
    //
    //
    //
    //                                 ],
    //                               ),
    //                             ),
    //                           ),
    //                         ),
    //
    //
    //                         SpacerWidget.spacerWidget(spaceHeight: 8.ht(context)),
    //
    //                         SizedBox(
    //                           height: 54.ht(context),
    //                           width: 744.wt(context),
    //                           child: TextButton(
    //                             style: TextButton.styleFrom(padding: EdgeInsets.zero),
    //                             onPressed: () async {
    //                               Get.off(()=>LanguageChangeScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
    //                             },
    //                             child: Container(
    //                               height: 54.ht(context),
    //                               width: 744.wt(context),
    //                               decoration: BoxDecoration(
    //                                   color: Colors.transparent
    //                               ),
    //                               child: Row(
    //                                 children: [
    //
    //
    //                                   Expanded(
    //                                     child: Row(
    //                                       children: [
    //
    //
    //                                         Container(
    //                                           height: 24.ht(context),
    //                                           width: 24.wt(context),
    //                                           decoration: BoxDecoration(
    //                                             color: Colors.transparent,
    //                                           ),
    //                                           child: FittedBox(
    //                                             fit: BoxFit.cover,
    //                                             child: Image.asset(ImagePathUtils.languageChangeIconImagePath),
    //                                           ),
    //                                         ),
    //
    //
    //                                         SpacerWidget.spacerWidget(spaceWidth: 10.wt(context)),
    //
    //                                         Container(
    //                                           alignment: Alignment.centerLeft,
    //                                           child: Text(
    //                                             "Change App Language".tr,
    //                                             textAlign: TextAlign.center,
    //                                             style: GoogleFonts.tajawal(
    //                                               fontWeight: FontWeight.w700,
    //                                               fontStyle: FontStyle.normal,
    //                                               fontSize: 20.spt(context),
    //                                               color: ColorUtils.black33,
    //                                             ),
    //                                           ),
    //                                         ),
    //
    //
    //                                       ],
    //                                     ),
    //                                   ),
    //
    //
    //                                   SpacerWidget.spacerWidget(spaceWidth: 10.wt(context)),
    //
    //                                   Container(
    //                                     height: 24.ht(context),
    //                                     width: 24.wt(context),
    //                                     decoration: BoxDecoration(
    //                                       color: Colors.transparent,
    //                                     ),
    //                                     child: FittedBox(
    //                                       fit: BoxFit.contain,
    //                                       child: Image.asset(
    //                                         Get.locale.toString() == "en" ?
    //                                         ImagePathUtils.arrowFilledIconImagePath :
    //                                         ImagePathUtils.arrowFilledBackIconImagePath,
    //                                         fit: BoxFit.cover,
    //                                         alignment: Alignment.center,
    //                                       ),
    //                                     ),
    //                                   ),
    //
    //
    //
    //                                 ],
    //                               ),
    //                             ),
    //                           ),
    //                         ),
    //
    //
    //                         SpacerWidget.spacerWidget(spaceHeight: 8.ht(context)),
    //
    //
    //                         SizedBox(
    //                           height: 54.ht(context),
    //                           width: 744.wt(context),
    //                           child: TextButton(
    //                             style: TextButton.styleFrom(padding: EdgeInsets.zero),
    //                             onPressed: () async {
    //                               Get.off(()=> TermsAndConditionsScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
    //                             },
    //                             child: Container(
    //                               height: 54.ht(context),
    //                               width: 744.wt(context),
    //                               decoration: BoxDecoration(
    //                                   color: Colors.transparent
    //                               ),
    //                               child: Row(
    //                                 children: [
    //
    //
    //                                   Expanded(
    //                                     child: Row(
    //                                       children: [
    //
    //
    //                                         Container(
    //                                           height: 24.ht(context),
    //                                           width: 24.wt(context),
    //                                           decoration: BoxDecoration(
    //                                             color: Colors.transparent,
    //                                           ),
    //                                           child: FittedBox(
    //                                             fit: BoxFit.cover,
    //                                             child: Image.asset(ImagePathUtils.termsAndConditionIconImagePath),
    //                                           ),
    //                                         ),
    //
    //
    //                                         SpacerWidget.spacerWidget(spaceWidth: 10.wt(context)),
    //
    //                                         Container(
    //                                           alignment: Alignment.centerLeft,
    //                                           child: Text(
    //                                             "Terms and Conditions".tr,
    //                                             textAlign: TextAlign.center,
    //                                             style: GoogleFonts.tajawal(
    //                                               fontWeight: FontWeight.w700,
    //                                               fontStyle: FontStyle.normal,
    //                                               fontSize: 20.spt(context),
    //                                               color: ColorUtils.black33,
    //                                             ),
    //                                           ),
    //                                         ),
    //
    //
    //                                       ],
    //                                     ),
    //                                   ),
    //
    //
    //                                   SpacerWidget.spacerWidget(spaceWidth: 10.wt(context)),
    //
    //                                   Container(
    //                                     height: 24.ht(context),
    //                                     width: 24.wt(context),
    //                                     decoration: BoxDecoration(
    //                                       color: Colors.transparent,
    //                                     ),
    //                                     child: FittedBox(
    //                                       fit: BoxFit.contain,
    //                                       child: Image.asset(
    //                                         Get.locale.toString() == "en" ?
    //                                         ImagePathUtils.arrowFilledIconImagePath :
    //                                         ImagePathUtils.arrowFilledBackIconImagePath,
    //                                         fit: BoxFit.cover,
    //                                         alignment: Alignment.center,
    //                                       ),
    //                                     ),
    //                                   ),
    //
    //
    //
    //                                 ],
    //                               ),
    //                             ),
    //                           ),
    //                         ),
    //
    //                         SpacerWidget.spacerWidget(spaceHeight: 8.hm(context)),
    //
    //                         SizedBox(
    //                           height: 54.ht(context),
    //                           width: 744.wt(context),
    //                           child: TextButton(
    //                             style: TextButton.styleFrom(padding: EdgeInsets.zero),
    //                             onPressed: () async {
    //                               Get.off(()=> HelpCenterScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
    //                             },
    //                             child: Container(
    //                               height: 54.ht(context),
    //                               width: 744.wt(context),
    //                               decoration: BoxDecoration(
    //                                   color: Colors.transparent
    //                               ),
    //                               child: Row(
    //                                 children: [
    //
    //
    //                                   Expanded(
    //                                     child: Row(
    //                                       children: [
    //
    //
    //                                         Container(
    //                                           height: 24.ht(context),
    //                                           width: 24.wt(context),
    //                                           decoration: BoxDecoration(
    //                                             color: Colors.transparent,
    //                                           ),
    //                                           child: FittedBox(
    //                                             fit: BoxFit.cover,
    //                                             child: Image.asset(ImagePathUtils.helpCenterIconImagePath),
    //                                           ),
    //                                         ),
    //
    //
    //                                         SpacerWidget.spacerWidget(spaceWidth: 10.wt(context)),
    //
    //                                         Container(
    //                                           alignment: Alignment.centerLeft,
    //                                           child: Text(
    //                                             "Help Center".tr,
    //                                             textAlign: TextAlign.center,
    //                                             style: GoogleFonts.tajawal(
    //                                               fontWeight: FontWeight.w700,
    //                                               fontStyle: FontStyle.normal,
    //                                               fontSize: 20.spt(context),
    //                                               color: ColorUtils.black33,
    //                                             ),
    //                                           ),
    //                                         ),
    //
    //
    //                                       ],
    //                                     ),
    //                                   ),
    //
    //
    //                                   SpacerWidget.spacerWidget(spaceWidth: 10.wt(context)),
    //
    //                                   Container(
    //                                     height: 24.ht(context),
    //                                     width: 24.wt(context),
    //                                     decoration: BoxDecoration(
    //                                       color: Colors.transparent,
    //                                     ),
    //                                     child: FittedBox(
    //                                       fit: BoxFit.contain,
    //                                       child: Image.asset(
    //                                         Get.locale.toString() == "en" ?
    //                                         ImagePathUtils.arrowFilledIconImagePath :
    //                                         ImagePathUtils.arrowFilledBackIconImagePath,
    //                                         fit: BoxFit.cover,
    //                                         alignment: Alignment.center,
    //                                       ),
    //                                     ),
    //                                   ),
    //
    //
    //
    //                                 ],
    //                               ),
    //                             ),
    //                           ),
    //                         ),
    //
    //
    //
    //                       ],
    //                     ),
    //                   ),
    //                 ),
    //
    //
    //                 SpacerWidget.spacerWidget(spaceHeight: 32.ht(context)),
    //
    //
    //                 Container(
    //                   height: 48.ht(context),
    //                   width: 300.wt(context),
    //                   decoration: BoxDecoration(
    //                     color: ColorUtils.red211,
    //                     borderRadius: BorderRadius.circular(8.rt(context)),
    //                   ),
    //                   child: TextButton(
    //                     style: TextButton.styleFrom(padding: EdgeInsets.zero),
    //                     onPressed: () async {
    //                       Get.off(()=>LogoutScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
    //                     },
    //                     child: Center(
    //                       child: Text(
    //                         "Login".tr,
    //                         textAlign: TextAlign.center,
    //                         style: GoogleFonts.tajawal(
    //                           fontWeight: FontWeight.w700,
    //                           fontStyle: FontStyle.normal,
    //                           fontSize: 18.spt(context),
    //                           color: ColorUtils.white255,
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //
    //
    //                 SpacerWidget.spacerWidget(spaceHeight: 32.ht(context)),
    //
    //
    //               ],
    //             ),
    //           ),
    //
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
              child: Column(
                children: [


                  SpacerWidget.spacerWidget(spaceHeight: 20.hm(context)),


                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      "My Account".tr,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.tajawal(
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        fontSize: 16.spm(context),
                        color: ColorUtils.black255,
                      ),
                    ),
                  ),

                  SpacerWidget.spacerWidget(spaceHeight: 36.hm(context)),


                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.hpmm(context),
                    ),
                    child: Container(
                      width: 390.wm(context),
                      decoration: BoxDecoration(
                        border: Border.all(color: ColorUtils.white217,width: .5),
                        borderRadius: BorderRadius.circular(12.rm(context)),
                      ),
                      padding: EdgeInsets.only(
                        left: 20.lpmm(context),
                        right: 20.rpmm(context),
                        top: 20.tpmm(context),
                        bottom: 10.bpmm(context),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          Directionality(
                            textDirection: TextDirection.ltr,
                            child: Container(
                              height: 100.hm(context),
                              width: 100.wm(context),
                              decoration: BoxDecoration(
                                  color: Colors.transparent
                              ),
                              child: Stack(
                                fit: StackFit.expand,
                                children: [

                                  SizedBox(
                                    height: 100.hm(context),
                                    width: 100.wm(context),
                                  ),


                                  imageFile.value.path != "" ?
                                  Container(
                                    height: 100.hm(context),
                                    width: 100.wm(context),
                                    decoration: BoxDecoration(
                                      color: ColorUtils.white252,
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: FileImage(imageFile.value,),
                                        fit: BoxFit.fill,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                            color: ColorUtils.black025,
                                            spreadRadius: 0,
                                            blurRadius: 4,
                                            offset: Offset(0, 0)
                                        )
                                      ],
                                    ),
                                  ) :
                                  coverImage.value != "" ?
                                  Container(
                                    height: 100.hm(context),
                                    width: 100.wm(context),
                                    decoration: BoxDecoration(
                                      color: ColorUtils.white252,
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: NetworkImage(coverImage.value,),
                                        fit: BoxFit.fill,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                            color: ColorUtils.black025,
                                            spreadRadius: 0,
                                            blurRadius: 4,
                                            offset: Offset(0, 0)
                                        )
                                      ],
                                    ),
                                  ) :
                                  Container(
                                    height: 100.hm(context),
                                    width: 100.wm(context),
                                    decoration: BoxDecoration(
                                      color: ColorUtils.white252,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                            color: ColorUtils.black025,
                                            spreadRadius: 0,
                                            blurRadius: 4,
                                            offset: Offset(0, 0)
                                        )
                                      ],
                                    ),
                                    alignment: Alignment.center,
                                    child: Container(
                                      height: 59.hm(context),
                                      width: 59.wm(context),
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                      ),
                                      child: FittedBox(
                                        fit: BoxFit.cover,
                                        child: Image.asset(
                                          ImagePathUtils.noImageIconImagePath,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),


                                  Positioned(
                                    child: Container(
                                      height: 100.hm(context),
                                      width: 100.wm(context),
                                      decoration: BoxDecoration(
                                          color: Colors.transparent
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [

                                          SizedBox(
                                            height: 30.hm(context),
                                            width: 30.wm(context),
                                            child: TextButton(
                                              style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                              onPressed: () async {
                                                showDialog(
                                                  context: context,
                                                  builder: (BuildContext context) {
                                                    return AlertDialog(
                                                      title: Text('Select Profile Image'),
                                                      content: Column(
                                                        mainAxisSize: MainAxisSize.min,
                                                        children: <Widget>[
                                                          ListTile(
                                                            leading: Icon(Icons.photo_library),
                                                            title: Text('Gallery'),
                                                            onTap: () async {
                                                              final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
                                                              if (pickedFile != null) {
                                                                print('Image selected: ${pickedFile.path}');
                                                                imageFile.value = File(pickedFile.path);
                                                                Get.back();
                                                                isLoading.value = true;
                                                                await ProfileController.getUserImageUpdateResponse(
                                                                  name: userName.value,
                                                                  image: imageFile.value,
                                                                  onSuccess: (e) async {
                                                                    isLoading.value = false;
                                                                    CustomSnackBar().successCustomSnackBar(context: context, message: e);
                                                                    Get.off(()=>ProfileScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                                                                  },
                                                                  onFail: (e) async {
                                                                    isLoading.value = false;
                                                                    CustomSnackBar().errorCustomSnackBar(context: context, message: e);
                                                                  },
                                                                  onExceptionFail: (e) async {
                                                                    isLoading.value = false;
                                                                    CustomSnackBar().errorCustomSnackBar(context: context, message: e);
                                                                  },
                                                                );
                                                                Get.back();
                                                              } else {
                                                                CustomSnackBar().normalCustomSnackBar(context: context, message: 'No image selected');
                                                                Get.back();
                                                              }
                                                            },
                                                          ),
                                                          ListTile(
                                                            leading: Icon(Icons.camera_alt),
                                                            title: Text('Camera'),
                                                            onTap: () async {
                                                              final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
                                                              if (pickedFile != null) {
                                                                imageFile.value = File(pickedFile.path);
                                                                Get.back();
                                                                isLoading.value = true;
                                                                await ProfileController.getUserImageUpdateResponse(
                                                                  name: userName.value,
                                                                  image: imageFile.value,
                                                                  onSuccess: (e) async {
                                                                    isLoading.value = false;
                                                                    CustomSnackBar().successCustomSnackBar(context: context, message: e);
                                                                    Get.off(()=>ProfileScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                                                                  },
                                                                  onFail: (e) async {
                                                                    isLoading.value = false;
                                                                    CustomSnackBar().errorCustomSnackBar(context: context, message: e);
                                                                  },
                                                                  onExceptionFail: (e) async {
                                                                    isLoading.value = false;
                                                                    CustomSnackBar().errorCustomSnackBar(context: context, message: e);
                                                                  },
                                                                );
                                                              } else {
                                                                CustomSnackBar().normalCustomSnackBar(context: context, message: 'No image selected');
                                                                Get.back();
                                                              }
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                );

                                              },
                                              child: Container(
                                                height: 30.hm(context),
                                                width: 30.wm(context),
                                                decoration: BoxDecoration(
                                                  color: Colors.transparent,
                                                ),
                                                child: FittedBox(
                                                  fit: BoxFit.cover,
                                                  child: Image.asset(
                                                    ImagePathUtils.editImageIconImagePath,
                                                    fit: BoxFit.cover,
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
                          ),


                          SpacerWidget.spacerWidget(spaceHeight: 20.hm(context)),


                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              userName.value,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.tajawal(
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                                fontSize: 20.spm(context),
                                color: ColorUtils.black33,
                              ),
                            ),
                          ),


                          SpacerWidget.spacerWidget(spaceHeight: 20.hm(context)),


                          Container(
                            height: 1.5.hm(context),
                            width: 390.wm(context),
                            decoration: BoxDecoration(
                              color: ColorUtils.white217,
                            ),
                          ),


                          SpacerWidget.spacerWidget(spaceHeight: 20.hm(context)),




                          SizedBox(
                            height: 54.hm(context),
                            width: 390.wm(context),
                            child: TextButton(
                              style: TextButton.styleFrom(padding: EdgeInsets.zero),
                              onPressed: () async {
                                Get.off(()=>PersonalInformationScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                              },
                              child: Container(
                                height: 54.hm(context),
                                width: 390.wm(context),
                                decoration: BoxDecoration(
                                    color: Colors.transparent
                                ),
                                child: Row(
                                  children: [


                                    Expanded(
                                      child: Row(
                                        children: [


                                          Container(
                                            height: 24.hm(context),
                                            width: 24.wm(context),
                                            decoration: BoxDecoration(
                                              color: Colors.transparent,
                                            ),
                                            child: FittedBox(
                                              fit: BoxFit.cover,
                                              child: Image.asset(ImagePathUtils.profileInformationIconImagePath),
                                            ),
                                          ),


                                          SpacerWidget.spacerWidget(spaceWidth: 10.wm(context)),

                                          Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              "Personal Information".tr,
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.tajawal(
                                                fontWeight: FontWeight.w700,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 20.spm(context),
                                                color: ColorUtils.black33,
                                              ),
                                            ),
                                          ),


                                        ],
                                      ),
                                    ),


                                    SpacerWidget.spacerWidget(spaceWidth: 10.wm(context)),

                                    Container(
                                      height: 24.hm(context),
                                      width: 24.wm(context),
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                      ),
                                      child: FittedBox(
                                        fit: BoxFit.contain,
                                        child: Image.asset(
                                          Get.locale.toString() == "en" ?
                                          ImagePathUtils.arrowFilledIconImagePath :
                                          ImagePathUtils.arrowFilledBackIconImagePath,
                                          fit: BoxFit.cover,
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                    ),



                                  ],
                                ),
                              ),
                            ),
                          ),


                          SpacerWidget.spacerWidget(spaceHeight: 8.hm(context)),

                          SizedBox(
                            height: 54.hm(context),
                            width: 390.wm(context),
                            child: TextButton(
                              style: TextButton.styleFrom(padding: EdgeInsets.zero),
                              onPressed: () async {
                                Get.off(()=>ManageAddressScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                              },
                              child: Container(
                                height: 54.hm(context),
                                width: 390.wm(context),
                                decoration: BoxDecoration(
                                    color: Colors.transparent
                                ),
                                child: Row(
                                  children: [


                                    Expanded(
                                      child: Row(
                                        children: [


                                          Container(
                                            height: 24.hm(context),
                                            width: 24.wm(context),
                                            decoration: BoxDecoration(
                                              color: Colors.transparent,
                                            ),
                                            child: FittedBox(
                                              fit: BoxFit.cover,
                                              child: Image.asset(ImagePathUtils.manageAddressIconImagePath),
                                            ),
                                          ),


                                          SpacerWidget.spacerWidget(spaceWidth: 10.wm(context)),

                                          Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              "Manage Address".tr,
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.tajawal(
                                                fontWeight: FontWeight.w700,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 20.spm(context),
                                                color: ColorUtils.black33,
                                              ),
                                            ),
                                          ),


                                        ],
                                      ),
                                    ),


                                    SpacerWidget.spacerWidget(spaceWidth: 10.wm(context)),

                                    Container(
                                      height: 24.hm(context),
                                      width: 24.wm(context),
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                      ),
                                      child: FittedBox(
                                        fit: BoxFit.contain,
                                        child: Image.asset(
                                          Get.locale.toString() == "en" ?
                                          ImagePathUtils.arrowFilledIconImagePath :
                                          ImagePathUtils.arrowFilledBackIconImagePath,
                                          fit: BoxFit.cover,
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                    ),



                                  ],
                                ),
                              ),
                            ),
                          ),


                          SpacerWidget.spacerWidget(spaceHeight: 8.hm(context)),

                          // SizedBox(
                          //   height: 54.hm(context),
                          //   width: 390.wm(context),
                          //   child: TextButton(
                          //     style: TextButton.styleFrom(padding: EdgeInsets.zero),
                          //     onPressed: () async {
                          //       Get.off(()=>PaymentMethodsScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                          //     },
                          //     child: Container(
                          //       height: 54.hm(context),
                          //       width: 390.wm(context),
                          //       decoration: BoxDecoration(
                          //           color: Colors.transparent
                          //       ),
                          //       child: Row(
                          //         children: [
                          //
                          //
                          //           Expanded(
                          //             child: Row(
                          //               children: [
                          //
                          //
                          //                 Container(
                          //                   height: 24.hm(context),
                          //                   width: 24.wm(context),
                          //                   decoration: BoxDecoration(
                          //                     color: Colors.transparent,
                          //                   ),
                          //                   child: FittedBox(
                          //                     fit: BoxFit.cover,
                          //                     child: Image.asset(ImagePathUtils.paymentMethodIconImagePath),
                          //                   ),
                          //                 ),
                          //
                          //
                          //                 SpacerWidget.spacerWidget(spaceWidth: 10.wm(context)),
                          //
                          //                 Container(
                          //                   alignment: Alignment.centerLeft,
                          //                   child: Text(
                          //                     "Payment Methods".tr,
                          //                     textAlign: TextAlign.center,
                          //                     style: GoogleFonts.tajawal(
                          //                       fontWeight: FontWeight.w700,
                          //                       fontStyle: FontStyle.normal,
                          //                       fontSize: 20.spm(context),
                          //                       color: ColorUtils.black33,
                          //                     ),
                          //                   ),
                          //                 ),
                          //
                          //
                          //               ],
                          //             ),
                          //           ),
                          //
                          //
                          //           SpacerWidget.spacerWidget(spaceWidth: 10.wm(context)),
                          //
                          //           Container(
                          //             height: 24.hm(context),
                          //             width: 24.wm(context),
                          //             decoration: BoxDecoration(
                          //               color: Colors.transparent,
                          //             ),
                          //             child: FittedBox(
                          //               fit: BoxFit.contain,
                          //               child: Image.asset(
                          //                 Get.locale.toString() == "en" ?
                          //                 ImagePathUtils.arrowFilledIconImagePath :
                          //                 ImagePathUtils.arrowFilledBackIconImagePath,
                          //                 fit: BoxFit.cover,
                          //                 alignment: Alignment.center,
                          //               ),
                          //             ),
                          //           ),
                          //
                          //
                          //
                          //         ],
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          //
                          //
                          // SpacerWidget.spacerWidget(spaceHeight: 8.hm(context)),

                          SizedBox(
                            height: 54.hm(context),
                            width: 390.wm(context),
                            child: TextButton(
                              style: TextButton.styleFrom(padding: EdgeInsets.zero),
                              onPressed: () async {
                                Get.off(()=>ChangePasswordScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                              },
                              child: Container(
                                height: 54.hm(context),
                                width: 390.wm(context),
                                decoration: BoxDecoration(
                                    color: Colors.transparent
                                ),
                                child: Row(
                                  children: [


                                    Expanded(
                                      child: Row(
                                        children: [


                                          Container(
                                            height: 24.hm(context),
                                            width: 24.wm(context),
                                            decoration: BoxDecoration(
                                              color: Colors.transparent,
                                            ),
                                            child: FittedBox(
                                              fit: BoxFit.cover,
                                              child: Image.asset(ImagePathUtils.changePasswordIconImagePath),
                                            ),
                                          ),


                                          SpacerWidget.spacerWidget(spaceWidth: 10.wm(context)),

                                          Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              "Change Password".tr,
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.tajawal(
                                                fontWeight: FontWeight.w700,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 20.spm(context),
                                                color: ColorUtils.black33,
                                              ),
                                            ),
                                          ),


                                        ],
                                      ),
                                    ),


                                    SpacerWidget.spacerWidget(spaceWidth: 10.wm(context)),

                                    Container(
                                      height: 24.hm(context),
                                      width: 24.wm(context),
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                      ),
                                      child: FittedBox(
                                        fit: BoxFit.contain,
                                        child: Image.asset(
                                          Get.locale.toString() == "en" ?
                                          ImagePathUtils.arrowFilledIconImagePath :
                                          ImagePathUtils.arrowFilledBackIconImagePath,
                                          fit: BoxFit.cover,
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                    ),



                                  ],
                                ),
                              ),
                            ),
                          ),


                          SpacerWidget.spacerWidget(spaceHeight: 8.hm(context)),

                          SizedBox(
                            height: 54.hm(context),
                            width: 390.wm(context),
                            child: TextButton(
                              style: TextButton.styleFrom(padding: EdgeInsets.zero),
                              onPressed: () async {
                                Get.off(()=>OrderHistoryScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);

                                //Get.off(()=>RatingAndReviewScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                              },
                              child: Container(
                                height: 54.hm(context),
                                width: 390.wm(context),
                                decoration: BoxDecoration(
                                    color: Colors.transparent
                                ),
                                child: Row(
                                  children: [


                                    Expanded(
                                      child: Row(
                                        children: [


                                          Container(
                                            height: 24.hm(context),
                                            width: 24.wm(context),
                                            decoration: BoxDecoration(
                                              color: Colors.transparent,
                                            ),
                                            child: FittedBox(
                                              fit: BoxFit.cover,
                                              child: Image.asset(ImagePathUtils.ratingAndReviewIconImagePath),
                                            ),
                                          ),


                                          SpacerWidget.spacerWidget(spaceWidth: 10.wm(context)),

                                          Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              "Order History".tr,
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.tajawal(
                                                fontWeight: FontWeight.w700,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 20.spm(context),
                                                color: ColorUtils.black33,
                                              ),
                                            ),
                                          ),


                                        ],
                                      ),
                                    ),


                                    SpacerWidget.spacerWidget(spaceWidth: 10.wm(context)),

                                    Container(
                                      height: 24.hm(context),
                                      width: 24.wm(context),
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                      ),
                                      child: FittedBox(
                                        fit: BoxFit.contain,
                                        child: Image.asset(
                                          Get.locale.toString() == "en" ?
                                          ImagePathUtils.arrowFilledIconImagePath :
                                          ImagePathUtils.arrowFilledBackIconImagePath,
                                          fit: BoxFit.cover,
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                    ),



                                  ],
                                ),
                              ),
                            ),
                          ),


                          SpacerWidget.spacerWidget(spaceHeight: 8.hm(context)),

                          SizedBox(
                            height: 54.hm(context),
                            width: 390.wm(context),
                            child: TextButton(
                              style: TextButton.styleFrom(padding: EdgeInsets.zero),
                              onPressed: () async {
                                Get.off(()=>LanguageChangeScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                              },
                              child: Container(
                                height: 54.hm(context),
                                width: 390.wm(context),
                                decoration: BoxDecoration(
                                    color: Colors.transparent
                                ),
                                child: Row(
                                  children: [


                                    Expanded(
                                      child: Row(
                                        children: [


                                          Container(
                                            height: 24.hm(context),
                                            width: 24.wm(context),
                                            decoration: BoxDecoration(
                                              color: Colors.transparent,
                                            ),
                                            child: FittedBox(
                                              fit: BoxFit.cover,
                                              child: Image.asset(ImagePathUtils.languageChangeIconImagePath),
                                            ),
                                          ),


                                          SpacerWidget.spacerWidget(spaceWidth: 10.wm(context)),

                                          Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              "Change App Language".tr,
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.tajawal(
                                                fontWeight: FontWeight.w700,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 20.spm(context),
                                                color: ColorUtils.black33,
                                              ),
                                            ),
                                          ),


                                        ],
                                      ),
                                    ),


                                    SpacerWidget.spacerWidget(spaceWidth: 10.wm(context)),

                                    Container(
                                      height: 24.hm(context),
                                      width: 24.wm(context),
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                      ),
                                      child: FittedBox(
                                        fit: BoxFit.contain,
                                        child: Image.asset(
                                          Get.locale.toString() == "en" ?
                                          ImagePathUtils.arrowFilledIconImagePath :
                                          ImagePathUtils.arrowFilledBackIconImagePath,
                                          fit: BoxFit.cover,
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                    ),



                                  ],
                                ),
                              ),
                            ),
                          ),


                          SpacerWidget.spacerWidget(spaceHeight: 8.hm(context)),


                          SizedBox(
                            height: 54.hm(context),
                            width: 390.wm(context),
                            child: TextButton(
                              style: TextButton.styleFrom(padding: EdgeInsets.zero),
                              onPressed: () async {
                                Get.off(()=> TermsAndConditionsScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                              },
                              child: Container(
                                height: 54.hm(context),
                                width: 390.wm(context),
                                decoration: BoxDecoration(
                                    color: Colors.transparent
                                ),
                                child: Row(
                                  children: [


                                    Expanded(
                                      child: Row(
                                        children: [


                                          Container(
                                            height: 24.hm(context),
                                            width: 24.wm(context),
                                            decoration: BoxDecoration(
                                              color: Colors.transparent,
                                            ),
                                            child: FittedBox(
                                              fit: BoxFit.cover,
                                              child: Image.asset(ImagePathUtils.termsAndConditionIconImagePath),
                                            ),
                                          ),


                                          SpacerWidget.spacerWidget(spaceWidth: 10.wm(context)),

                                          Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              "Terms and Conditions".tr,
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.tajawal(
                                                fontWeight: FontWeight.w700,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 20.spm(context),
                                                color: ColorUtils.black33,
                                              ),
                                            ),
                                          ),


                                        ],
                                      ),
                                    ),


                                    SpacerWidget.spacerWidget(spaceWidth: 10.wm(context)),

                                    Container(
                                      height: 24.hm(context),
                                      width: 24.wm(context),
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                      ),
                                      child: FittedBox(
                                        fit: BoxFit.contain,
                                        child: Image.asset(
                                          Get.locale.toString() == "en" ?
                                          ImagePathUtils.arrowFilledIconImagePath :
                                          ImagePathUtils.arrowFilledBackIconImagePath,
                                          fit: BoxFit.cover,
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                    ),



                                  ],
                                ),
                              ),
                            ),
                          ),

                          SpacerWidget.spacerWidget(spaceHeight: 8.hm(context)),

                          SizedBox(
                            height: 54.hm(context),
                            width: 390.wm(context),
                            child: TextButton(
                              style: TextButton.styleFrom(padding: EdgeInsets.zero),
                              onPressed: () async {
                                Get.off(()=>HelpCenterScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                              },
                              child: Container(
                                height: 54.hm(context),
                                width: 390.wm(context),
                                decoration: BoxDecoration(
                                    color: Colors.transparent
                                ),
                                child: Row(
                                  children: [


                                    Expanded(
                                      child: Row(
                                        children: [


                                          Container(
                                            height: 24.hm(context),
                                            width: 24.wm(context),
                                            decoration: BoxDecoration(
                                              color: Colors.transparent,
                                            ),
                                            child: FittedBox(
                                              fit: BoxFit.cover,
                                              child: Image.asset(ImagePathUtils.helpCenterIconImagePath),
                                            ),
                                          ),


                                          SpacerWidget.spacerWidget(spaceWidth: 10.wm(context)),

                                          Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              "Help Center".tr,
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.tajawal(
                                                fontWeight: FontWeight.w700,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 20.spm(context),
                                                color: ColorUtils.black33,
                                              ),
                                            ),
                                          ),


                                        ],
                                      ),
                                    ),


                                    SpacerWidget.spacerWidget(spaceWidth: 10.wm(context)),

                                    Container(
                                      height: 24.hm(context),
                                      width: 24.wm(context),
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                      ),
                                      child: FittedBox(
                                        fit: BoxFit.contain,
                                        child: Image.asset(
                                          Get.locale.toString() == "en" ?
                                          ImagePathUtils.arrowFilledIconImagePath :
                                          ImagePathUtils.arrowFilledBackIconImagePath,
                                          fit: BoxFit.cover,
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                    ),



                                  ],
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
                    width: 300.wm(context),
                    decoration: BoxDecoration(
                      color: ColorUtils.red211,
                      borderRadius: BorderRadius.circular(8.rm(context)),
                    ),
                    child: TextButton(
                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                      onPressed: () async {
                        Get.off(()=>LogoutScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                      },
                      child: Center(
                        child: Text(
                          "Sign out".tr,
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


                  SpacerWidget.spacerWidget(spaceHeight: 32.hm(context)),


                ],
              ),
            ),



          ],
        ) : Center(child: CircularProgressIndicator(),),
      ),
    ));
  }


}