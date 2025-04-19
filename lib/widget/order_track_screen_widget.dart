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
      return Container(
        height: 1133.ht(context),
        width: 744.wt(context),
        decoration: BoxDecoration(
          color: ColorUtils.white248,
        ),
        child: Center(
          child: Text("Track Order"),
        ),
      );
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
                          vertical: 26.vpmm(context)
                        ),
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
                                          "Mohammed",
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
                                                "#13456",
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
                                                "4.9",
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


                          ],
                        )

                      ),


                    ],
                  ),
                ),


              ],
            )
        ),
      ));
    }
  }


}