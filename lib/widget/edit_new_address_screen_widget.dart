import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rahatak_food_delivery_app/controller/controller.dart';
import 'package:rahatak_food_delivery_app/utils/utils.dart';

import '../screen/screen.dart';

class EditNewAddressScreenWidget extends GetxController {

  GoogleMapController? googleMapController;
  RxDouble updatedLat = 0.0.obs;
  RxDouble updatedLong = 0.0.obs;
  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<TextEditingController> phoneNumberController = TextEditingController().obs;
  Rx<TextEditingController> governorateController = TextEditingController().obs;
  Rx<TextEditingController> stateController = TextEditingController().obs;
  Rx<TextEditingController> cityController = TextEditingController().obs;
  RxBool isCheckIn = false.obs;
  BuildContext context;
  String addressId;
  RxBool isLoading = false.obs;
  RxBool isSubmit = false.obs;
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
  RxString governorate = "".obs;
  EditNewAddressScreenWidget({required this.context,required this.addressId});



  Future<Position> _determinePosition() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    return position;
  }


  Future<void> updateCurrentLocation({required String lat,required String long}) async {
    try {
      Position position = await _determinePosition();
      googleMapController?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
              target: LatLng(double.parse(lat), double.parse(long)),
              zoom: 19.151926040649414
          ),
        ),
      );

      updatedLat.value = double.parse(lat);
      updatedLong.value = double.parse(long);

      print(updatedLong.value);
      print(updatedLat.value);

    } catch (e) {
      // Handle exceptions
    }
  }


  Future<void> checkLocationPermission({required String lat,required String long}) async {
    Future.delayed(const Duration(milliseconds: 500),() async {
      LocationPermission permission;
      var checkPermission = await Geolocator.checkPermission();
      permission = await Geolocator.requestPermission();
      print(permission);
      if(permission == LocationPermission.denied){
        await checkLocationPermission(lat: lat,long: long);
      }else if(permission == LocationPermission.deniedForever){
      }else {
        await updateCurrentLocation(lat: lat,long: long);
      }
    });
  }


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(const Duration(seconds: 1),() async {
      await AddressController.getSingleAddressResponse(
        addressId: addressId,
        onSuccess: (e) async {
          await AddressController.checkLocalSingleAddressesResponse().then((value) async {
            if(value?.data != null) {
              await checkLocationPermission(lat: value!.data!.location!.coordinates!.last.toString(),long: value.data!.location!.coordinates!.first.toString());
              nameController.value.text = value.data!.title;
              phoneNumberController.value.text = value.data!.phone;
              cityController.value.text = value.data!.city;
              stateController.value.text = value.data!.state;
              governorate.value = value.data!.governorate!.first;
              isLoading.value = false;
              isCheckIn.value = true;
            }
          });
        },
        onFail: (e) async {
          isLoading.value = false;
          CustomSnackBar().errorCustomSnackBar(context: context, message: "${e}");
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
          CustomSnackBar().errorCustomSnackBar(context: context, message: "${e}");
        },
      );
    });
  }



  Widget editNewAddressScreenWidget({required BuildContext context}) {
    // if(MediaQuery.sizeOf(context).height > 1000) {
    //   return Obx(()=>SafeArea(
    //     child: Container(
    //       height: 1133.ht(context),
    //       width: 744.wt(context),
    //       decoration: BoxDecoration(
    //         color: ColorUtils.white255,
    //       ),
    //       child: Column(
    //         children: [
    //
    //
    //           Expanded(
    //             child: CustomScrollView(
    //               slivers: [
    //
    //
    //                 SliverToBoxAdapter(
    //                   child: Column(
    //                     children: [
    //
    //
    //                       SpacerWidget.spacerWidget(spaceHeight: 11.ht(context),),
    //
    //                       Padding(
    //                         padding: EdgeInsets.symmetric(horizontal: 37.hpmt(context)),
    //                         child: Directionality(
    //                           textDirection: TextDirection.ltr,
    //                           child: Row(
    //                             mainAxisAlignment: MainAxisAlignment.start,
    //                             children: [
    //
    //                               Container(
    //                                 height: 40.ht(context),
    //                                 width: 40.wt(context),
    //                                 decoration: BoxDecoration(
    //                                   color: Colors.transparent,
    //                                 ),
    //                                 child: TextButton(
    //                                   style: TextButton.styleFrom(padding: EdgeInsets.zero),
    //                                   onPressed: () {
    //                                     Get.off(()=>OrderAddressScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
    //                                   },
    //                                   child: FittedBox(
    //                                     fit: BoxFit.cover,
    //                                     child: Image.asset(
    //                                       ImagePathUtils.authorizationBackButtonImagePath,
    //                                       fit: BoxFit.cover,
    //                                       alignment: Alignment.center,
    //                                     ),
    //                                   ),
    //                                 ),
    //                               ),
    //
    //
    //                               Expanded(
    //                                 child: Container(
    //                                   alignment: Alignment.center,
    //                                   child: Text(
    //                                     "Edit Address".tr,
    //                                     textAlign: TextAlign.center,
    //                                     style: GoogleFonts.tajawal(
    //                                       fontWeight: FontWeight.w700,
    //                                       fontStyle: FontStyle.normal,
    //                                       fontSize: 16.spt(context),
    //                                       color: ColorUtils.black255,
    //                                     ),
    //                                   ),
    //                                 ),
    //                               ),
    //
    //                             ],
    //                           ),
    //                         ),
    //                       ),
    //
    //
    //
    //                       Padding(
    //                         padding: EdgeInsets.symmetric(horizontal: 138.hpmt(context)),
    //                         child: Column(
    //                           children: [
    //
    //
    //                             SpacerWidget.spacerWidget(spaceHeight: 26.ht(context),),
    //
    //
    //                             Container(
    //                               alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
    //                               child: Text(
    //                                 "Select Location".tr,
    //                                 textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
    //                                 style: GoogleFonts.tajawal(
    //                                   fontWeight: FontWeight.w700,
    //                                   fontStyle: FontStyle.normal,
    //                                   fontSize: 16.spt(context),
    //                                   color: ColorUtils.black255,
    //                                   height: (20.ht(context) / 16.spt(context)),
    //                                 ),
    //                               ),
    //                             ),
    //
    //
    //                             SpacerWidget.spacerWidget(spaceHeight: 32.ht(context),),
    //
    //                             Container(
    //                               height: 358.ht(context),
    //                               width: 468.wt(context),
    //                               decoration: BoxDecoration(
    //                                 borderRadius: BorderRadius.circular(12.rt(context)),
    //                               ),
    //                               child: ClipRRect(
    //                                 borderRadius: BorderRadius.circular(12.rt(context)),
    //                                 child: GoogleMap(
    //                                   initialCameraPosition: const CameraPosition(
    //                                       bearing: 192.8334901395799,
    //                                       target: LatLng(37.42796133580664, -122.085749655962),
    //                                       tilt: 59.440717697143555,
    //                                       zoom: 19.151926040649414
    //                                   ),
    //                                   markers: {
    //                                     Marker(
    //                                       markerId: const MarkerId('currentLocation'),
    //                                       position: LatLng(updatedLat.value, updatedLong.value),
    //                                     )
    //                                   },
    //                                   zoomControlsEnabled: false,
    //                                   mapType: MapType.normal,
    //                                   onMapCreated: (GoogleMapController controller) {
    //                                     googleMapController = controller;
    //                                   },
    //                                 ),
    //                               ),
    //                             ),
    //
    //
    //                             SpacerWidget.spacerWidget(spaceHeight: 32.ht(context),),
    //
    //
    //                             Container(
    //                               alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
    //                               child: Text(
    //                                 "Governorate".tr,
    //                                 textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
    //                                 style: GoogleFonts.tajawal(
    //                                   fontWeight: FontWeight.w500,
    //                                   fontStyle: FontStyle.normal,
    //                                   fontSize: 16.spt(context),
    //                                   color: ColorUtils.black255,
    //                                 ),
    //                               ),
    //                             ),
    //
    //                             SpacerWidget.spacerWidget(spaceHeight: 12.ht(context),),
    //
    //
    //                             TextFormField(
    //                               controller: governorateController.value,
    //                               textAlign: TextAlign.start,
    //                               cursorColor: ColorUtils.blue192,
    //                               cursorHeight: 20.ht(context),
    //                               style: GoogleFonts.tajawal(
    //                                 fontSize: 16.spt(context),
    //                                 fontStyle: FontStyle.normal,
    //                                 color: ColorUtils.black51,
    //                                 fontWeight: FontWeight.w400,
    //                               ),
    //                               textAlignVertical: TextAlignVertical.center,
    //                               decoration: InputDecoration(
    //                                 hintText: "Enter Governorate".tr,
    //                                 hintStyle: GoogleFonts.tajawal(
    //                                   fontSize: 16.spt(context),
    //                                   fontWeight: FontWeight.w400,
    //                                   fontStyle: FontStyle.normal,
    //                                   color: ColorUtils.gray136,
    //                                 ),
    //                                 filled: true,
    //                                 fillColor: ColorUtils.white255,
    //                                 contentPadding: EdgeInsets.symmetric(
    //                                   horizontal: 12.hpmt(context),
    //                                   vertical: 12.vpmt(context),
    //                                 ),
    //                                 constraints: BoxConstraints(
    //                                   maxHeight: 48.hm(context),
    //                                 ),
    //                                 border: OutlineInputBorder(
    //                                   borderRadius: BorderRadius.circular(8.rt(context)),
    //                                   borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
    //                                 ),
    //                                 enabledBorder: OutlineInputBorder(
    //                                   borderRadius: BorderRadius.circular(8.rt(context)),
    //                                   borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
    //                                 ),
    //                                 focusedBorder: OutlineInputBorder(
    //                                   borderRadius: BorderRadius.circular(8.rt(context)),
    //                                   borderSide: BorderSide(color: ColorUtils.blue192,width: 1),
    //                                 ),
    //
    //                               ),
    //                             ),
    //
    //
    //                             SpacerWidget.spacerWidget(spaceHeight: 12.ht(context),),
    //
    //
    //                             Row(
    //                               mainAxisAlignment: MainAxisAlignment.center,
    //                               children: [
    //
    //                                 Column(
    //                                   crossAxisAlignment: CrossAxisAlignment.start,
    //                                   children: [
    //
    //                                     Container(
    //                                       alignment: Alignment.centerLeft,
    //                                       child: Text(
    //                                         "state".tr,
    //                                         textAlign: TextAlign.start,
    //                                         style: GoogleFonts.tajawal(
    //                                           fontWeight: FontWeight.w500,
    //                                           fontStyle: FontStyle.normal,
    //                                           fontSize: 16.spt(context),
    //                                           color: ColorUtils.black255,
    //                                         ),
    //                                       ),
    //                                     ),
    //
    //                                     SpacerWidget.spacerWidget(spaceHeight: 12.ht(context),),
    //
    //
    //                                     TextFormField(
    //                                       controller: stateController.value,
    //                                       textAlign: TextAlign.start,
    //                                       cursorColor: ColorUtils.blue192,
    //                                       cursorHeight: 20.ht(context),
    //                                       style: GoogleFonts.tajawal(
    //                                         fontSize: 16.spt(context),
    //                                         fontStyle: FontStyle.normal,
    //                                         color: ColorUtils.black51,
    //                                         fontWeight: FontWeight.w400,
    //                                       ),
    //                                       textAlignVertical: TextAlignVertical.center,
    //                                       decoration: InputDecoration(
    //                                         hintText: "Enter State".tr,
    //                                         hintStyle: GoogleFonts.tajawal(
    //                                           fontSize: 16.spt(context),
    //                                           fontWeight: FontWeight.w400,
    //                                           fontStyle: FontStyle.normal,
    //                                           color: ColorUtils.gray136,
    //                                         ),
    //                                         filled: true,
    //                                         fillColor: ColorUtils.white255,
    //                                         contentPadding: EdgeInsets.symmetric(
    //                                           horizontal: 12.hpmt(context),
    //                                           vertical: 12.vpmt(context),
    //                                         ),
    //                                         constraints: BoxConstraints(
    //                                           maxWidth: 230.wt(context),
    //                                           maxHeight: 48.ht(context),
    //                                         ),
    //                                         border: OutlineInputBorder(
    //                                           borderRadius: BorderRadius.circular(8.rt(context)),
    //                                           borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
    //                                         ),
    //                                         enabledBorder: OutlineInputBorder(
    //                                           borderRadius: BorderRadius.circular(8.rt(context)),
    //                                           borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
    //                                         ),
    //                                         focusedBorder: OutlineInputBorder(
    //                                           borderRadius: BorderRadius.circular(8.rt(context)),
    //                                           borderSide: BorderSide(color: ColorUtils.blue192,width: 1),
    //                                         ),
    //
    //                                       ),
    //                                     ),
    //
    //
    //                                   ],
    //                                 ),
    //
    //
    //                                 SpacerWidget.spacerWidget(spaceWidth: 8.wt(context)),
    //
    //
    //                                 Column(
    //                                   crossAxisAlignment: CrossAxisAlignment.start,
    //                                   children: [
    //
    //                                     Container(
    //                                       alignment: Alignment.centerRight,
    //                                       child: Text(
    //                                         "City".tr,
    //                                         textAlign: TextAlign.start,
    //                                         style: GoogleFonts.tajawal(
    //                                           fontWeight: FontWeight.w500,
    //                                           fontStyle: FontStyle.normal,
    //                                           fontSize: 16.spt(context),
    //                                           color: ColorUtils.black255,
    //                                         ),
    //                                       ),
    //                                     ),
    //
    //                                     SpacerWidget.spacerWidget(spaceHeight: 12.ht(context),),
    //
    //
    //                                     TextFormField(
    //                                       controller: cityController.value,
    //                                       textAlign: TextAlign.start,
    //                                       cursorColor: ColorUtils.blue192,
    //                                       cursorHeight: 20.ht(context),
    //                                       style: GoogleFonts.tajawal(
    //                                         fontSize: 16.spt(context),
    //                                         fontStyle: FontStyle.normal,
    //                                         color: ColorUtils.black51,
    //                                         fontWeight: FontWeight.w400,
    //                                       ),
    //                                       textAlignVertical: TextAlignVertical.center,
    //                                       decoration: InputDecoration(
    //                                         hintText: "Enter City".tr,
    //                                         hintStyle: GoogleFonts.tajawal(
    //                                           fontSize: 16.spt(context),
    //                                           fontWeight: FontWeight.w400,
    //                                           fontStyle: FontStyle.normal,
    //                                           color: ColorUtils.gray136,
    //                                         ),
    //                                         filled: true,
    //                                         fillColor: ColorUtils.white255,
    //                                         contentPadding: EdgeInsets.symmetric(
    //                                           horizontal: 12.hpmt(context),
    //                                           vertical: 12.vpmt(context),
    //                                         ),
    //                                         constraints: BoxConstraints(
    //                                           maxWidth: 230.wt(context),
    //                                           maxHeight: 48.ht(context),
    //                                         ),
    //                                         border: OutlineInputBorder(
    //                                           borderRadius: BorderRadius.circular(8.rt(context)),
    //                                           borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
    //                                         ),
    //                                         enabledBorder: OutlineInputBorder(
    //                                           borderRadius: BorderRadius.circular(8.rt(context)),
    //                                           borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
    //                                         ),
    //                                         focusedBorder: OutlineInputBorder(
    //                                           borderRadius: BorderRadius.circular(8.rt(context)),
    //                                           borderSide: BorderSide(color: ColorUtils.blue192,width: 1),
    //                                         ),
    //
    //                                       ),
    //                                     ),
    //
    //
    //                                   ],
    //                                 ),
    //
    //
    //
    //
    //
    //
    //                               ],
    //                             ),
    //
    //
    //                             SpacerWidget.spacerWidget(spaceHeight: 32.ht(context),),
    //
    //
    //
    //                             Container(
    //                               height: 25.ht(context),
    //                               width: 468.wt(context),
    //                               decoration: BoxDecoration(
    //                                   color: Colors.transparent
    //                               ),
    //                               alignment: Alignment.center,
    //                               child: TextButton(
    //                                 style: TextButton.styleFrom(padding: EdgeInsets.zero),
    //                                 onPressed: () {
    //                                   if(isCheckIn.value == true) {
    //                                     isCheckIn.value = false;
    //                                   } else {
    //                                     isCheckIn.value = true;
    //                                   }
    //                                 },
    //                                 child: Row(
    //                                   crossAxisAlignment: CrossAxisAlignment.center,
    //                                   mainAxisAlignment: MainAxisAlignment.start,
    //                                   children: [
    //
    //                                     Container(
    //                                       height: 18.ht(context),
    //                                       width: 18.wt(context),
    //                                       decoration: BoxDecoration(
    //                                           color: Colors.transparent
    //                                       ),
    //                                       child: FittedBox(
    //                                         fit: BoxFit.cover,
    //                                         child: Image.asset(
    //                                           isCheckIn.value == true ?
    //                                           ImagePathUtils.checkBoxImagePath :
    //                                           ImagePathUtils.uncheckBoxImagePath,
    //                                           fit: BoxFit.cover,
    //                                           alignment: Alignment.center,
    //                                         ),
    //                                       ),
    //                                     ),
    //
    //                                     SpacerWidget.spacerWidget(spaceWidth: 8.wt(context)),
    //
    //                                     RichText(
    //                                       textAlign: TextAlign.center,
    //                                       text: TextSpan(
    //                                         text: "Save location data for later use".tr,
    //                                         style: GoogleFonts.tajawal(
    //                                           fontStyle: FontStyle.normal,
    //                                           fontSize: 14.spt(context),
    //                                           color: ColorUtils.black51,
    //                                           fontWeight: FontWeight.w500,
    //                                         ),
    //                                         children: [],
    //                                       ),
    //                                     ),
    //
    //
    //                                   ],
    //                                 ),
    //                               ),
    //                             ),
    //
    //                             SpacerWidget.spacerWidget(spaceHeight: 32.ht(context),),
    //
    //
    //                             Container(
    //                               height: 48.ht(context),
    //                               width: 358.wt(context),
    //                               decoration: BoxDecoration(
    //                                 color: ColorUtils.blue192,
    //                                 borderRadius: BorderRadius.circular(8.rt(context)),
    //                               ),
    //                               child: TextButton(
    //                                 style: TextButton.styleFrom(padding: EdgeInsets.zero),
    //                                 onPressed: () async {
    //                                   Get.off(()=>OrderAddressScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
    //                                 },
    //                                 child: Center(
    //                                   child: Text(
    //                                     "Save Address".tr,
    //                                     textAlign: TextAlign.center,
    //                                     style: GoogleFonts.tajawal(
    //                                       fontWeight: FontWeight.w700,
    //                                       fontStyle: FontStyle.normal,
    //                                       fontSize: 18.spt(context),
    //                                       color: ColorUtils.white255,
    //                                     ),
    //                                   ),
    //                                 ),
    //                               ),
    //                             ),
    //
    //
    //                           ],
    //                         ),
    //                       )
    //
    //
    //
    //
    //
    //
    //                     ],
    //                   ),
    //                 )
    //
    //
    //               ],
    //             ),
    //           ),
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
          color: ColorUtils.white255,
        ),
        child: isLoading.value == false ? Column(
          children: [


            Expanded(
              child: CustomScrollView(
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
                                      Get.off(()=>OrderAddressScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
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
                                      "Edit Address".tr,
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


                          Container(
                            alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                            child: Text(
                              "Select Location".tr,
                              textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                              style: GoogleFonts.tajawal(
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                                fontSize: 16.spm(context),
                                color: ColorUtils.black255,
                                height: (20.hm(context) / 16.spm(context)),
                              ),
                            ),
                          ),


                          SpacerWidget.spacerWidget(spaceHeight: 32.hm(context),),

                          Container(
                            height: 358.hm(context),
                            width: 358.wm(context),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.rm(context)),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12.rm(context)),
                              child: GoogleMap(
                                initialCameraPosition: const CameraPosition(
                                    bearing: 192.8334901395799,
                                    target: LatLng(37.42796133580664, -122.085749655962),
                                    tilt: 59.440717697143555,
                                    zoom: 19.151926040649414
                                ),
                                markers: {
                                  Marker(
                                    markerId: const MarkerId('currentLocation'),
                                    position: LatLng(updatedLat.value, updatedLong.value),
                                  )
                                },
                                zoomControlsEnabled: false,
                                mapType: MapType.normal,
                                onMapCreated: (GoogleMapController controller) {
                                  googleMapController = controller;
                                },
                              ),
                            ),
                          ),


                          SpacerWidget.spacerWidget(spaceHeight: 32.hm(context),),

                          Container(
                            alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                            child: Text(
                              "Name*".tr,
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
                            controller: nameController.value,
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
                              hintText: "Enter your name".tr,
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
                              "Phone Number *".tr,
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
                            controller: phoneNumberController.value,
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
                              hintText: "+968 XXXXXXXX".tr,
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
                              "Governorate".tr,
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


                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "state".tr,
                                      textAlign: TextAlign.start,
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
                                      hintText: "Enter State".tr,
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
                                        maxWidth: 175.wm(context),
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


                                ],
                              ),


                              SpacerWidget.spacerWidget(spaceWidth: 8.wm(context)),


                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "City".tr,
                                      textAlign: TextAlign.start,
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
                                      hintText: "Enter City".tr,
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
                                        maxWidth: 175.wm(context),
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


                                ],
                              ),






                            ],
                          ),


                          SpacerWidget.spacerWidget(spaceHeight: 32.hm(context),),



                          Container(
                            height: 25.hm(context),
                            width: 358.wm(context),
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
                                    height: 18.hm(context),
                                    width: 18.wm(context),
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

                                  SpacerWidget.spacerWidget(spaceWidth: 8.wm(context)),

                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      text: "Save location data for later use".tr,
                                      style: GoogleFonts.tajawal(
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14.spm(context),
                                        color: ColorUtils.black51,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      children: [],
                                    ),
                                  ),


                                ],
                              ),
                            ),
                          ),

                          SpacerWidget.spacerWidget(spaceHeight: 32.hm(context),),







                        ],
                      ),
                    ),
                  )


                ],
              ),
            ),



            Container(
              height: 100.hm(context),
              width: 390.wm(context),
              decoration: BoxDecoration(
                color: ColorUtils.white255,
              ),
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 16.hpmm(context),vertical: 10.vpmm(context)),
              child:  isSubmit.value == false ? Container(
                height: 48.hm(context),
                width: 358.wm(context),
                decoration: BoxDecoration(
                  color: ColorUtils.blue192,
                  borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).height > 1000 ? 8.rt(context) : 8.rm(context)),
                ),
                child: TextButton(
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  onPressed: () async {
                    if(nameController.value.text == "") {
                      CustomSnackBar().errorCustomSnackBar(context: context, message: "Please address title");
                    } else if(cityController.value.text == "") {
                      CustomSnackBar().errorCustomSnackBar(context: context, message: "Please enter city name");
                    } else if(governorate.value == "") {
                      CustomSnackBar().errorCustomSnackBar(context: context, message: "Please enter governorate name");
                    } else if(stateController.value.text == "") {
                      CustomSnackBar().errorCustomSnackBar(context: context, message: "Please enter state name");
                    } else if(phoneNumberController.value.text == "") {
                      CustomSnackBar().errorCustomSnackBar(context: context, message: "Please enter phone number");
                    } else {
                      if(isCheckIn.value == false) {
                        isSubmit.value = true;
                        await AddressController.getDeleteAddressResponse(
                          addressId: addressId,
                          onSuccess: (e) async {
                            isSubmit.value = false;
                            CustomSnackBar().successCustomSnackBar(context: context, message: "${e}");
                            Get.off(()=>OrderAddressScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                          },
                          onFail: (e) async {
                            isSubmit.value = false;
                            CustomSnackBar().errorCustomSnackBar(context: context, message: "${e}");
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
                            CustomSnackBar().errorCustomSnackBar(context: context, message: "${e}");
                          },
                        );
                      } else {
                        isSubmit.value = true;
                        Map<String,dynamic> data = {
                          "title": "${nameController.value.text}",
                          "governorate": "${governorate.value}",
                          "state": "${stateController.value.text}",
                          "city": "${cityController.value.text}",
                          "location": {
                            "coordinates": [
                              updatedLat.value,
                              updatedLong.value,
                            ]
                          },
                          "phone": "${phoneNumberController.value.text}",
                        };
                        print(jsonEncode(data));
                        await AddressController.getEditAddressResponse(
                          addressId: addressId,
                          data: data,
                          onSuccess: (e) async {
                            isSubmit.value = false;
                            CustomSnackBar().successCustomSnackBar(context: context, message: "${e}");
                            Get.off(()=>OrderAddressScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                          },
                          onFail: (e) async {
                            isSubmit.value = false;
                            CustomSnackBar().errorCustomSnackBar(context: context, message: "${e}");
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
                            CustomSnackBar().errorCustomSnackBar(context: context, message: "${e}");
                          },
                        );
                      }
                    }
                  },
                  child: Center(
                    child: Text(
                      "Save Address".tr,
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
              ) : Center(child: CircularProgressIndicator(),),
            ),


          ],
        ) : Center(child: CircularProgressIndicator(),),
      ),
    ));
  }


}