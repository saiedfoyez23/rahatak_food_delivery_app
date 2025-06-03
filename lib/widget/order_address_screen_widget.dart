import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rahatak_food_delivery_app/controller/address_controller.dart';
import 'package:rahatak_food_delivery_app/controller/controller.dart';
import 'package:rahatak_food_delivery_app/model/model.dart';
import 'package:rahatak_food_delivery_app/screen/add_new_address_screen.dart';
import 'package:rahatak_food_delivery_app/utils/utils.dart';

import '../screen/screen.dart';

class OrderAddressScreenWidget extends GetxController {

  RxString addressId = "".obs;
  RxBool isLoading = false.obs;
  RxString governorate = "".obs;
  RxString state = "".obs;
  RxString city = "".obs;
  RxString phoneNumber = "".obs;
  BuildContext context;
  Rx<AddressesResponseModel> addressesResponseModel = AddressesResponseModel().obs;
  OrderAddressScreenWidget({required this.context});

  GoogleMapController? googleMapController;
  RxDouble updatedLat = 0.0.obs;
  RxDouble updatedLong = 0.0.obs;

  Future<Position> _determinePosition() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    return position;
  }


  Future<void> checkLocationPermission() async {
    Future.delayed(const Duration(milliseconds: 500),() async {
      LocationPermission permission;
      var checkPermission = await Geolocator.checkPermission();
      permission = await Geolocator.requestPermission();
      print(permission);
      if(permission == LocationPermission.denied){
        await checkLocationPermission();
      }else if(permission == LocationPermission.deniedForever){
      }else {
        await updateCurrentLocation();
      }
    });
  }

  Future<void> updateCurrentLocation() async {
    try {
      Position position = await _determinePosition();
      googleMapController?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
              target: LatLng(position.latitude, position.longitude),
              zoom: 19.151926040649414
          ),
        ),
      );

      updatedLat.value = position.latitude;
      updatedLong.value = position.longitude;
      await _getAddressFromLatLng(position.latitude, position.longitude);

      print(updatedLong.value);
      print(updatedLat.value);

    } catch (e) {
      // Handle exceptions
    }
  }


  Future<void> _getAddressFromLatLng(double lat, double lng) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
      Placemark place = placemarks[0];
      state.value = place.country ?? "";
      governorate.value = place.administrativeArea ?? "";
      city.value = place.locality ?? "";
      await ProfileController.checkLocalProfileResponse().then((value) {
        if(value != null) {
          phoneNumber.value = value.data?.contact ?? "";
        }
      });
    } catch (e) {
      print("Place in not found");
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
      await checkLocationPermission();
      await AddressController.getAddressResponse(
        onSuccess: (e) async {
          isLoading.value = false;
          await AddressController.checkLocalAddressesResponse().then((value) {
            addressesResponseModel.value = value!;
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


  Widget orderAddressScreenWidget({required BuildContext context}) {
    // if(MediaQuery.sizeOf(context).height > 1000) {
    //   return SafeArea(
    //     child: Container(
    //         height: 1133.ht(context),
    //         width: 744.wt(context),
    //         decoration: BoxDecoration(
    //           color: ColorUtils.white255,
    //         ),
    //         child: Column(
    //           children: [
    //
    //
    //             Expanded(
    //               child: CustomScrollView(
    //                 slivers: [
    //
    //
    //                   SliverToBoxAdapter(
    //                     child: Column(
    //                       children: [
    //
    //                         SpacerWidget.spacerWidget(spaceHeight: 11.ht(context),),
    //
    //                         Directionality(
    //                           textDirection: TextDirection.ltr,
    //                           child: Padding(
    //                             padding: EdgeInsets.symmetric(horizontal: 37.hpmt(context)),
    //                             child: Row(
    //                               mainAxisAlignment: MainAxisAlignment.start,
    //                               children: [
    //
    //                                 Container(
    //                                   height: 40.ht(context),
    //                                   width: 40.wt(context),
    //                                   decoration: BoxDecoration(
    //                                     color: Colors.transparent,
    //                                   ),
    //                                   child: TextButton(
    //                                     style: TextButton.styleFrom(padding: EdgeInsets.zero),
    //                                     onPressed: () {
    //                                       Get.off(()=>CartScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
    //                                     },
    //                                     child: FittedBox(
    //                                       fit: BoxFit.cover,
    //                                       child: Image.asset(
    //                                         ImagePathUtils.authorizationBackButtonImagePath,
    //                                         fit: BoxFit.cover,
    //                                         alignment: Alignment.center,
    //                                       ),
    //                                     ),
    //                                   ),
    //                                 ),
    //
    //
    //                                 Expanded(
    //                                   child: Container(
    //                                     alignment: Alignment.center,
    //                                     child: Text(
    //                                       "Specify the address".tr,
    //                                       textAlign: TextAlign.center,
    //                                       style: GoogleFonts.tajawal(
    //                                         fontWeight: FontWeight.w700,
    //                                         fontStyle: FontStyle.normal,
    //                                         fontSize: 16.spt(context),
    //                                         color: ColorUtils.black255,
    //                                       ),
    //                                     ),
    //                                   ),
    //                                 ),
    //
    //                               ],
    //                             ),
    //                           ),
    //                         ),
    //
    //
    //
    //                         Padding(
    //                           padding: EdgeInsets.symmetric(horizontal: 138.hpmt(context)),
    //                           child: Column(
    //                             children: [
    //
    //                               SpacerWidget.spacerWidget(spaceHeight: 26.ht(context),),
    //
    //
    //                               Container(
    //                                 padding: EdgeInsets.symmetric(vertical: 10.vpmt(context),horizontal: 10.hpmt(context)),
    //                                 decoration: BoxDecoration(
    //                                   border: Border.all(width: 0.5,color: ColorUtils.gray190),
    //                                   borderRadius: BorderRadius.circular(10.rt(context)),
    //                                 ),
    //                                 child: Row(
    //                                   mainAxisAlignment: MainAxisAlignment.start,
    //                                   crossAxisAlignment: CrossAxisAlignment.center,
    //                                   children: [
    //
    //
    //                                     Expanded(
    //                                       child: Column(
    //                                         mainAxisAlignment: MainAxisAlignment.start,
    //                                         crossAxisAlignment: CrossAxisAlignment.start,
    //                                         children: [
    //
    //                                           Container(
    //                                             alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
    //                                             child: Text(
    //                                               "My Home".tr,
    //                                               textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
    //                                               style: GoogleFonts.tajawal(
    //                                                 fontWeight: FontWeight.w700,
    //                                                 fontStyle: FontStyle.normal,
    //                                                 fontSize: 18.spt(context),
    //                                                 color: ColorUtils.black51,
    //                                               ),
    //                                             ),
    //                                           ),
    //
    //
    //                                           SpacerWidget.spacerWidget(spaceHeight: 6.ht(context)),
    //
    //                                           Container(
    //                                             alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
    //                                             child: Text(
    //                                               "Muscat, Al Khoud".tr,
    //                                               textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
    //                                               style: GoogleFonts.tajawal(
    //                                                 fontWeight: FontWeight.w500,
    //                                                 fontStyle: FontStyle.normal,
    //                                                 fontSize: 12.spt(context),
    //                                                 color: ColorUtils.gray136,
    //                                               ),
    //                                             ),
    //                                           ),
    //
    //                                           SpacerWidget.spacerWidget(spaceHeight: 6.ht(context)),
    //
    //                                           Container(
    //                                             alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
    //                                             child: Text(
    //                                               "+968 95ْْXXXXXX".tr,
    //                                               textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
    //                                               style: GoogleFonts.tajawal(
    //                                                 fontWeight: FontWeight.w500,
    //                                                 fontStyle: FontStyle.normal,
    //                                                 fontSize: 12.spt(context),
    //                                                 color: ColorUtils.gray136,
    //                                               ),
    //                                             ),
    //                                           ),
    //
    //                                         ],
    //                                       ),
    //                                     ),
    //
    //
    //                                     Container(
    //                                       height: 24.ht(context),
    //                                       width: 24.wt(context),
    //                                       decoration: BoxDecoration(
    //                                         color: Colors.transparent,
    //                                       ),
    //                                       child: TextButton(
    //                                         style: TextButton.styleFrom(padding: EdgeInsets.zero),
    //                                         onPressed: () {
    //                                           Get.off(()=>EditNewAddressScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
    //                                         },
    //                                         child: FittedBox(
    //                                           fit: BoxFit.cover,
    //                                           child: Image.asset(
    //                                             ImagePathUtils.editIconImagePath,
    //                                             fit: BoxFit.cover,
    //                                             alignment: Alignment.center,
    //                                           ),
    //                                         ),
    //                                       ),
    //                                     ),
    //
    //
    //
    //
    //                                   ],
    //                                 ),
    //                               ),
    //
    //                               SpacerWidget.spacerWidget(spaceHeight: 16.ht(context),),
    //
    //                               Container(
    //                                 width: 468.wt(context),
    //                                 height: 56.ht(context),
    //                                 padding: EdgeInsets.symmetric(vertical: 10.vpmt(context),horizontal: 10.hpmt(context)),
    //                                 decoration: BoxDecoration(
    //                                   border: Border.all(width: 0.5,color: ColorUtils.gray190),
    //                                   borderRadius: BorderRadius.circular(10.rt(context)),
    //                                 ),
    //                                 child: TextButton(
    //                                   style: TextButton.styleFrom(padding: EdgeInsets.zero),
    //                                   onPressed: () async {
    //                                     Get.off(()=>PaymentScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
    //                                   },
    //                                   child: Row(
    //                                     mainAxisAlignment: MainAxisAlignment.start,
    //                                     crossAxisAlignment: CrossAxisAlignment.center,
    //                                     children: [
    //
    //
    //                                       Container(
    //                                         height: 24.ht(context),
    //                                         width: 24.wt(context),
    //                                         decoration: BoxDecoration(
    //                                           color: Colors.transparent,
    //                                         ),
    //                                         child: FittedBox(
    //                                           fit: BoxFit.cover,
    //                                           child: Image.asset(
    //                                             ImagePathUtils.findLocationIconImagePath,
    //                                             fit: BoxFit.cover,
    //                                             alignment: Alignment.center,
    //                                           ),
    //                                         ),
    //                                       ),
    //
    //
    //                                       SpacerWidget.spacerWidget(spaceWidth: 10.wt(context)),
    //
    //
    //                                       Expanded(
    //                                         child: Container(
    //                                           alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
    //                                           child: Text(
    //                                             "Use my current location".tr,
    //                                             textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
    //                                             style: GoogleFonts.tajawal(
    //                                               fontWeight: FontWeight.w500,
    //                                               fontStyle: FontStyle.normal,
    //                                               fontSize: 16.spt(context),
    //                                               color: ColorUtils.black255,
    //                                             ),
    //                                           ),
    //                                         ),
    //                                       ),
    //
    //                                       SpacerWidget.spacerWidget(spaceWidth: 10.wt(context)),
    //
    //
    //                                       Container(
    //                                         height: 24.ht(context),
    //                                         width: 24.wt(context),
    //                                         decoration: BoxDecoration(
    //                                           color: Colors.transparent,
    //                                         ),
    //                                         child: FittedBox(
    //                                           fit: BoxFit.cover,
    //                                           child: Image.asset(
    //                                             Get.locale.toString() == "en" ? ImagePathUtils.arrowBackIconImagePath : ImagePathUtils.arrowForwordIconImagePath,
    //                                             fit: BoxFit.cover,
    //                                             alignment: Alignment.center,
    //                                           ),
    //                                         ),
    //                                       ),
    //
    //
    //
    //
    //                                     ],
    //                                   ),
    //                                 ),
    //                               ),
    //
    //
    //                               SpacerWidget.spacerWidget(spaceHeight: 16.ht(context),),
    //
    //                               Container(
    //                                 width: 468.wt(context),
    //                                 height: 56.ht(context),
    //                                 padding: EdgeInsets.symmetric(vertical: 10.vpmt(context),horizontal: 10.hpmt(context)),
    //                                 decoration: BoxDecoration(
    //                                   border: Border.all(width: 0.5,color: ColorUtils.gray190),
    //                                   borderRadius: BorderRadius.circular(10.rt(context)),
    //                                 ),
    //                                 child: TextButton(
    //                                   style: TextButton.styleFrom(padding: EdgeInsets.zero),
    //                                   onPressed: () {
    //                                     Get.off(()=>AddNewAddressScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
    //                                   },
    //                                   child: Row(
    //                                     mainAxisAlignment: MainAxisAlignment.start,
    //                                     crossAxisAlignment: CrossAxisAlignment.center,
    //                                     children: [
    //
    //
    //                                       Container(
    //                                         height: 24.ht(context),
    //                                         width: 24.wt(context),
    //                                         decoration: BoxDecoration(
    //                                           color: Colors.transparent,
    //                                         ),
    //                                         child: FittedBox(
    //                                           fit: BoxFit.cover,
    //                                           child: Image.asset(
    //                                             ImagePathUtils.addIconImagePath,
    //                                             fit: BoxFit.cover,
    //                                             alignment: Alignment.center,
    //                                           ),
    //                                         ),
    //                                       ),
    //
    //
    //                                       SpacerWidget.spacerWidget(spaceWidth: 10.wt(context)),
    //
    //
    //                                       Expanded(
    //                                         child: Container(
    //                                           alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
    //                                           child: Text(
    //                                             "Add a new address".tr,
    //                                             textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
    //                                             style: GoogleFonts.tajawal(
    //                                               fontWeight: FontWeight.w500,
    //                                               fontStyle: FontStyle.normal,
    //                                               fontSize: 16.spt(context),
    //                                               color: ColorUtils.black255,
    //                                             ),
    //                                           ),
    //                                         ),
    //                                       ),
    //
    //                                       SpacerWidget.spacerWidget(spaceWidth: 10.wt(context)),
    //
    //
    //                                       Container(
    //                                         height: 24.ht(context),
    //                                         width: 24.wt(context),
    //                                         decoration: BoxDecoration(
    //                                           color: Colors.transparent,
    //                                         ),
    //                                         child: FittedBox(
    //                                           fit: BoxFit.cover,
    //                                           child: Image.asset(
    //                                             Get.locale.toString() == "en" ? ImagePathUtils.arrowBackIconImagePath : ImagePathUtils.arrowForwordIconImagePath,
    //                                             fit: BoxFit.cover,
    //                                             alignment: Alignment.center,
    //                                           ),
    //                                         ),
    //                                       ),
    //
    //
    //
    //
    //                                     ],
    //                                   ),
    //                                 ),
    //                               ),
    //
    //
    //                               SpacerWidget.spacerWidget(spaceHeight: 32.ht(context),),
    //
    //
    //                               Container(
    //                                 height: 48.ht(context),
    //                                 width: 358.wt(context),
    //                                 decoration: BoxDecoration(
    //                                   color: ColorUtils.blue192,
    //                                   borderRadius: BorderRadius.circular(8.rt(context)),
    //                                 ),
    //                                 child: TextButton(
    //                                   style: TextButton.styleFrom(padding: EdgeInsets.zero),
    //                                   onPressed: () async {
    //                                     Get.off(()=>PaymentScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
    //                                   },
    //                                   child: Center(
    //                                     child: Text(
    //                                       "Save Address".tr,
    //                                       textAlign: TextAlign.center,
    //                                       style: GoogleFonts.tajawal(
    //                                         fontWeight: FontWeight.w700,
    //                                         fontStyle: FontStyle.normal,
    //                                         fontSize: 18.spt(context),
    //                                         color: ColorUtils.white255,
    //                                       ),
    //                                     ),
    //                                   ),
    //                                 ),
    //                               ),
    //
    //
    //                             ],
    //                           ),
    //                         )
    //
    //
    //
    //                       ],
    //                     ),
    //                   )
    //
    //
    //                 ],
    //               ),
    //             ),
    //
    //
    //           ],
    //         ),
    //       ),
    //   );
    // } else {
    //   return
    // }
    return Obx(()=>SafeArea(
      child: Container(
        height: 844.hm(context),
        width: 390.wm(context),
        decoration: BoxDecoration(
          color: ColorUtils.white255,
        ),
        child: isLoading.value == true ?
        Center(child: CircularProgressIndicator(),) :
        Column(
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
                                      Get.off(()=>CartScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
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
                                      "Specify the address".tr,
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


                          Column(
                            children: List.generate(addressesResponseModel.value.data!.length, (index) {
                              return Container(
                                padding: EdgeInsets.symmetric(vertical: 10.vpmm(context),horizontal: 10.hpmm(context)),
                                decoration: BoxDecoration(
                                  border:  addressId.value == addressesResponseModel.value.data?[index].sId ? Border.all(width: 2,color: ColorUtils.green142) : Border.all(width: 0.5,color: ColorUtils.gray190),
                                  borderRadius: BorderRadius.circular(10.rm(context)),
                                ),
                                margin: EdgeInsets.only(bottom: 10.bpmm(context)),
                                child: TextButton(
                                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                  onPressed: () async {
                                    addressId.value = addressesResponseModel.value.data?[index].sId;
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [


                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [

                                            Container(
                                              alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                              child: Text(
                                                "${addressesResponseModel.value.data?[index].title ?? ""}".tr,
                                                textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                                style: GoogleFonts.tajawal(
                                                  fontWeight: FontWeight.w700,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 18.spm(context),
                                                  color: ColorUtils.black51,
                                                ),
                                              ),
                                            ),


                                            SpacerWidget.spacerWidget(spaceHeight: 6.hm(context)),

                                            Container(
                                              alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                              child: Text(
                                                "${addressesResponseModel.value.data?[index].governorate ?? ""},${addressesResponseModel.value.data?[index].state ?? ""},${addressesResponseModel.value.data?[index].city ?? ""}".tr,
                                                textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                                style: GoogleFonts.tajawal(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 12.spm(context),
                                                  color: ColorUtils.gray136,
                                                ),
                                              ),
                                            ),

                                            SpacerWidget.spacerWidget(spaceHeight: 6.hm(context)),

                                            Container(
                                              alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                              child: Text(
                                                "${addressesResponseModel.value.data?[index].phone ?? ""}".tr,
                                                textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                                style: GoogleFonts.tajawal(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 12.spm(context),
                                                  color: ColorUtils.gray136,
                                                ),
                                              ),
                                            ),

                                          ],
                                        ),
                                      ),


                                      Container(
                                        height: 24.hm(context),
                                        width: 24.wm(context),
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                        ),
                                        child: TextButton(
                                          style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                          onPressed: () {
                                            Get.off(()=>EditNewAddressScreen(addressId: addressesResponseModel.value.data?[index].sId,),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                                          },
                                          child: FittedBox(
                                            fit: BoxFit.cover,
                                            child: Image.asset(
                                              ImagePathUtils.editIconImagePath,
                                              fit: BoxFit.cover,
                                              alignment: Alignment.center,
                                            ),
                                          ),
                                        ),
                                      ),




                                    ],
                                  ),
                                ),
                              );
                            }),
                          ),

                          SpacerWidget.spacerWidget(spaceHeight: 16.hm(context),),

                          Container(
                            width: 390.wm(context),
                            height: 56.hm(context),
                            padding: EdgeInsets.symmetric(vertical: 10.vpmm(context),horizontal: 10.hpmm(context)),
                            decoration: BoxDecoration(
                              border: Border.all(width: 0.5,color: ColorUtils.gray190),
                              borderRadius: BorderRadius.circular(10.rm(context)),
                            ),
                            child: TextButton(
                              style: TextButton.styleFrom(padding: EdgeInsets.zero),
                              onPressed: () async {
                                if(governorate.value == "Muscat Governorate") {
                                  Map<String,dynamic> data = {
                                    "address_data": {
                                      "title": "${city.value},${governorate.value},${state.value}",
                                      "governorate": "muscat",
                                      "state": "${state.value}",
                                      "city": "${city.value}",
                                      "location": {
                                        "coordinates": [
                                          updatedLong.value,
                                          updatedLat.value,
                                        ]
                                      },
                                      "phone": "${phoneNumber.value}"
                                    }
                                  };
                                  print(data);
                                  Get.off(()=>PaymentScreen(data: data,addressString: "",),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                                } else if(governorate.value == "Al Batinah South Governorate" || governorate.value == "Al Batinah North Governorate") {
                                  Map<String,dynamic> data = {
                                    "address_data": {
                                      "title": "${city.value},${governorate.value},${state.value}",
                                      "governorate": "al-batinah",
                                      "state": "${state.value}",
                                      "city": "${city.value}",
                                      "location": {
                                        "coordinates": [
                                          updatedLong.value,
                                          updatedLat.value,
                                        ]
                                      },
                                      "phone": "${phoneNumber.value}"
                                    }
                                  };
                                  print(data);
                                  Get.off(()=>PaymentScreen(data: data,addressString: "",),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                                } else if(governorate.value == "Ad Dakhiliyah ‍Governorate") {
                                  Map<String,dynamic> data = {
                                    "address_data": {
                                      "title": "${city.value},${governorate.value},${state.value}",
                                      "governorate": "ad-dakhiliyah",
                                      "state": "${state.value}",
                                      "city": "${city.value}",
                                      "location": {
                                        "coordinates": [
                                          updatedLong.value,
                                          updatedLat.value,
                                        ]
                                      },
                                      "phone": "${phoneNumber.value}"
                                    }
                                  };
                                  print(data);
                                  Get.off(()=>PaymentScreen(data: data,addressString: "",),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                                } else if(governorate.value == "Musandam Governorate") {
                                  Map<String,dynamic> data = {
                                    "address_data": {
                                      "title": "${city.value},${governorate.value},${state.value}",
                                      "governorate": "musandam",
                                      "state": "${state.value}",
                                      "city": "${city.value}",
                                      "location": {
                                        "coordinates": [
                                          updatedLong.value,
                                          updatedLat.value,
                                        ]
                                      },
                                      "phone": "${phoneNumber.value}"
                                    }
                                  };
                                  print(data);
                                  Get.off(()=>PaymentScreen(data: data,addressString: "",),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                                } else if(governorate.value == "Al Buraimi Governorate") {
                                  Map<String,dynamic> data = {
                                    "address_data": {
                                      "title": "${city.value},${governorate.value},${state.value}",
                                      "governorate": "al-buraimi",
                                      "state": "${state.value}",
                                      "city": "${city.value}",
                                      "location": {
                                        "coordinates": [
                                          updatedLong.value,
                                          updatedLat.value,
                                        ]
                                      },
                                      "phone": "${phoneNumber.value}"
                                    }
                                  };
                                  print(data);
                                  Get.off(()=>PaymentScreen(data: data,addressString: "",),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                                } else if(governorate.value == "Ash Sharqiyah South Governorate" || governorate.value == "Ash Sharqiyah North Governorate") {
                                  Map<String,dynamic> data = {
                                    "address_data": {
                                      "title": "${city.value},${governorate.value},${state.value}",
                                      "governorate": "sharkia",
                                      "state": "${state.value}",
                                      "city": "${city.value}",
                                      "location": {
                                        "coordinates": [
                                          updatedLong.value,
                                          updatedLat.value,
                                        ]
                                      },
                                      "phone": "${phoneNumber.value}"
                                    }
                                  };
                                  print(data);
                                  Get.off(()=>PaymentScreen(data: data,addressString: "",),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                                } else if(governorate.value == "Ad Dhahirah Governorate") {
                                  Map<String,dynamic> data = {
                                    "address_data": {
                                      "title": "${city.value},${governorate.value},${state.value}",
                                      "governorate": "al-dhahirah",
                                      "state": "${state.value}",
                                      "city": "${city.value}",
                                      "location": {
                                        "coordinates": [
                                          updatedLong.value,
                                          updatedLat.value,
                                        ]
                                      },
                                      "phone": "${phoneNumber.value}"
                                    }
                                  };
                                  print(data);
                                  Get.off(()=>PaymentScreen(data: data,addressString: "",),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                                } else if(governorate.value == "Al Wusta Governorate") {
                                  Map<String,dynamic> data = {
                                    "address_data": {
                                      "title": "${city.value},${governorate.value},${state.value}",
                                      "governorate": "al-wusta",
                                      "state": "${state.value}",
                                      "city": "${city.value}",
                                      "location": {
                                        "coordinates": [
                                          updatedLong.value,
                                          updatedLat.value,
                                        ]
                                      },
                                      "phone": "${phoneNumber.value}"
                                    }
                                  };
                                  print(data);
                                  Get.off(()=>PaymentScreen(data: data,addressString: "",),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                                }  else if(governorate.value == "Dhofar Governorate") {
                                  Map<String,dynamic> data = {
                                    "address_data": {
                                      "title": "${city.value},${governorate.value},${state.value}",
                                      "governorate": "dhofar",
                                      "state": "${state.value}",
                                      "city": "${city.value}",
                                      "location": {
                                        "coordinates": [
                                          updatedLong.value,
                                          updatedLat.value,
                                        ]
                                      },
                                      "phone": "${phoneNumber.value}"
                                    }
                                  };
                                  print(data);
                                  Get.off(()=>PaymentScreen(data: data,addressString: "",),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                                } else {
                                  Map<String,dynamic> data = {
                                    "address_data": {
                                      "title": "Muscat",
                                      "governorate": "muscat",
                                      "state": "oman",
                                      "city": "muscat",
                                      "location": {
                                        "coordinates": [
                                          58.374559,
                                          23.576667
                                        ]
                                      },
                                      "phone": "${phoneNumber.value}"
                                    }
                                  };
                                  print(data);
                                  Get.off(()=>PaymentScreen(data: data,addressString: "",),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                                }
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [


                                  Container(
                                    height: 24.hm(context),
                                    width: 24.wm(context),
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                    ),
                                    child: FittedBox(
                                      fit: BoxFit.cover,
                                      child: Image.asset(
                                        ImagePathUtils.findLocationIconImagePath,
                                        fit: BoxFit.cover,
                                        alignment: Alignment.center,
                                      ),
                                    ),
                                  ),


                                  SpacerWidget.spacerWidget(spaceWidth: 10.wm(context)),


                                  Expanded(
                                    child: Container(
                                      alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                      child: Text(
                                        "Use my current location".tr,
                                        textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                        style: GoogleFonts.tajawal(
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 16.spm(context),
                                          color: ColorUtils.black255,
                                        ),
                                      ),
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
                                      fit: BoxFit.cover,
                                      child: Image.asset(
                                        Get.locale.toString() == "en" ? ImagePathUtils.arrowBackIconImagePath : ImagePathUtils.arrowForwordIconImagePath,
                                        fit: BoxFit.cover,
                                        alignment: Alignment.center,
                                      ),
                                    ),
                                  ),




                                ],
                              ),
                            ),
                          ),


                          SpacerWidget.spacerWidget(spaceHeight: 16.hm(context),),

                          Container(
                            width: 390.wm(context),
                            height: 56.hm(context),
                            padding: EdgeInsets.symmetric(vertical: 10.vpmm(context),horizontal: 10.hpmm(context)),
                            decoration: BoxDecoration(
                              border: Border.all(width: 0.5,color: ColorUtils.gray190),
                              borderRadius: BorderRadius.circular(10.rm(context)),
                            ),
                            child: TextButton(
                              style: TextButton.styleFrom(padding: EdgeInsets.zero),
                              onPressed: () {
                                Get.off(()=>AddNewAddressScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [


                                  Container(
                                    height: 24.hm(context),
                                    width: 24.wm(context),
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                    ),
                                    child: FittedBox(
                                      fit: BoxFit.cover,
                                      child: Image.asset(
                                        ImagePathUtils.addIconImagePath,
                                        fit: BoxFit.cover,
                                        alignment: Alignment.center,
                                      ),
                                    ),
                                  ),


                                  SpacerWidget.spacerWidget(spaceWidth: 10.wm(context)),


                                  Expanded(
                                    child: Container(
                                      alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                      child: Text(
                                        "Add a new address".tr,
                                        textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                        style: GoogleFonts.tajawal(
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 16.spm(context),
                                          color: ColorUtils.black255,
                                        ),
                                      ),
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
                                      fit: BoxFit.cover,
                                      child: Image.asset(
                                        Get.locale.toString() == "en" ? ImagePathUtils.arrowBackIconImagePath : ImagePathUtils.arrowForwordIconImagePath,
                                        fit: BoxFit.cover,
                                        alignment: Alignment.center,
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
              child: Container(
                height: 48.hm(context),
                width: 358.wm(context),
                decoration: BoxDecoration(
                  color: ColorUtils.blue192,
                  borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).height > 1000 ? 8.rt(context) : 8.rm(context)),
                ),
                child: TextButton(
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  onPressed: () async {
                    if(addressId.value == "") {
                      CustomSnackBar().errorCustomSnackBar(context: context, message: "Please Select Order Address");
                    } else {
                      Get.off(()=>PaymentScreen(data: {},addressString: addressId.value,),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
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
              ),
            ),


          ],
        ),
      ),
    ));
  }


}