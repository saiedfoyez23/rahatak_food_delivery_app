import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rahatak_food_delivery_app/model/model.dart';
import 'package:rahatak_food_delivery_app/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controller/controller.dart';
import '../screen/screen.dart';

class OrderTrackScreenWidget extends GetxController {

  Rx<PickUpRequestResponseModel> pickUpRequestResponseModel = PickUpRequestResponseModel().obs;

  GoogleMapController? googleMapController;
  RxDouble updatedLat = 0.0.obs;
  RxDouble updatedLong = 0.0.obs;
  BuildContext context;
  OrderTrackScreenWidget({required this.context});


  Rx<PageController> pageController = PageController(initialPage: 1).obs;
  RxBool isLoading = false.obs;
  RxString orderId = "".obs;

  Future<Position> _determinePosition() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    return position;
  }


  Future<void> updateCurrentLocation({required double lat,required double long}) async {
    try {
      Position position = await _determinePosition();
      googleMapController?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
              target: LatLng(lat, long),
              zoom: 19.151926040649414
          ),
        ),
      );

      updatedLat.value = lat;
      updatedLong.value = long;

      print(updatedLong.value);
      print(updatedLat.value);

    } catch (e) {
      // Handle exceptions
    }
  }


  Future<void> checkLocationPermission({required double lat,required double long}) async {
    Future.delayed(const Duration(milliseconds: 500),() async {
      LocationPermission permission;
      var checkPermission = await Geolocator.checkPermission();
      permission = await Geolocator.requestPermission();
      print(permission);
      if(permission == LocationPermission.denied){
        await checkLocationPermission(lat: lat,long: long);
      }else if(permission == LocationPermission.deniedForever){
      }else {
        await updateCurrentLocation(long: long,lat: lat);
      }
    });
  }


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(const Duration(seconds: 1),() async {
      await OrderController.getUserWiseOrderList(
        onSuccess: (e) async {
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
      ).then((value) async {
        if(value.data?.data != null) {
          orderId.value = value.data!.data!.first.orderId;
          await OrderController.getOrderPickUpRequest(
            orderId: value.data!.data!.first.sId,
            onSuccess: (e) async {
              isLoading.value = false;
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
          ).then((value) async {
            pickUpRequestResponseModel.value = value;
            await checkLocationPermission(lat: value.data!.deliveryLocation!.location!.coordinates!.first,long: value.data!.deliveryLocation!.location!.coordinates!.last);
          });
        } else {
          pickUpRequestResponseModel.value = PickUpRequestResponseModel();
        }
      });
    });
  }




  Widget orderTrackScreenWidget({required BuildContext context}) {
    // if(MediaQuery.sizeOf(context).height > 1133) {
    //   return Obx(()=>Container(
    //     height: 1133.ht(context),
    //     width: 744.wt(context),
    //     decoration: BoxDecoration(
    //       color: ColorUtils.white248,
    //     ),
    //     child: Stack(
    //       children: [
    //
    //         SizedBox(
    //           height: 1133.ht(context),
    //           width: 744.wt(context),
    //         ),
    //
    //
    //         Positioned(
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.start,
    //             children: [
    //
    //               Container(
    //                 height: 605.ht(context),
    //                 width: 744.wt(context),
    //                 decoration: BoxDecoration(
    //                   borderRadius: BorderRadius.circular(12.rm(context)),
    //                 ),
    //                 child: ClipRRect(
    //                   borderRadius: BorderRadius.circular(12.rm(context)),
    //                   child: GoogleMap(
    //                     initialCameraPosition: const CameraPosition(
    //                         bearing: 192.8334901395799,
    //                         target: LatLng(37.42796133580664, -122.085749655962),
    //                         tilt: 59.440717697143555,
    //                         zoom: 19.151926040649414
    //                     ),
    //                     markers: {
    //                       Marker(
    //                         markerId: const MarkerId('currentLocation'),
    //                         position: LatLng(updatedLat.value, updatedLong.value),
    //                       )
    //                     },
    //                     zoomControlsEnabled: false,
    //                     mapType: MapType.normal,
    //                     onMapCreated: (GoogleMapController controller) {
    //                       googleMapController = controller;
    //                     },
    //                   ),
    //                 ),
    //               ),
    //
    //
    //             ],
    //           ),
    //         ),
    //
    //
    //         Positioned(
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.end,
    //             children: [
    //
    //               Container(
    //                   height: 539.ht(context),
    //                   width: 744.wt(context),
    //                   decoration: BoxDecoration(
    //                     color: ColorUtils.white248,
    //                     borderRadius: BorderRadius.only(
    //                       topLeft: Radius.circular(25.rt(context)),
    //                       topRight: Radius.circular(25.rt(context)),
    //                     ),
    //                   ),
    //                   padding: EdgeInsets.symmetric(
    //                     horizontal: 138.hpmt(context),
    //                     vertical: 26.vpmt(context),
    //                   ),
    //                   child: Column(
    //                     mainAxisAlignment: MainAxisAlignment.start,
    //                     crossAxisAlignment: CrossAxisAlignment.center,
    //                     children: [
    //
    //                       Expanded(
    //                         child: PageView(
    //                           controller: pageController.value,
    //                           children: [
    //                             pageViewBuilderOne(context: context),
    //                             pageViewBuilderTow(context: context,)
    //                           ],
    //                         ),
    //                       ),
    //
    //
    //
    //
    //                       SpacerWidget.spacerWidget(spaceHeight: 22.ht(context)),
    //
    //                       Directionality(
    //                         textDirection: TextDirection.ltr,
    //                         child: Row(
    //                           mainAxisAlignment: MainAxisAlignment.center,
    //                           crossAxisAlignment: CrossAxisAlignment.center,
    //                           children: [
    //
    //
    //                             Container(
    //                               height: 24.ht(context),
    //                               width: 24.wt(context),
    //                               decoration: BoxDecoration(
    //                                 color: Colors.transparent,
    //                               ),
    //                               child: TextButton(
    //                                 style: TextButton.styleFrom(padding: EdgeInsets.zero),
    //                                 onPressed: () async {
    //                                   pageController.value.jumpToPage(0);
    //                                 },
    //                                 child: FittedBox(
    //                                   fit: BoxFit.cover,
    //                                   child: Image.asset(
    //                                     ImagePathUtils.arrowFilledBackIconImagePath,
    //                                     fit: BoxFit.cover,
    //                                     alignment: Alignment.center,
    //                                   ),
    //                                 ),
    //                               ),
    //                             ),
    //
    //                             SpacerWidget.spacerWidget(spaceWidth: 14.wt(context)),
    //
    //                             Container(
    //                               height: 24.ht(context),
    //                               width: 24.wt(context),
    //                               decoration: BoxDecoration(
    //                                 color: Colors.transparent,
    //                               ),
    //                               child: TextButton(
    //                                 style: TextButton.styleFrom(padding: EdgeInsets.zero),
    //                                 onPressed: () async {
    //                                   pageController.value.jumpToPage(1);
    //                                 },
    //                                 child: FittedBox(
    //                                   fit: BoxFit.cover,
    //                                   child: Image.asset(
    //                                     ImagePathUtils.arrowFilledIconImagePath,
    //                                     fit: BoxFit.cover,
    //                                     alignment: Alignment.center,
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
    //                     ],
    //                   )
    //
    //               ),
    //
    //
    //             ],
    //           ),
    //         ),
    //
    //
    //       ],
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
        child: isLoading.value == false ? Stack(
          children: [

            SizedBox(
              height: 844.hm(context),
              width: 390.wm(context),
            ),


            Positioned(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  Container(
                    height: 456.hm(context),
                    width: 390.wm(context),
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


                ],
              ),
            ),


            Positioned(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

                  Container(
                      height: 420.hm(context),
                      width: 390.wm(context),
                      decoration: BoxDecoration(
                        color: ColorUtils.white248,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(25.rm(context)),topRight: Radius.circular(25.rm(context))),
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.hpmm(context),
                          vertical: 14.vpmm(context)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          Expanded(
                            child: Column(
                              children: [

                                Container(
                                  width: 390.wm(context),
                                  decoration: BoxDecoration(
                                    color: ColorUtils.blue192,
                                    border: Border.all(color: ColorUtils.white217,width: 1),
                                    borderRadius: BorderRadius.circular(10.rm(context)),
                                  ),
                                  padding: EdgeInsets.symmetric(vertical: 20.vpmm(context),horizontal: 20.hpmm(context)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [

                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [


                                          Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              "${pickUpRequestResponseModel.value.data?.rider?.name ?? ""}".tr,
                                              textAlign: TextAlign.start,
                                              style: GoogleFonts.tajawal(
                                                fontWeight: FontWeight.w700,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 20.spm(context),
                                                color: ColorUtils.white255,
                                              ),
                                            ),
                                          ),

                                          SpacerWidget.spacerWidget(spaceHeight: 16.hm(context)),


                                          Container(
                                            height: 25.hm(context),
                                            decoration: BoxDecoration(
                                                color: Colors.transparent
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [


                                                Container(
                                                  height: 25.hm(context),
                                                  alignment: Alignment.centerLeft,
                                                  child: Text(
                                                    "${orderId.value}".tr,
                                                    textAlign: TextAlign.start,
                                                    style: GoogleFonts.tajawal(
                                                      fontWeight: FontWeight.w500,
                                                      fontStyle: FontStyle.normal,
                                                      fontSize: 16.spm(context),
                                                      color: ColorUtils.white255,
                                                    ),
                                                  ),
                                                ),


                                                SpacerWidget.spacerWidget(spaceWidth: 16.wm(context)),

                                                Container(
                                                  height: 5.hm(context),
                                                  width: 5.wm(context),
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: ColorUtils.white255
                                                  ),
                                                ),


                                                SpacerWidget.spacerWidget(spaceWidth: 16.wm(context)),


                                                Container(
                                                  height: 18.hm(context),
                                                  width: 17.wm(context),
                                                  decoration: BoxDecoration(
                                                    color: Colors.transparent,
                                                  ),
                                                  child: FittedBox(
                                                    fit: BoxFit.cover,
                                                    child: Image.asset(
                                                      ImagePathUtils.starIconImagePath,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),

                                                SpacerWidget.spacerWidget(spaceWidth: 8.wm(context)),

                                                Container(
                                                  alignment: Alignment.centerLeft,
                                                  child: Text(
                                                    "${pickUpRequestResponseModel.value.data?.rider?.ratings ?? ""}".tr,
                                                    textAlign: TextAlign.start,
                                                    style: GoogleFonts.tajawal(
                                                      fontWeight: FontWeight.w500,
                                                      fontStyle: FontStyle.normal,
                                                      fontSize: 14.spm(context),
                                                      color: ColorUtils.white255,
                                                    ),
                                                  ),
                                                ),


                                              ],
                                            ),
                                          ),


                                        ],
                                      ),


                                      SizedBox(
                                        height: 40.hm(context),
                                        width: 40.wm(context),
                                        child: TextButton(
                                          style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                          onPressed: pickUpRequestResponseModel.value.data?.rider?.contact == null ? null : () async {
                                            final Uri launchUri = Uri(
                                              scheme: 'tel',
                                              path: "${pickUpRequestResponseModel.value.data?.rider?.contact}",
                                            );
                                            await launchUrl(launchUri);
                                          },
                                          child: Container(
                                            height: 40.hm(context),
                                            width: 40.wm(context),
                                            decoration: BoxDecoration(
                                              color: Colors.transparent,
                                            ),
                                            child: FittedBox(
                                              fit: BoxFit.cover,
                                              child: Image.asset(
                                                ImagePathUtils.phoneNumberIconImagePath,
                                                fit: BoxFit.cover,
                                                alignment: Alignment.center,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),






                                    ],
                                  ),
                                ),

                                SpacerWidget.spacerWidget(spaceHeight: 20.hm(context)),


                                Container(
                                  width: 390.wm(context),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10.hpmm(context),
                                    vertical: 10.vpmm(context),
                                  ),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(ImagePathUtils.dotIconImagePath),
                                        fit: BoxFit.fill,
                                      )
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [

                                      // Row(
                                      //   children: [
                                      //
                                      //
                                      //     Container(
                                      //       height: 24.hm(context),
                                      //       width: 24.wm(context),
                                      //       decoration: BoxDecoration(
                                      //           color: Colors.transparent
                                      //       ),
                                      //       child: FittedBox(
                                      //         fit: BoxFit.cover,
                                      //         child: Image.asset(
                                      //           ImagePathUtils.lightTimeLineIconImagePath,
                                      //           fit: BoxFit.cover,
                                      //           alignment: Alignment.center,
                                      //         ),
                                      //       ),
                                      //     ),
                                      //
                                      //     SpacerWidget.spacerWidget(spaceWidth: 8.wm(context)),
                                      //
                                      //
                                      //     Container(
                                      //       alignment: Alignment.centerLeft,
                                      //       child: Text(
                                      //         "20 minutes".tr,
                                      //         textAlign: TextAlign.start,
                                      //         style: GoogleFonts.tajawal(
                                      //           fontWeight: FontWeight.w500,
                                      //           fontStyle: FontStyle.normal,
                                      //           fontSize: 16.spm(context),
                                      //           color: ColorUtils.black33,
                                      //         ),
                                      //       ),
                                      //     ),
                                      //
                                      //   ],
                                      // ),

                                      Row(
                                        children: [


                                          Container(
                                            height: 24.hm(context),
                                            width: 24.wm(context),
                                            decoration: BoxDecoration(
                                                color: Colors.transparent
                                            ),
                                            child: FittedBox(
                                              fit: BoxFit.cover,
                                              child: Image.asset(
                                                ImagePathUtils.lightLocationIconImagePath,
                                                fit: BoxFit.cover,
                                                alignment: Alignment.center,
                                              ),
                                            ),
                                          ),

                                          SpacerWidget.spacerWidget(spaceWidth: 8.wm(context)),


                                          Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              "${pickUpRequestResponseModel.value.data?.deliveryLocation?.city}, ${pickUpRequestResponseModel.value.data?.deliveryLocation?.governorate?.first}, ${pickUpRequestResponseModel.value.data?.deliveryLocation?.state}".tr,
                                              textAlign: TextAlign.start,
                                              style: GoogleFonts.tajawal(
                                                fontWeight: FontWeight.w500,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 16.spm(context),
                                                color: ColorUtils.black33,
                                              ),
                                            ),
                                          ),

                                        ],
                                      ),

                                    ],
                                  ),
                                ),


                                SpacerWidget.spacerWidget(spaceHeight: 22.hm(context)),


                                Container(
                                  height: 147.hm(context),
                                  width: 390.wm(context),
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                  ),
                                  child: Row(
                                    children: [


                                      Container(
                                        width: 10.wm(context),
                                        height: 138.hm(context),
                                        decoration: BoxDecoration(
                                            color: Colors.transparent
                                        ),
                                        child: Stack(

                                          children: [

                                            SizedBox(
                                              width: 10.wm(context),
                                              height: 138.hm(context),
                                            ),


                                            Container(
                                              height: 138.hm(context),
                                              width: 10.wm(context),
                                              decoration: BoxDecoration(
                                                  color: Colors.transparent
                                              ),
                                              child: FittedBox(
                                                fit: BoxFit.contain,
                                                child: Image.asset(
                                                  ImagePathUtils.verticalLineIconImagePath,
                                                  fit: BoxFit.contain,
                                                  alignment: Alignment.center,
                                                ),
                                              ),
                                            ),



                                            Positioned(
                                              child: Container(
                                                  height: 138.hm(context),
                                                  width: 10.wm(context),
                                                  decoration: BoxDecoration(
                                                      color: Colors.transparent
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [

                                                      pickUpRequestResponseModel.value.data?.status == "requesting" ||
                                                          pickUpRequestResponseModel.value.data?.status == "received" ||
                                                          pickUpRequestResponseModel.value.data?.status == "processing" ||
                                                          pickUpRequestResponseModel.value.data?.status == "ongoing"||
                                                          pickUpRequestResponseModel.value.data?.status == "delivered" ?
                                                      Container(
                                                        height: 10.hm(context),
                                                        width: 10.wm(context),
                                                        decoration: BoxDecoration(
                                                          border: Border.all(color: ColorUtils.blue192,width: 1),
                                                          shape: BoxShape.circle,
                                                          color: ColorUtils.white255,
                                                        ),
                                                        child: Center(
                                                          child: Container(
                                                            height: 6.hm(context),
                                                            width: 6.wm(context),
                                                            decoration: BoxDecoration(
                                                              shape: BoxShape.circle,
                                                              color: ColorUtils.blue192,
                                                            ),
                                                          ),
                                                        ),
                                                      ) :
                                                      Container(
                                                        height: 10.hm(context),
                                                        width: 10.wm(context),
                                                        decoration: BoxDecoration(
                                                            border: Border.all(color: ColorUtils.blue181,width: 1),
                                                            shape: BoxShape.circle,
                                                            color: ColorUtils.white255
                                                        ),
                                                      ),



                                                      pickUpRequestResponseModel.value.data?.status == "received" ||
                                                          pickUpRequestResponseModel.value.data?.status == "processing" ||
                                                          pickUpRequestResponseModel.value.data?.status == "ongoing"||
                                                          pickUpRequestResponseModel.value.data?.status == "delivered" ?
                                                      Container(
                                                        height: 10.hm(context),
                                                        width: 10.wm(context),
                                                        decoration: BoxDecoration(
                                                          border: Border.all(color: ColorUtils.blue192,width: 1),
                                                          shape: BoxShape.circle,
                                                          color: ColorUtils.white255,
                                                        ),
                                                        child: Center(
                                                          child: Container(
                                                            height: 6.hm(context),
                                                            width: 6.wm(context),
                                                            decoration: BoxDecoration(
                                                              shape: BoxShape.circle,
                                                              color: ColorUtils.blue192,
                                                            ),
                                                          ),
                                                        ),
                                                      ) :
                                                      Container(
                                                        height: 10.hm(context),
                                                        width: 10.wm(context),
                                                        decoration: BoxDecoration(
                                                            border: Border.all(color: ColorUtils.blue181,width: 1),
                                                            shape: BoxShape.circle,
                                                            color: ColorUtils.white255
                                                        ),
                                                      ),

                                                      pickUpRequestResponseModel.value.data?.status == "processing" ||
                                                          pickUpRequestResponseModel.value.data?.status == "ongoing"||
                                                          pickUpRequestResponseModel.value.data?.status == "delivered" ?
                                                      Container(
                                                        height: 10.hm(context),
                                                        width: 10.wm(context),
                                                        decoration: BoxDecoration(
                                                          border: Border.all(color: ColorUtils.blue192,width: 1),
                                                          shape: BoxShape.circle,
                                                          color: ColorUtils.white255,
                                                        ),
                                                        child: Center(
                                                          child: Container(
                                                            height: 6.hm(context),
                                                            width: 6.wm(context),
                                                            decoration: BoxDecoration(
                                                              shape: BoxShape.circle,
                                                              color: ColorUtils.blue192,
                                                            ),
                                                          ),
                                                        ),
                                                      ) :
                                                      Container(
                                                        height: 10.hm(context),
                                                        width: 10.wm(context),
                                                        decoration: BoxDecoration(
                                                            border: Border.all(color: ColorUtils.blue181,width: 1),
                                                            shape: BoxShape.circle,
                                                            color: ColorUtils.white255
                                                        ),
                                                      ),

                                                       pickUpRequestResponseModel.value.data?.status == "ongoing"||
                                                          pickUpRequestResponseModel.value.data?.status == "delivered" ?
                                                      Container(
                                                        height: 10.hm(context),
                                                        width: 10.wm(context),
                                                        decoration: BoxDecoration(
                                                          border: Border.all(color: ColorUtils.blue192,width: 1),
                                                          shape: BoxShape.circle,
                                                          color: ColorUtils.white255,
                                                        ),
                                                        child: Center(
                                                          child: Container(
                                                            height: 6.hm(context),
                                                            width: 6.wm(context),
                                                            decoration: BoxDecoration(
                                                              shape: BoxShape.circle,
                                                              color: ColorUtils.blue192,
                                                            ),
                                                          ),
                                                        ),
                                                      ) :
                                                      Container(
                                                        height: 10.hm(context),
                                                        width: 10.wm(context),
                                                        decoration: BoxDecoration(
                                                            border: Border.all(color: ColorUtils.blue181,width: 1),
                                                            shape: BoxShape.circle,
                                                            color: ColorUtils.white255
                                                        ),
                                                      ),


                                                      pickUpRequestResponseModel.value.data?.status == "delivered" ?
                                                      Container(
                                                        height: 10.hm(context),
                                                        width: 10.wm(context),
                                                        decoration: BoxDecoration(
                                                          border: Border.all(color: ColorUtils.blue192,width: 1),
                                                          shape: BoxShape.circle,
                                                          color: ColorUtils.white255,
                                                        ),
                                                        child: Center(
                                                          child: Container(
                                                            height: 6.hm(context),
                                                            width: 6.wm(context),
                                                            decoration: BoxDecoration(
                                                              shape: BoxShape.circle,
                                                              color: ColorUtils.blue192,
                                                            ),
                                                          ),
                                                        ),
                                                      ) :
                                                      Container(
                                                        height: 10.hm(context),
                                                        width: 10.wm(context),
                                                        decoration: BoxDecoration(
                                                            border: Border.all(color: ColorUtils.blue181,width: 1),
                                                            shape: BoxShape.circle,
                                                            color: ColorUtils.white255
                                                        ),
                                                      ),


                                                    ],
                                                  )
                                              ),
                                            ),




                                          ],
                                        ),
                                      ),

                                      SpacerWidget.spacerWidget(spaceWidth: 10.wm(context)),


                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [

                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [

                                                Container(
                                                  alignment: Alignment.centerLeft,
                                                  child: Text(
                                                    "Pending".tr,
                                                    textAlign: TextAlign.start,
                                                    style: GoogleFonts.tajawal(
                                                      fontWeight: FontWeight.w500,
                                                      fontStyle: FontStyle.normal,
                                                      fontSize: 16.spm(context),
                                                      color: ColorUtils.black30,
                                                    ),
                                                  ),
                                                ),

                                              ],
                                            ),

                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [

                                                Container(
                                                  alignment: Alignment.centerLeft,
                                                  child: Text(
                                                    "Received".tr,
                                                    textAlign: TextAlign.start,
                                                    style: GoogleFonts.tajawal(
                                                      fontWeight: FontWeight.w500,
                                                      fontStyle: FontStyle.normal,
                                                      fontSize: 16.spm(context),
                                                      color: ColorUtils.black30,
                                                    ),
                                                  ),
                                                ),


                                              ],
                                            ),

                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [

                                                Container(
                                                  alignment: Alignment.centerLeft,
                                                  child: Text(
                                                    "Processing".tr,
                                                    textAlign: TextAlign.start,
                                                    style: GoogleFonts.tajawal(
                                                      fontWeight: FontWeight.w500,
                                                      fontStyle: FontStyle.normal,
                                                      fontSize: 16.spm(context),
                                                      color: ColorUtils.black30,
                                                    ),
                                                  ),
                                                ),


                                              ],
                                            ),


                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [

                                                Container(
                                                  alignment: Alignment.centerLeft,
                                                  child: Text(
                                                    "Ongoing".tr,
                                                    textAlign: TextAlign.start,
                                                    style: GoogleFonts.tajawal(
                                                      fontWeight: FontWeight.w500,
                                                      fontStyle: FontStyle.normal,
                                                      fontSize: 16.spm(context),
                                                      color: ColorUtils.black30,
                                                    ),
                                                  ),
                                                ),


                                              ],
                                            ),

                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [

                                                Container(
                                                  alignment: Alignment.centerLeft,
                                                  child: Text(
                                                    "Delivered".tr,
                                                    textAlign: TextAlign.start,
                                                    style: GoogleFonts.tajawal(
                                                      fontWeight: FontWeight.w500,
                                                      fontStyle: FontStyle.normal,
                                                      fontSize: 16.spm(context),
                                                      color: ColorUtils.black30,
                                                    ),
                                                  ),
                                                ),

                                              ],
                                            ),



                                          ],
                                        ),
                                      ),

                                    ],
                                  ),
                                ),


                              ],
                            ),
                          ),

                          SpacerWidget.spacerWidget(spaceHeight: 22.hm(context)),


                        ],
                      )

                  ),


                ],
              ),
            ),


          ],
        ) : Center(child: CircularProgressIndicator(),),
      ),
    ));
  }


}