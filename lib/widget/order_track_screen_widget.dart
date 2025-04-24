import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rahatak_food_delivery_app/utils/utils.dart';

class OrderTrackScreenWidget extends GetxController {

  GoogleMapController? googleMapController;
  RxDouble updatedLat = 0.0.obs;
  RxDouble updatedLong = 0.0.obs;

  Rx<PageController> pageController = PageController(initialPage: 1).obs;

  Future<Position> _determinePosition() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    return position;
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

      print(updatedLong.value);
      print(updatedLat.value);

    } catch (e) {
      // Handle exceptions
    }
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


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(const Duration(seconds: 1),() async {
      await checkLocationPermission();
    });
  }




  Widget orderTrackScreenWidget({required BuildContext context}) {
    if(MediaQuery.sizeOf(context).height > 1133) {
      return Obx(()=>Container(
        height: 1133.ht(context),
        width: 744.wt(context),
        decoration: BoxDecoration(
          color: ColorUtils.white248,
        ),
        child: Stack(
          children: [

            SizedBox(
              height: 1133.ht(context),
              width: 744.wt(context),
            ),


            Positioned(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  Container(
                    height: 605.ht(context),
                    width: 744.wt(context),
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
                      height: 539.ht(context),
                      width: 744.wt(context),
                      decoration: BoxDecoration(
                        color: ColorUtils.white248,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.rt(context)),
                          topRight: Radius.circular(25.rt(context)),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 138.hpmt(context),
                        vertical: 26.vpmt(context),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          Expanded(
                            child: PageView(
                              controller: pageController.value,
                              children: [
                                pageViewBuilderOne(context: context),
                                pageViewBuilderTow(context: context,)
                              ],
                            ),
                          ),




                          SpacerWidget.spacerWidget(spaceHeight: 22.ht(context)),

                          Directionality(
                            textDirection: TextDirection.ltr,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [


                                Container(
                                  height: 24.ht(context),
                                  width: 24.wt(context),
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                  ),
                                  child: TextButton(
                                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                    onPressed: () async {
                                      pageController.value.jumpToPage(0);
                                    },
                                    child: FittedBox(
                                      fit: BoxFit.cover,
                                      child: Image.asset(
                                        ImagePathUtils.arrowFilledBackIconImagePath,
                                        fit: BoxFit.cover,
                                        alignment: Alignment.center,
                                      ),
                                    ),
                                  ),
                                ),

                                SpacerWidget.spacerWidget(spaceWidth: 14.wt(context)),

                                Container(
                                  height: 24.ht(context),
                                  width: 24.wt(context),
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                  ),
                                  child: TextButton(
                                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                    onPressed: () async {
                                      pageController.value.jumpToPage(1);
                                    },
                                    child: FittedBox(
                                      fit: BoxFit.cover,
                                      child: Image.asset(
                                        ImagePathUtils.arrowFilledIconImagePath,
                                        fit: BoxFit.cover,
                                        alignment: Alignment.center,
                                      ),
                                    ),
                                  ),
                                ),


                              ],
                            ),
                          )


                        ],
                      )

                  ),


                ],
              ),
            ),


          ],
        ),
      ));
    } else {
      return Obx(()=>SafeArea(
        child: Container(
            height: 844.hm(context),
            width: 390.wm(context),
            decoration: BoxDecoration(
              color: ColorUtils.white248,
            ),
            child: Stack(
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
                              child: PageView(
                                controller: pageController.value,
                                children: [
                                  pageViewBuilderOne(context: context),
                                  pageViewBuilderTow(context: context,)
                                ],
                              ),
                            ),




                            SpacerWidget.spacerWidget(spaceHeight: 22.hm(context)),

                            Directionality(
                              textDirection: TextDirection.ltr,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [


                                  Container(
                                    height: 24.hm(context),
                                    width: 24.wm(context),
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                    ),
                                    child: TextButton(
                                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                      onPressed: () async {
                                        pageController.value.jumpToPage(0);
                                      },
                                      child: FittedBox(
                                        fit: BoxFit.cover,
                                        child: Image.asset(
                                          ImagePathUtils.arrowFilledBackIconImagePath,
                                          fit: BoxFit.cover,
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                    ),
                                  ),

                                  SpacerWidget.spacerWidget(spaceWidth: 14.wm(context)),

                                  Container(
                                    height: 24.hm(context),
                                    width: 24.wm(context),
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                    ),
                                    child: TextButton(
                                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                      onPressed: () async {
                                        pageController.value.jumpToPage(1);
                                      },
                                      child: FittedBox(
                                        fit: BoxFit.cover,
                                        child: Image.asset(
                                          ImagePathUtils.arrowFilledIconImagePath,
                                          fit: BoxFit.cover,
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                    ),
                                  ),


                                ],
                              ),
                            )


                          ],
                        )

                      ),


                    ],
                  ),
                ),


              ],
            ),
        ),
      ));
    }
  }


  Widget pageViewBuilderOne({required BuildContext context}) {
    if(MediaQuery.sizeOf(context).height > 1000) {
      return Column(
        children: [

          Container(
            width: 468.wt(context),
            decoration: BoxDecoration(
              color: ColorUtils.blue192,
              border: Border.all(color: ColorUtils.white217,width: 1),
              borderRadius: BorderRadius.circular(10.rt(context)),
            ),
            padding: EdgeInsets.symmetric(
              vertical: 20.vpmt(context),
              horizontal: 20.hpmt(context),
            ),
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
                        "Mohammed".tr,
                        textAlign: TextAlign.start,
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: 20.spt(context),
                          color: ColorUtils.white255,
                        ),
                      ),
                    ),

                    SpacerWidget.spacerWidget(spaceHeight: 16.ht(context)),


                    Container(
                      height: 25.ht(context),
                      decoration: BoxDecoration(
                          color: Colors.transparent
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [


                          Container(
                            height: 25.ht(context),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "#13456".tr,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.tajawal(
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                fontSize: 16.spt(context),
                                color: ColorUtils.white255,
                              ),
                            ),
                          ),


                          SpacerWidget.spacerWidget(spaceWidth: 16.wt(context)),

                          Container(
                            height: 5.ht(context),
                            width: 5.wt(context),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: ColorUtils.white255
                            ),
                          ),


                          SpacerWidget.spacerWidget(spaceWidth: 16.wt(context)),


                          Container(
                            height: 18.ht(context),
                            width: 17.wt(context),
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

                          SpacerWidget.spacerWidget(spaceWidth: 8.wt(context)),

                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "4.9".tr,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.tajawal(
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                fontSize: 14.spt(context),
                                color: ColorUtils.white255,
                              ),
                            ),
                          ),


                        ],
                      ),
                    ),


                  ],
                ),


                Container(
                  height: 40.ht(context),
                  width: 40.wt(context),
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






              ],
            ),
          ),

          SpacerWidget.spacerWidget(spaceHeight: 20.ht(context)),


          Container(
            width: 468.wt(context),
            padding: EdgeInsets.symmetric(
              horizontal: 10.hpmt(context),
              vertical: 10.vpmt(context),
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

                Row(
                  children: [


                    Container(
                      height: 24.ht(context),
                      width: 24.wt(context),
                      decoration: BoxDecoration(
                          color: Colors.transparent
                      ),
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Image.asset(
                          ImagePathUtils.lightTimeLineIconImagePath,
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                        ),
                      ),
                    ),

                    SpacerWidget.spacerWidget(spaceWidth: 8.wt(context)),


                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "20 minutes".tr,
                        textAlign: TextAlign.start,
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          fontSize: 16.spt(context),
                          color: ColorUtils.black33,
                        ),
                      ),
                    ),

                  ],
                ),

                Row(
                  children: [


                    Container(
                      height: 24.ht(context),
                      width: 24.wt(context),
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

                    SpacerWidget.spacerWidget(spaceWidth: 8.wt(context)),


                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Muscat, Al Khoudh".tr,
                        textAlign: TextAlign.start,
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          fontSize: 16.spt(context),
                          color: ColorUtils.black33,
                        ),
                      ),
                    ),

                  ],
                ),

              ],
            ),
          ),


          SpacerWidget.spacerWidget(spaceHeight: 22.ht(context)),


          Container(
            height: 147.ht(context),
            width: 390.wt(context),
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            child: Row(
              children: [


                Container(
                  width: 10.wt(context),
                  height: 138.ht(context),
                  decoration: BoxDecoration(
                      color: Colors.transparent
                  ),
                  child: Stack(

                    children: [

                      SizedBox(
                        width: 10.wt(context),
                        height: 138.ht(context),
                      ),


                      Container(
                        height: 138.ht(context),
                        width: 10.wt(context),
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
                            height: 138.ht(context),
                            width: 10.wt(context),
                            decoration: BoxDecoration(
                                color: Colors.transparent
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Container(
                                  height: 10.ht(context),
                                  width: 10.wt(context),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: ColorUtils.blue192,width: 1),
                                    shape: BoxShape.circle,
                                    color: ColorUtils.white255,
                                  ),
                                  child: Center(
                                    child: Container(
                                      height: 6.ht(context),
                                      width: 6.wt(context),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: ColorUtils.blue192,
                                      ),
                                    ),
                                  ),
                                ),

                                Container(
                                  height: 10.ht(context),
                                  width: 10.wt(context),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: ColorUtils.blue192,width: 1),
                                    shape: BoxShape.circle,
                                    color: ColorUtils.white255,
                                  ),
                                  child: Center(
                                    child: Container(
                                      height: 6.ht(context),
                                      width: 6.wt(context),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: ColorUtils.blue192,
                                      ),
                                    ),
                                  ),
                                ),

                                Container(
                                  height: 10.ht(context),
                                  width: 10.wt(context),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: ColorUtils.blue192,width: 1),
                                    shape: BoxShape.circle,
                                    color: ColorUtils.white255,
                                  ),
                                  child: Center(
                                    child: Container(
                                      height: 6.ht(context),
                                      width: 6.wt(context),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: ColorUtils.blue192,
                                      ),
                                    ),
                                  ),
                                ),

                                Container(
                                  height: 10.ht(context),
                                  width: 10.wt(context),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: ColorUtils.blue181,width: 1),
                                      shape: BoxShape.circle,
                                      color: ColorUtils.white255
                                  ),
                                ),

                                Container(
                                  height: 10.ht(context),
                                  width: 10.wt(context),
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

                SpacerWidget.spacerWidget(spaceWidth: 10.wt(context)),


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
                              "In process".tr,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.tajawal(
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                fontSize: 16.spt(context),
                                color: ColorUtils.black30,
                              ),
                            ),
                          ),

                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "06:00 PM".tr,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.tajawal(
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                fontSize: 16.spt(context),
                                color: ColorUtils.gray102,
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
                              "Preparing".tr,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.tajawal(
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                fontSize: 16.spt(context),
                                color: ColorUtils.black30,
                              ),
                            ),
                          ),

                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "06:05 PM".tr,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.tajawal(
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                fontSize: 16.spt(context),
                                color: ColorUtils.gray102,
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
                              "Prepared",
                              textAlign: TextAlign.start,
                              style: GoogleFonts.tajawal(
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                fontSize: 16.spt(context),
                                color: ColorUtils.black30,
                              ),
                            ),
                          ),

                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "06:15 PM",
                              textAlign: TextAlign.start,
                              style: GoogleFonts.tajawal(
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                fontSize: 16.spt(context),
                                color: ColorUtils.gray102,
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
                              "Out for delivery".tr,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.tajawal(
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                fontSize: 16.spt(context),
                                color: ColorUtils.black30,
                              ),
                            ),
                          ),

                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "06:20 PM",
                              textAlign: TextAlign.start,
                              style: GoogleFonts.tajawal(
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                fontSize: 16.spt(context),
                                color: ColorUtils.gray102,
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
                                fontSize: 16.spt(context),
                                color: ColorUtils.black30,
                              ),
                            ),
                          ),

                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "06:40 PM".tr,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.tajawal(
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                fontSize: 16.spt(context),
                                color: ColorUtils.gray102,
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
      );
    } else {
      return Column(
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
                        "Mohammed".tr,
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
                              "#13456".tr,
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
                              "4.9".tr,
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


                Container(
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
                          ImagePathUtils.lightTimeLineIconImagePath,
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                        ),
                      ),
                    ),

                    SpacerWidget.spacerWidget(spaceWidth: 8.wm(context)),


                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "20 minutes".tr,
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
                        "Muscat, Al Khoudh".tr,
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
                                ),

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
                                ),

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
                                ),

                                Container(
                                  height: 10.hm(context),
                                  width: 10.wm(context),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: ColorUtils.blue181,width: 1),
                                      shape: BoxShape.circle,
                                      color: ColorUtils.white255
                                  ),
                                ),

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
                              "In process".tr,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.tajawal(
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                fontSize: 16.spm(context),
                                color: ColorUtils.black30,
                              ),
                            ),
                          ),

                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "06:00 PM".tr,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.tajawal(
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                fontSize: 16.spm(context),
                                color: ColorUtils.gray102,
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
                              "Preparing".tr,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.tajawal(
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                fontSize: 16.spm(context),
                                color: ColorUtils.black30,
                              ),
                            ),
                          ),

                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "06:05 PM".tr,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.tajawal(
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                fontSize: 16.spm(context),
                                color: ColorUtils.gray102,
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
                              "Prepared".tr,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.tajawal(
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                fontSize: 16.spm(context),
                                color: ColorUtils.black30,
                              ),
                            ),
                          ),

                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "06:15 PM".tr,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.tajawal(
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                fontSize: 16.spm(context),
                                color: ColorUtils.gray102,
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
                              "Out for delivery".tr,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.tajawal(
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                fontSize: 16.spm(context),
                                color: ColorUtils.black30,
                              ),
                            ),
                          ),

                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "06:20 PM".tr,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.tajawal(
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                fontSize: 16.spm(context),
                                color: ColorUtils.gray102,
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

                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "06:40 PM".tr,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.tajawal(
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                fontSize: 16.spm(context),
                                color: ColorUtils.gray102,
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
      );
    }
  }


  Widget pageViewBuilderTow({required BuildContext context}) {
    if(MediaQuery.sizeOf(context).height > 1000) {
      return Column(
        children: [

          Container(
            width: 468.wt(context),
            decoration: BoxDecoration(
              color: ColorUtils.blue192,
              border: Border.all(color: ColorUtils.white217,width: 1),
              borderRadius: BorderRadius.circular(10.rt(context)),
            ),
            padding: EdgeInsets.symmetric(
              vertical: 20.vpmt(context),
              horizontal: 20.hpmt(context),
            ),
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
                        "Mohammed".tr,
                        textAlign: TextAlign.start,
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: 20.spt(context),
                          color: ColorUtils.white255,
                        ),
                      ),
                    ),

                    SpacerWidget.spacerWidget(spaceHeight: 16.ht(context)),


                    Container(
                      height: 25.ht(context),
                      decoration: BoxDecoration(
                          color: Colors.transparent
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [


                          Container(
                            height: 25.ht(context),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "#123456".tr,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.tajawal(
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                fontSize: 16.spt(context),
                                color: ColorUtils.white255,
                              ),
                            ),
                          ),


                          SpacerWidget.spacerWidget(spaceWidth: 16.wt(context)),

                          Container(
                            height: 5.ht(context),
                            width: 5.wt(context),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: ColorUtils.white255
                            ),
                          ),


                          SpacerWidget.spacerWidget(spaceWidth: 16.wt(context)),


                          Container(
                            height: 18.ht(context),
                            width: 17.wt(context),
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

                          SpacerWidget.spacerWidget(spaceWidth: 8.wt(context)),

                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "4.9".tr,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.tajawal(
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                fontSize: 14.spt(context),
                                color: ColorUtils.white255,
                              ),
                            ),
                          ),


                        ],
                      ),
                    ),


                  ],
                ),


                Container(
                  height: 40.ht(context),
                  width: 40.wt(context),
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






              ],
            ),
          ),

          SpacerWidget.spacerWidget(spaceHeight: 20.ht(context)),


          Container(
            width: 468.wt(context),
            padding: EdgeInsets.symmetric(
              horizontal: 10.hpmt(context),
              vertical: 10.vpmt(context),
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

                Row(
                  children: [


                    Container(
                      height: 24.ht(context),
                      width: 24.wt(context),
                      decoration: BoxDecoration(
                          color: Colors.transparent
                      ),
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Image.asset(
                          ImagePathUtils.lightTimeLineIconImagePath,
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                        ),
                      ),
                    ),

                    SpacerWidget.spacerWidget(spaceWidth: 8.wt(context)),


                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "30 minutes".tr,
                        textAlign: TextAlign.start,
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          fontSize: 16.spt(context),
                          color: ColorUtils.black33,
                        ),
                      ),
                    ),

                  ],
                ),

                Row(
                  children: [


                    Container(
                      height: 24.ht(context),
                      width: 24.wt(context),
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

                    SpacerWidget.spacerWidget(spaceWidth: 8.wt(context)),


                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Muscat, Al Khoudh".tr,
                        textAlign: TextAlign.start,
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          fontSize: 16.spt(context),
                          color: ColorUtils.black33,
                        ),
                      ),
                    ),

                  ],
                ),

              ],
            ),
          ),


          SpacerWidget.spacerWidget(spaceHeight: 22.ht(context)),


          Container(
            height: 147.ht(context),
            width: 390.wt(context),
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            child: Row(
              children: [


                Container(
                  width: 10.wt(context),
                  height: 138.ht(context),
                  decoration: BoxDecoration(
                      color: Colors.transparent
                  ),
                  child: Stack(

                    children: [

                      SizedBox(
                        width: 10.wt(context),
                        height: 138.ht(context),
                      ),


                      Container(
                        height: 138.ht(context),
                        width: 10.wt(context),
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
                            height: 138.ht(context),
                            width: 10.wt(context),
                            decoration: BoxDecoration(
                                color: Colors.transparent
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Container(
                                  height: 10.ht(context),
                                  width: 10.wt(context),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: ColorUtils.blue192,width: 1),
                                    shape: BoxShape.circle,
                                    color: ColorUtils.white255,
                                  ),
                                  child: Center(
                                    child: Container(
                                      height: 6.ht(context),
                                      width: 6.wt(context),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: ColorUtils.blue192,
                                      ),
                                    ),
                                  ),
                                ),

                                Container(
                                  height: 10.ht(context),
                                  width: 10.wt(context),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: ColorUtils.blue192,width: 1),
                                    shape: BoxShape.circle,
                                    color: ColorUtils.white255,
                                  ),
                                  child: Center(
                                    child: Container(
                                      height: 6.ht(context),
                                      width: 6.wt(context),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: ColorUtils.blue192,
                                      ),
                                    ),
                                  ),
                                ),

                                Container(
                                  height: 10.ht(context),
                                  width: 10.wt(context),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: ColorUtils.blue192,width: 1),
                                    shape: BoxShape.circle,
                                    color: ColorUtils.white255,
                                  ),
                                  child: Center(
                                    child: Container(
                                      height: 6.ht(context),
                                      width: 6.wt(context),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: ColorUtils.blue192,
                                      ),
                                    ),
                                  ),
                                ),

                                Container(
                                  height: 10.ht(context),
                                  width: 10.wt(context),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: ColorUtils.blue181,width: 1),
                                      shape: BoxShape.circle,
                                      color: ColorUtils.white255
                                  ),
                                ),

                                Container(
                                  height: 10.ht(context),
                                  width: 10.wt(context),
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

                SpacerWidget.spacerWidget(spaceWidth: 10.wt(context)),


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
                              "In process".tr,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.tajawal(
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                fontSize: 16.spt(context),
                                color: ColorUtils.black30,
                              ),
                            ),
                          ),

                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "06:00 PM".tr,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.tajawal(
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                fontSize: 16.spt(context),
                                color: ColorUtils.gray102,
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
                              "Preparing".tr,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.tajawal(
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                fontSize: 16.spt(context),
                                color: ColorUtils.black30,
                              ),
                            ),
                          ),

                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "06:05 PM".tr,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.tajawal(
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                fontSize: 16.spt(context),
                                color: ColorUtils.gray102,
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
                              "Prepared".tr,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.tajawal(
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                fontSize: 16.spt(context),
                                color: ColorUtils.black30,
                              ),
                            ),
                          ),

                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "06:15 PM".tr,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.tajawal(
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                fontSize: 16.spt(context),
                                color: ColorUtils.gray102,
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
                              "Out for delivery".tr,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.tajawal(
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                fontSize: 16.spt(context),
                                color: ColorUtils.black30,
                              ),
                            ),
                          ),

                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "06:20 PM".tr,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.tajawal(
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                fontSize: 16.spt(context),
                                color: ColorUtils.gray102,
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
                                fontSize: 16.spt(context),
                                color: ColorUtils.black30,
                              ),
                            ),
                          ),

                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "06:40 PM".tr,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.tajawal(
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                fontSize: 16.spt(context),
                                color: ColorUtils.gray102,
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
      );
    } else {
      return Column(
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
                        "Mohammed".tr,
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
                              "#123456".tr,
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
                              "4.9".tr,
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


                Container(
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
                          ImagePathUtils.lightTimeLineIconImagePath,
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                        ),
                      ),
                    ),

                    SpacerWidget.spacerWidget(spaceWidth: 8.wm(context)),


                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "30 minutes".tr,
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
                        "Muscat, Al Khoudh".tr,
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
                                ),

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
                                ),

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
                                ),

                                Container(
                                  height: 10.hm(context),
                                  width: 10.wm(context),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: ColorUtils.blue181,width: 1),
                                      shape: BoxShape.circle,
                                      color: ColorUtils.white255
                                  ),
                                ),

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
                              "In process".tr,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.tajawal(
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                fontSize: 16.spm(context),
                                color: ColorUtils.black30,
                              ),
                            ),
                          ),

                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "06:00 PM".tr,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.tajawal(
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                fontSize: 16.spm(context),
                                color: ColorUtils.gray102,
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
                              "Preparing".tr,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.tajawal(
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                fontSize: 16.spm(context),
                                color: ColorUtils.black30,
                              ),
                            ),
                          ),

                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "06:05 PM".tr,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.tajawal(
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                fontSize: 16.spm(context),
                                color: ColorUtils.gray102,
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
                              "Prepared".tr,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.tajawal(
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                fontSize: 16.spm(context),
                                color: ColorUtils.black30,
                              ),
                            ),
                          ),

                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "06:15 PM".tr,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.tajawal(
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                fontSize: 16.spm(context),
                                color: ColorUtils.gray102,
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
                              "Out for delivery".tr,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.tajawal(
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                fontSize: 16.spm(context),
                                color: ColorUtils.black30,
                              ),
                            ),
                          ),

                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "06:20 PM".tr,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.tajawal(
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                fontSize: 16.spm(context),
                                color: ColorUtils.gray102,
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

                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "06:40 PM".tr,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.tajawal(
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                fontSize: 16.spm(context),
                                color: ColorUtils.gray102,
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
      );
    }
  }


}