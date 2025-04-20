import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rahatak_food_delivery_app/utils/utils.dart';

import '../screen/screen.dart';

class EditNewAddressScreenWidget extends GetxController {

  GoogleMapController? googleMapController;
  RxDouble updatedLat = 0.0.obs;
  RxDouble updatedLong = 0.0.obs;
  Rx<TextEditingController> governorateController = TextEditingController().obs;
  Rx<TextEditingController> stateController = TextEditingController().obs;
  Rx<TextEditingController> cityController = TextEditingController().obs;
  RxBool isCheckIn = false.obs;

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



  Widget editNewAddressScreenWidget({required BuildContext context}) {
    if(MediaQuery.sizeOf(context).height > 1000) {
      return Obx(()=>SafeArea(
        child: Container(
          height: 1133.ht(context),
          width: 744.wt(context),
          decoration: BoxDecoration(
            color: ColorUtils.white255,
          ),
          child: Column(
            children: [
        
        
              Expanded(
                child: CustomScrollView(
                  slivers: [
        
        
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
        
        
                          SpacerWidget.spacerWidget(spaceHeight: 11.ht(context),),
        
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 37.hpmt(context)),
                            child: Directionality(
                              textDirection: TextDirection.ltr,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [

                                  Container(
                                    height: 40.ht(context),
                                    width: 40.wt(context),
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
                                        "Edit Address",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.tajawal(
                                          fontWeight: FontWeight.w700,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 16.spt(context),
                                          color: ColorUtils.black255,
                                        ),
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
        
        
        
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 138.hpmt(context)),
                            child: Column(
                              children: [
        
        
                                SpacerWidget.spacerWidget(spaceHeight: 26.ht(context),),
        
        
                                Container(
                                  alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                  child: Text(
                                    "Select Location",
                                    textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                    style: GoogleFonts.tajawal(
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 16.spt(context),
                                      color: ColorUtils.black255,
                                      height: (20.ht(context) / 16.spt(context)),
                                    ),
                                  ),
                                ),
        
        
                                SpacerWidget.spacerWidget(spaceHeight: 32.ht(context),),
        
                                Container(
                                  height: 358.ht(context),
                                  width: 468.wt(context),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.rt(context)),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12.rt(context)),
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
        
        
                                SpacerWidget.spacerWidget(spaceHeight: 32.ht(context),),
        
        
                                Container(
                                  alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                  child: Text(
                                    "Governorate",
                                    textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                    style: GoogleFonts.tajawal(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 16.spt(context),
                                      color: ColorUtils.black255,
                                    ),
                                  ),
                                ),
        
                                SpacerWidget.spacerWidget(spaceHeight: 12.ht(context),),
        
        
                                TextFormField(
                                  controller: governorateController.value,
                                  textAlign: TextAlign.start,
                                  cursorColor: ColorUtils.blue192,
                                  cursorHeight: 20.ht(context),
                                  style: GoogleFonts.tajawal(
                                    fontSize: 16.spt(context),
                                    fontStyle: FontStyle.normal,
                                    color: ColorUtils.black51,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  textAlignVertical: TextAlignVertical.center,
                                  decoration: InputDecoration(
                                    hintText: "Enter Governorate",
                                    hintStyle: GoogleFonts.tajawal(
                                      fontSize: 16.spt(context),
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      color: ColorUtils.gray136,
                                    ),
                                    filled: true,
                                    fillColor: ColorUtils.white255,
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 12.hpmt(context),
                                      vertical: 12.vpmt(context),
                                    ),
                                    constraints: BoxConstraints(
                                      maxHeight: 48.hm(context),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.rt(context)),
                                      borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.rt(context)),
                                      borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.rt(context)),
                                      borderSide: BorderSide(color: ColorUtils.blue192,width: 1),
                                    ),
        
                                  ),
                                ),
        
        
                                SpacerWidget.spacerWidget(spaceHeight: 12.ht(context),),
        
        
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
        
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
        
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "state",
                                            textAlign: TextAlign.start,
                                            style: GoogleFonts.tajawal(
                                              fontWeight: FontWeight.w500,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 16.spt(context),
                                              color: ColorUtils.black255,
                                            ),
                                          ),
                                        ),
        
                                        SpacerWidget.spacerWidget(spaceHeight: 12.ht(context),),
        
        
                                        TextFormField(
                                          controller: stateController.value,
                                          textAlign: TextAlign.start,
                                          cursorColor: ColorUtils.blue192,
                                          cursorHeight: 20.ht(context),
                                          style: GoogleFonts.tajawal(
                                            fontSize: 16.spt(context),
                                            fontStyle: FontStyle.normal,
                                            color: ColorUtils.black51,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          textAlignVertical: TextAlignVertical.center,
                                          decoration: InputDecoration(
                                            hintText: "Enter State",
                                            hintStyle: GoogleFonts.tajawal(
                                              fontSize: 16.spt(context),
                                              fontWeight: FontWeight.w400,
                                              fontStyle: FontStyle.normal,
                                              color: ColorUtils.gray136,
                                            ),
                                            filled: true,
                                            fillColor: ColorUtils.white255,
                                            contentPadding: EdgeInsets.symmetric(
                                              horizontal: 12.hpmt(context),
                                              vertical: 12.vpmt(context),
                                            ),
                                            constraints: BoxConstraints(
                                              maxWidth: 230.wt(context),
                                              maxHeight: 48.ht(context),
                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(8.rt(context)),
                                              borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(8.rt(context)),
                                              borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(8.rt(context)),
                                              borderSide: BorderSide(color: ColorUtils.blue192,width: 1),
                                            ),
        
                                          ),
                                        ),
        
        
                                      ],
                                    ),
        
        
                                    SpacerWidget.spacerWidget(spaceWidth: 8.wt(context)),
        
        
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
        
                                        Container(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            "City",
                                            textAlign: TextAlign.start,
                                            style: GoogleFonts.tajawal(
                                              fontWeight: FontWeight.w500,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 16.spt(context),
                                              color: ColorUtils.black255,
                                            ),
                                          ),
                                        ),
        
                                        SpacerWidget.spacerWidget(spaceHeight: 12.ht(context),),
        
        
                                        TextFormField(
                                          controller: cityController.value,
                                          textAlign: TextAlign.start,
                                          cursorColor: ColorUtils.blue192,
                                          cursorHeight: 20.ht(context),
                                          style: GoogleFonts.tajawal(
                                            fontSize: 16.spt(context),
                                            fontStyle: FontStyle.normal,
                                            color: ColorUtils.black51,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          textAlignVertical: TextAlignVertical.center,
                                          decoration: InputDecoration(
                                            hintText: "Enter City",
                                            hintStyle: GoogleFonts.tajawal(
                                              fontSize: 16.spt(context),
                                              fontWeight: FontWeight.w400,
                                              fontStyle: FontStyle.normal,
                                              color: ColorUtils.gray136,
                                            ),
                                            filled: true,
                                            fillColor: ColorUtils.white255,
                                            contentPadding: EdgeInsets.symmetric(
                                              horizontal: 12.hpmt(context),
                                              vertical: 12.vpmt(context),
                                            ),
                                            constraints: BoxConstraints(
                                              maxWidth: 230.wt(context),
                                              maxHeight: 48.ht(context),
                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(8.rt(context)),
                                              borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(8.rt(context)),
                                              borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(8.rt(context)),
                                              borderSide: BorderSide(color: ColorUtils.blue192,width: 1),
                                            ),
        
                                          ),
                                        ),
        
        
                                      ],
                                    ),
        
        
        
        
        
        
                                  ],
                                ),
        
        
                                SpacerWidget.spacerWidget(spaceHeight: 32.ht(context),),
        
        
        
                                Container(
                                  height: 25.ht(context),
                                  width: 468.wt(context),
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
                                          height: 18.ht(context),
                                          width: 18.wt(context),
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
        
                                        SpacerWidget.spacerWidget(spaceWidth: 8.wt(context)),
        
                                        RichText(
                                          textAlign: TextAlign.center,
                                          text: TextSpan(
                                            text: "Save location ",
                                            style: GoogleFonts.tajawal(
                                              fontStyle: FontStyle.normal,
                                              fontSize: 14.spt(context),
                                              color: ColorUtils.black51,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: "data for later use",
                                                style: GoogleFonts.tajawal(
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 14.spt(context),
                                                  color: ColorUtils.black51,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
        
        
                                      ],
                                    ),
                                  ),
                                ),
        
                                SpacerWidget.spacerWidget(spaceHeight: 32.ht(context),),
        
        
                                Container(
                                  height: 48.ht(context),
                                  width: 358.wt(context),
                                  decoration: BoxDecoration(
                                    color: ColorUtils.blue192,
                                    borderRadius: BorderRadius.circular(8.rt(context)),
                                  ),
                                  child: TextButton(
                                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                    onPressed: () async {
                                      Get.off(()=>OrderAddressScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                                    },
                                    child: Center(
                                      child: Text(
                                        "Save Address",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.tajawal(
                                          fontWeight: FontWeight.w700,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 18.spt(context),
                                          color: ColorUtils.white255,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
        
        
                              ],
                            ),
                          )
        
        
        
        
        
        
                        ],
                      ),
                    )
        
        
                  ],
                ),
              ),
        
        
            ],
          ),
        ),
      ));
    } else {
      return Obx(()=>SafeArea(
        child: Container(
          height: 844.hm(context),
          width: 390.wm(context),
          decoration: BoxDecoration(
            color: ColorUtils.white255,
          ),
          child: Column(
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
                                        "Edit Address",
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
                                "Select Location",
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
                                "Governorate",
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
                                hintText: "Enter Governorate",
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


                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "state",
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
                                        hintText: "Enter State",
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
                                        "City",
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
                                        hintText: "Enter City",
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
                                        text: "Save location ",
                                        style: GoogleFonts.tajawal(
                                          fontStyle: FontStyle.normal,
                                          fontSize: 14.spm(context),
                                          color: ColorUtils.black51,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: "data for later use",
                                            style: GoogleFonts.tajawal(
                                              fontStyle: FontStyle.normal,
                                              fontSize: 14.spm(context),
                                              color: ColorUtils.black51,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
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
                      Get.off(()=>OrderAddressScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                    },
                    child: Center(
                      child: Text(
                        "Save Address",
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


}