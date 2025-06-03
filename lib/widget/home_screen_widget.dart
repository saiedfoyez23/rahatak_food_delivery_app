import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rahatak_food_delivery_app/model/model.dart';
import 'package:rahatak_food_delivery_app/screen/screen.dart';
import 'package:rahatak_food_delivery_app/utils/utils.dart';

import '../controller/controller.dart';

class HomeScreenWidget extends GetxController {

  BuildContext context;
  HomeScreenWidget({required this.context});

  Rx<TextEditingController> searchController = TextEditingController().obs;
  Rx<StoresResponseModel> storesResponseModel = StoresResponseModel().obs;

  RxList<GridImageList> firstImageList = <GridImageList>[
    GridImageList(image: ImagePathUtils.extraImageGrid_0, rating: "4.5", address: "3.2 km near you", restaurant: "Kuco", status: "Available"),
    GridImageList(image: ImagePathUtils.extraImageGrid_1, rating: "4.2", address: "3.2 km near you", restaurant: "Italian Barista Cafe", status: "Crowded"),
    GridImageList(image: ImagePathUtils.extraImageGrid_2, rating: "3.9", address: "3.2 km near you", restaurant: "Shawarmak", status: "Available"),
    GridImageList(image: ImagePathUtils.extraImageGrid_3, rating: "3.9", address: "3.2 km near you", restaurant: "Asoum Burger(Dhaka Branch)", status: "Available"),
    GridImageList(image: ImagePathUtils.extraImageGrid_4, rating: "4.5", address: "3.2 km near you", restaurant: "Volare Pizzeria(Dhaka Branch)", status: "Temporarily Closed"),
    GridImageList(image: ImagePathUtils.extraImageGrid_5, rating: "4.2", address: "3.2 km near you", restaurant: "Delicato Kitchen(Dhaka Branch)", status: "Crowded"),
  ].obs;


  RxList<ListImageList> listImageList = <ListImageList>[
    ListImageList(image: ImagePathUtils.extraImageList_1, name: "Burger"),
    ListImageList(image: ImagePathUtils.extraImageList_2, name: "Pizza"),
    ListImageList(image: ImagePathUtils.extraImageList_3, name: "Seafood"),
    ListImageList(image: ImagePathUtils.extraImageList_4, name: "Grilled"),
    ListImageList(image: ImagePathUtils.extraImageList_5, name: "Shawarma"),
    ListImageList(image: ImagePathUtils.extraImageList_6, name: "Pasta"),
    ListImageList(image: ImagePathUtils.extraImageList_7, name: "Salad"),
    ListImageList(image: ImagePathUtils.extraImageList_8, name: "Juices"),
  ].obs;


  RxList<GridImageList> secondImageList = <GridImageList>[
    GridImageList(image: ImagePathUtils.extraImageGrid_3, rating: "4.5", address: "3.2 km near you", restaurant: "Asoum Burger", status: "Crowded"),
    GridImageList(image: ImagePathUtils.extraImageGrid_4, rating: "1.2", address: "3.2 km near you", restaurant: "Volare Pizzeria", status: "Temporarily Closed"),
    GridImageList(image: ImagePathUtils.extraImageGrid_5, rating: "3.9", address: "3.2 km near you", restaurant: "Delicato Kitchen", status: "Available"),
    GridImageList(image: ImagePathUtils.extraImageGrid_0, rating: "3.9", address: "3.2 km near you", restaurant: "Kuco(Dhaka Branch)", status: "Available"),
    GridImageList(image: ImagePathUtils.extraImageGrid_1, rating: "4.2", address: "3.2 km near you", restaurant: "Italian Barista Cafe(Dhaka Branch)", status: "Crowded"),
    GridImageList(image: ImagePathUtils.extraImageGrid_2, rating: "4.5", address: "3.2 km near you", restaurant: "Shawarmak(Dhaka Branch)", status: "Temporarily Closed"),
  ].obs;


  RxBool isLoading = false.obs;
  RxString coverImage = "".obs;
  RxString userName = "".obs;
  RxBool isSubmit = false.obs;


  Future<void> determinePosition() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position.longitude);
    print(position.latitude);
  }

  double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    const double earthRadius = 6371000; // Radius of the Earth in meters

    double dLat = _toRadians(lat2 - lat1);
    double dLon = _toRadians(lon2 - lon1);

    double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(_toRadians(lat1)) * cos(_toRadians(lat2)) *
            sin(dLon / 2) * sin(dLon / 2);

    double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    double distanceInMeters = earthRadius * c; // Distance in meters
    double distanceInKilometers = distanceInMeters / 1000; // Convert to kilometers

    return distanceInKilometers;
  }

  double _toRadians(double degree) {
    return degree * pi / 180;
  }


  Future<double?> calculateDistanceFromCurrentLocation(double targetLat, double targetLon) async {
    Position currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    double distance = calculateDistance(
      currentPosition.latitude,
      currentPosition.longitude,
      targetLat,
      targetLon,
    );
    return distance;
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
        await determinePosition();
      }
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
      await checkLocationPermission();
      await FirebaseMessaging.instance.subscribeToTopic("General");
      await ProfileController.getUserProfileResponse(
        onSuccess: (e) async {
          await StoresController.getStoresResponse(
            onSuccess: (e) async {
              isLoading.value = false;
              await ProfileController.checkLocalProfileResponse().then((value) {
                print(value?.data?.image);
                if(value?.data != null) {
                  coverImage.value = value?.data?.image ?? "";
                  userName.value = value?.data?.name ?? "";
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
          ).then((value) {
            storesResponseModel.value = value;
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

  

  Widget homeScreenWidget({required BuildContext context}) {
    if(MediaQuery.sizeOf(context).height > 1133) {
      return Obx(()=>Container(
        height: 1133.ht(context),
        width: 744.wt(context),
        decoration: BoxDecoration(
          color: ColorUtils.white248,
        ),
        child: isLoading.value == false ?
        RefreshIndicator(
          onRefresh: () async {
            Get.off(()=>HomeScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
          },
          child: CustomScrollView(
            slivers: [

              SliverAppBar(
                expandedHeight: 97.ht(context),
                collapsedHeight: 97.ht(context),
                primary: true,
                pinned: true,
                automaticallyImplyLeading: false,
                floating: false,
                flexibleSpace: Container(
                  height: 142.ht(context),
                  width: 744.wt(context),
                  decoration: BoxDecoration(
                      color: ColorUtils.white255
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 79.hpmt(context)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      SpacerWidget.spacerWidget(spaceHeight: 65.ht(context)),

                      Row(
                        children: [

                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [


                                Container(
                                  alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
                                  child: Text(
                                    "${"Hello".tr}, ${userName.value}",
                                    textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                    style: GoogleFonts.tajawal(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14.spt(context),
                                      color: ColorUtils.black33,
                                    ),
                                  ),
                                ),


                                Container(
                                  alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
                                  child: Text(
                                    "What do you want to eat today?".tr,
                                    textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                    style: GoogleFonts.tajawal(
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 18.spt(context),
                                      color: ColorUtils.blue192,
                                    ),
                                  ),
                                ),




                              ],
                            ),
                          ),

                          Container(
                            height: 28.ht(context),
                            width: 28.wt(context),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                            ),
                            child: TextButton(
                              style: TextButton.styleFrom(padding: EdgeInsets.zero),
                              onPressed: () {
                                Get.off(()=>NotificationScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                              },
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: Image.asset(
                                  ImagePathUtils.notificationIconImagePath,
                                  fit: BoxFit.cover,
                                  alignment: Alignment.center,
                                ),
                              ),
                            ),
                          ),


                        ],
                      ),


                    ],
                  ),
                ),
              ),


              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 79.hpmt(context)),
                  child: Column(
                    children: [

                      SpacerWidget.spacerWidget(spaceHeight: 15.ht(context)),


                      TextFormField(
                        controller: searchController.value,
                        textAlign: TextAlign.start,
                        cursorColor: ColorUtils.blue192,
                        style: GoogleFonts.openSans(
                          fontSize: 16.spt(context),
                          fontStyle: FontStyle.normal,
                          color: ColorUtils.black51,
                          fontWeight: FontWeight.w400,
                        ),
                        cursorHeight: 20.ht(context),
                        textAlignVertical: TextAlignVertical.top,
                        onChanged: (value) async {
                          isSubmit.value = true;
                          await StoresController.getSearchStoresResponse(
                            search: value,
                            onSuccess: (e) async {
                              isSubmit.value = false;
                            },
                            onFail: (e) async {
                              isSubmit.value = false;
                              CustomSnackBar().errorCustomSnackBar(context: context, message: e);
                            },
                            onExceptionFail: (e) async {
                              isSubmit.value = false;
                              CustomSnackBar().errorCustomSnackBar(context: context, message: e);
                            },
                          ).then((value) {
                            storesResponseModel.value = value;
                          });
                        },
                        decoration: InputDecoration(
                          alignLabelWithHint: true,
                          hintText: "Search for a restaurant, dish...".tr,
                          hintStyle: GoogleFonts.openSans(
                            fontSize: 16.spt(context),
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            color: ColorUtils.gray136,
                          ),
                          filled: true,
                          prefixIconConstraints: BoxConstraints(
                            maxHeight: 48.ht(context),
                            minWidth: 36.wt(context),
                          ),
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(
                                left: 12.lpmt(context),
                                right: 10.rpmt(context),
                                top: 17.33.tpmt(context),
                                bottom: 17.33.bpmt(context)
                            ),
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: Image.asset(
                                ImagePathUtils.searchIconImagePath,
                                fit: BoxFit.cover,
                                alignment: Alignment.center,
                              ),
                            ),
                          ),
                          suffixIcon: Container(
                            height: 24.ht(context),
                            width: 24.wt(context),
                            padding: EdgeInsets.symmetric(
                              horizontal: 13.hpmt(context),
                              vertical: 13.vpmt(context),
                            ),
                            decoration: BoxDecoration(
                                color: Colors.transparent
                            ),
                            child: TextButton(
                              style: TextButton.styleFrom(padding: EdgeInsets.zero),
                              onPressed: () {
                                Get.off(()=>FilterSearchScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                              },
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: Image.asset(
                                  ImagePathUtils.filterIconImagePath,
                                  fit: BoxFit.cover,
                                  alignment: Alignment.center,
                                ),
                              ),
                            ),
                          ),
                          fillColor: ColorUtils.white255,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 12.hpmt(context),
                            vertical: 12.vpmt(context),
                          ),
                          constraints: BoxConstraints(
                            maxWidth: 589.wt(context),
                            maxHeight: 52.ht(context),
                          ),
                          border:  OutlineInputBorder(
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

                      SpacerWidget.spacerWidget(spaceHeight: 36.ht(context)),


                    ],
                  ),
                ),
              ),


              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 79.hpmt(context)),
                  child: Column(
                    children: [

                      Container(
                        alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                        child: Text(
                          "All Restaurants".tr,
                          textAlign: Get.locale.toString() == "en" ?  TextAlign.start : TextAlign.end,
                          style: GoogleFonts.tajawal(
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                            fontSize: 20.spt(context),
                            color: ColorUtils.black30,
                          ),
                        ),
                      ),

                      SpacerWidget.spacerWidget(spaceHeight: 18.ht(context)),


                    ],
                  ),
                ),
              ),



              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 79.hpmt(context)),
                sliver: SliverGrid.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 17.ht(context),
                    mainAxisSpacing: 12.wt(context),
                    childAspectRatio: 188.wt(context) / 216.ht(context),
                  ),
                  itemBuilder: (context, int index) {
                    return Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 9.hpmt(context),
                        vertical: 15.vpmt(context),
                      ),
                      decoration: BoxDecoration(
                        color: ColorUtils.white255,
                        border: Border.all(color: ColorUtils.white217,width: 1),
                        borderRadius: BorderRadius.circular(12.rm(context)),
                      ),
                      margin: EdgeInsets.only(
                        bottom: 17.bpmm(context),
                      ),
                      child: TextButton(
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        onPressed: () async {
                          Get.off(()=>RestaurantDetailsScreen(storeId: storesResponseModel.value.data!.data![index].sId!,),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                        },
                        child: Column(
                          children: [

                            Container(
                              height: 108.hm(context),
                              width: 100.wm(context),
                              decoration: BoxDecoration(
                                  color: Colors.transparent
                              ),
                              child: Column(
                                children: [

                                  Container(
                                    height: 35.hm(context),
                                    width: 100.wm(context),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10.rm(context)),
                                        topRight: Radius.circular(10.rm(context)),
                                      ),
                                      color: storesResponseModel.value.data?.data?[index].status == "crowded" ? ColorUtils.yellow160 :
                                      storesResponseModel.value.data?.data?[index].status == "available" ? ColorUtils.green142 :
                                      ColorUtils.red211,
                                    ),
                                    padding: EdgeInsets.symmetric(vertical: 2.vpmm(context),horizontal: 2.hpmm(context)),
                                    alignment: Alignment.center,
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "${storesResponseModel.value.data?.data?[index].status ?? ""}".tr,
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.tajawal(
                                          fontWeight: FontWeight.w700,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 12.spm(context),
                                          color: ColorUtils.white255,
                                        ),
                                      ),
                                    ),
                                  ),

                                  Expanded(
                                    child: Container(
                                      height: 73.hm(context),
                                      width: 100.wm(context),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          right: BorderSide(color: ColorUtils.white217,width: 0.5),
                                          left: BorderSide(color: ColorUtils.white217,width: 0.5),
                                          bottom: BorderSide(color: ColorUtils.white217,width: 0.5),
                                        ),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10.rm(context)),
                                          bottomRight: Radius.circular(10.rm(context)),
                                        ),
                                      ),
                                      child:  FittedBox(
                                        fit: BoxFit.fill,
                                        child: storesResponseModel.value.data?.data?[index].image == null ?
                                        Image.asset(
                                          ImagePathUtils.noImageIconImagePath,
                                          fit: BoxFit.fill,
                                          alignment: Alignment.center,
                                        ) :
                                        Image.network(
                                          storesResponseModel.value.data?.data?[index].image ?? "",
                                          fit: BoxFit.fill,
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                    ),
                                  )




                                ],
                              ),
                            ),

                            SpacerWidget.spacerWidget(spaceWidth: 15.ht(context)),


                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [


                                  Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "${storesResponseModel.value.data?.data?[index].name ?? ""}".tr,
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.tajawal(
                                        fontWeight: FontWeight.w700,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 18.spt(context),
                                        color: ColorUtils.black30,
                                      ),
                                    ),
                                  ),


                                  SpacerWidget.spacerWidget(spaceHeight: 15.ht(context)),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [


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
                                          "${storesResponseModel.value.data?.data?[index].ratings}".tr,
                                          textAlign: TextAlign.start,
                                          style: GoogleFonts.tajawal(
                                            fontWeight: FontWeight.w500,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 14.spt(context),
                                            color: ColorUtils.black30,
                                          ),
                                        ),
                                      ),


                                    ],
                                  ),


                                  SpacerWidget.spacerWidget(spaceHeight: 15.ht(context)),


                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [


                                      Container(
                                        height: 18.ht(context),
                                        width: 17.wt(context),
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                        ),
                                        child: FittedBox(
                                          fit: BoxFit.cover,
                                          child: Image.asset(
                                            ImagePathUtils.locationIconImagePath,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),

                                      SpacerWidget.spacerWidget(spaceWidth: 8.wt(context)),

                                      storesResponseModel.value.data!.data![index].location != null ?
                                      FutureBuilder(
                                          future: calculateDistanceFromCurrentLocation(
                                            storesResponseModel.value.data!.data![index].location!.coordinates!.first,
                                            storesResponseModel.value.data!.data![index].location!.coordinates!.last,
                                          ),
                                          builder: (context, snapshot) {
                                            return Row(
                                              children: [
                                                Container(
                                                  alignment: Alignment.centerLeft,
                                                  child: Text(
                                                    "${snapshot.data?.ceil()} km near you".tr,
                                                    textAlign: TextAlign.start,
                                                    style: GoogleFonts.tajawal(
                                                      fontWeight: FontWeight.w500,
                                                      fontStyle: FontStyle.normal,
                                                      fontSize: 14.spm(context),
                                                      color: ColorUtils.black30,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          }
                                      ) :
                                      FutureBuilder(
                                          future: calculateDistanceFromCurrentLocation(
                                            storesResponseModel.value.data!.data![index].locations!.first.location!.coordinates!.first,
                                            storesResponseModel.value.data!.data![index].locations!.first.location!.coordinates!.last,
                                          ),
                                          builder: (context, snapshot) {
                                            return Row(
                                              children: [
                                                Container(
                                                  alignment: Alignment.centerLeft,
                                                  child: Text(
                                                    "${snapshot.data?.ceil()} km near you".tr,
                                                    textAlign: TextAlign.start,
                                                    style: GoogleFonts.tajawal(
                                                      fontWeight: FontWeight.w500,
                                                      fontStyle: FontStyle.normal,
                                                      fontSize: 14.spm(context),
                                                      color: ColorUtils.black30,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          }
                                      ),


                                    ],
                                  ),





                                ],
                              ),
                            )


                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: storesResponseModel.value.data?.data?.length,
                ),
              ),





            ],
          ),
        ) :
        Center(child: CircularProgressIndicator(),),
      ));
    } else {
      return Obx(()=>Container(
        height: 844.hm(context),
        width: 390.wm(context),
        decoration: BoxDecoration(
          color: ColorUtils.white248,
        ),
        child: isLoading.value == false ?
        RefreshIndicator(
          onRefresh: () async {
            Get.off(()=>HomeScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
          },
          child: CustomScrollView(
            slivers: [


              SliverAppBar(
                expandedHeight: 180.hm(context),
                collapsedHeight: 180.hm(context),
                primary: true,
                pinned: true,
                automaticallyImplyLeading: false,
                floating: false,
                flexibleSpace: Container(
                  height: 210.hm(context),
                  width: 390.wm(context),
                  decoration: BoxDecoration(
                      color: ColorUtils.white255
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16.hpmm(context)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      SpacerWidget.spacerWidget(spaceHeight: 76.hm(context)),

                      Row(
                        children: [

                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [


                                Container(
                                  alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
                                  child: Text(
                                    "${"Hello".tr}, ${userName.value}".tr,
                                    textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                    style: GoogleFonts.tajawal(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14.spm(context),
                                      color: ColorUtils.black33,
                                    ),
                                  ),
                                ),


                                Container(
                                  alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
                                  child: Text(
                                    "What do you want to eat today?".tr,
                                    textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                    style: GoogleFonts.tajawal(
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 18.spm(context),
                                      color: ColorUtils.blue192,
                                    ),
                                  ),
                                ),




                              ],
                            ),
                          ),

                          Container(
                            height: 28.hm(context),
                            width: 28.wm(context),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                            ),
                            child: TextButton(
                              style: TextButton.styleFrom(padding: EdgeInsets.zero),
                              onPressed: () {
                                Get.off(()=>NotificationScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                              },
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: Image.asset(
                                  ImagePathUtils.notificationIconImagePath,
                                  fit: BoxFit.cover,
                                  alignment: Alignment.center,
                                ),
                              ),
                            ),
                          ),


                        ],
                      ),

                      SpacerWidget.spacerWidget(spaceHeight: 27.hm(context)),


                      TextFormField(
                        controller: searchController.value,
                        textAlign: TextAlign.start,
                        cursorColor: ColorUtils.blue192,
                        style: GoogleFonts.openSans(
                          fontSize: 16.spm(context),
                          fontStyle: FontStyle.normal,
                          color: ColorUtils.black51,
                          fontWeight: FontWeight.w400,
                        ),
                        cursorHeight: 20.hm(context),
                        textAlignVertical: TextAlignVertical.top,
                        onChanged: (value) async {
                          isSubmit.value = true;
                          await StoresController.getSearchStoresResponse(
                            search: value,
                            onSuccess: (e) async {
                              isSubmit.value = false;
                            },
                            onFail: (e) async {
                              isSubmit.value = false;
                              CustomSnackBar().errorCustomSnackBar(context: context, message: e);
                            },
                            onExceptionFail: (e) async {
                              isSubmit.value = false;
                              CustomSnackBar().errorCustomSnackBar(context: context, message: e);
                            },
                          ).then((value) {
                            storesResponseModel.value = value;
                          });
                        },
                        decoration: InputDecoration(
                          alignLabelWithHint: true,
                          hintText: "Search for a restaurant, dish...".tr,
                          hintStyle: GoogleFonts.openSans(
                            fontSize: 16.spm(context),
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            color: ColorUtils.gray136,
                          ),
                          filled: true,
                          prefixIconConstraints: BoxConstraints(
                            maxHeight: 48.hm(context),
                            minWidth: 36.wm(context),
                          ),
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(
                              left: 12.lpmm(context),
                              right: 10.rpmm(context),
                              top: 17.33.tpmm(context),
                              bottom: 17.33.bpmm(context),
                            ),
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: Image.asset(
                                ImagePathUtils.searchIconImagePath,
                                fit: BoxFit.cover,
                                alignment: Alignment.center,
                              ),
                            ),
                          ),
                          suffixIcon: Container(
                            height: 24.hm(context),
                            width: 24.wm(context),
                            padding: EdgeInsets.symmetric(
                              horizontal: 13.hpmm(context),
                              vertical: 13.vpmm(context),
                            ),
                            decoration: BoxDecoration(
                                color: Colors.transparent
                            ),
                            child: TextButton(
                              style: TextButton.styleFrom(padding: EdgeInsets.zero),
                              onPressed: () {
                                Get.off(()=>FilterSearchScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                              },
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: Image.asset(
                                  ImagePathUtils.filterIconImagePath,
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
                            borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).height > 1000 ? 8.rt(context) : 8.rm(context)),
                            borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).height > 1000 ? 8.rt(context) : 8.rm(context)),
                            borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).height > 1000 ? 8.rt(context) : 8.rm(context)),
                            borderSide: BorderSide(color: ColorUtils.blue192,width: 1),
                          ),

                        ),
                      ),



                    ],
                  ),
                ),
              ),



              // SliverToBoxAdapter(
              //   child: Padding(
              //     padding: EdgeInsets.symmetric(horizontal: 16.hpmm(context)),
              //     child: Column(
              //       children: [
              //
              //         SpacerWidget.spacerWidget(spaceHeight: 21.hm(context)),
              //
              //
              //         Container(
              //           alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
              //           child: Text(
              //             "Top Rated Restaurants".tr,
              //             textAlign: Get.locale.toString() == "en" ?  TextAlign.start : TextAlign.end,
              //             style: GoogleFonts.tajawal(
              //               fontWeight: FontWeight.w700,
              //               fontStyle: FontStyle.normal,
              //               fontSize: 20.spm(context),
              //               color: ColorUtils.black30,
              //             ),
              //           ),
              //         ),
              //
              //         SpacerWidget.spacerWidget(spaceHeight: 17.hm(context)),
              //
              //
              //
              //       ],
              //     ),
              //   ),
              // ),
              //
              //
              // SliverList(
              //     delegate: SliverChildBuilderDelegate(
              //           (context,int index) {
              //         return Padding(
              //           padding: EdgeInsets.symmetric(horizontal: 16.hpmm(context)),
              //           child: Container(
              //             padding: EdgeInsets.symmetric(
              //               horizontal: 9.hpmm(context),
              //               vertical: 15.vpmm(context),
              //             ),
              //             decoration: BoxDecoration(
              //               color: ColorUtils.white255,
              //               border: Border.all(color: ColorUtils.white217,width: 1),
              //               borderRadius: BorderRadius.circular(12.rm(context)),
              //             ),
              //             margin: EdgeInsets.only(
              //               bottom: 17.bpmm(context),
              //             ),
              //             child: TextButton(
              //               style: TextButton.styleFrom(
              //                 padding: EdgeInsets.zero,
              //               ),
              //               onPressed: () async {
              //                 Get.off(()=>RestaurantDetailsScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
              //               },
              //               child: Row(
              //                 children: [
              //
              //                   Container(
              //                     height: 108.hm(context),
              //                     width: 100.wm(context),
              //                     decoration: BoxDecoration(
              //                         color: Colors.transparent
              //                     ),
              //                     child: Column(
              //                       children: [
              //
              //                         Container(
              //                           height: 35.hm(context),
              //                           width: 100.wm(context),
              //                           decoration: BoxDecoration(
              //                             borderRadius: BorderRadius.only(
              //                               topLeft: Radius.circular(10.rm(context)),
              //                               topRight: Radius.circular(10.rm(context)),
              //                             ),
              //                             color: firstImageList[index].status == "Crowded" ? ColorUtils.yellow160 :
              //                             firstImageList[index].status == "Available" ? ColorUtils.green142 :
              //                             ColorUtils.red211,
              //                           ),
              //                           padding: EdgeInsets.symmetric(vertical: 2.vpmm(context),horizontal: 2.hpmm(context)),
              //                           alignment: Alignment.center,
              //                           child: Container(
              //                             alignment: Alignment.center,
              //                             child: Text(
              //                               "${firstImageList[index].status}".tr,
              //                               textAlign: TextAlign.center,
              //                               style: GoogleFonts.tajawal(
              //                                 fontWeight: FontWeight.w700,
              //                                 fontStyle: FontStyle.normal,
              //                                 fontSize: 12.spm(context),
              //                                 color: ColorUtils.white255,
              //                               ),
              //                             ),
              //                           ),
              //                         ),
              //
              //                         Expanded(
              //                           child: Container(
              //                             height: 73.hm(context),
              //                             width: 100.wm(context),
              //                             decoration: BoxDecoration(
              //                               border: Border(
              //                                 right: BorderSide(color: ColorUtils.white217,width: 0.5),
              //                                 left: BorderSide(color: ColorUtils.white217,width: 0.5),
              //                                 bottom: BorderSide(color: ColorUtils.white217,width: 0.5),
              //                               ),
              //                               borderRadius: BorderRadius.only(
              //                                 bottomLeft: Radius.circular(10.rm(context)),
              //                                 bottomRight: Radius.circular(10.rm(context)),
              //                               ),
              //                             ),
              //                             child: FittedBox(
              //                               fit: BoxFit.fill,
              //                               child: Image.asset(
              //                                 firstImageList[index].image!,
              //                                 fit: BoxFit.fill,
              //                                 alignment: Alignment.center,
              //                               ),
              //                             ),
              //                           ),
              //                         )
              //
              //
              //
              //
              //                       ],
              //                     ),
              //                   ),
              //
              //                   SpacerWidget.spacerWidget(spaceWidth: 12.wm(context)),
              //
              //
              //                   Expanded(
              //                     child: Column(
              //                       mainAxisAlignment: MainAxisAlignment.center,
              //                       crossAxisAlignment: CrossAxisAlignment.start,
              //                       children: [
              //
              //
              //                         Container(
              //                           alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
              //                           child: Text(
              //                             "${firstImageList[index].restaurant}".tr,
              //                             textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
              //                             style: GoogleFonts.tajawal(
              //                               fontWeight: FontWeight.w700,
              //                               fontStyle: FontStyle.normal,
              //                               fontSize: 18.spm(context),
              //                               color: ColorUtils.black30,
              //                             ),
              //                           ),
              //                         ),
              //
              //
              //                         SpacerWidget.spacerWidget(spaceHeight: 10.hm(context)),
              //
              //                         Row(
              //                           mainAxisAlignment: MainAxisAlignment.start,
              //                           crossAxisAlignment: CrossAxisAlignment.center,
              //                           children: [
              //
              //
              //                             Container(
              //                               height: 18.hm(context),
              //                               width: 17.wm(context),
              //                               decoration: BoxDecoration(
              //                                 color: Colors.transparent,
              //                               ),
              //                               child: FittedBox(
              //                                 fit: BoxFit.cover,
              //                                 child: Image.asset(
              //                                   ImagePathUtils.starIconImagePath,
              //                                   fit: BoxFit.cover,
              //                                 ),
              //                               ),
              //                             ),
              //
              //                             SpacerWidget.spacerWidget(spaceWidth: 8.wm(context)),
              //
              //                             Container(
              //                               alignment: Alignment.centerLeft,
              //                               child: Text(
              //                                 "${firstImageList[index].rating}".tr,
              //                                 textAlign: TextAlign.start,
              //                                 style: GoogleFonts.tajawal(
              //                                   fontWeight: FontWeight.w500,
              //                                   fontStyle: FontStyle.normal,
              //                                   fontSize: 14.spm(context),
              //                                   color: ColorUtils.black30,
              //                                 ),
              //                               ),
              //                             ),
              //
              //
              //                           ],
              //                         ),
              //
              //
              //                         SpacerWidget.spacerWidget(spaceHeight: 10.hm(context)),
              //
              //
              //                         Row(
              //                           mainAxisAlignment: MainAxisAlignment.start,
              //                           crossAxisAlignment: CrossAxisAlignment.center,
              //                           children: [
              //
              //
              //                             Container(
              //                               height: 18.hm(context),
              //                               width: 17.wm(context),
              //                               decoration: BoxDecoration(
              //                                 color: Colors.transparent,
              //                               ),
              //                               child: FittedBox(
              //                                 fit: BoxFit.cover,
              //                                 child: Image.asset(
              //                                   ImagePathUtils.locationIconImagePath,
              //                                   fit: BoxFit.cover,
              //                                 ),
              //                               ),
              //                             ),
              //
              //                             SpacerWidget.spacerWidget(spaceWidth: 8.wm(context)),
              //
              //                             Container(
              //                               alignment: Alignment.centerLeft,
              //                               child: Text(
              //                                 "${firstImageList[index].address}".tr,
              //                                 textAlign: TextAlign.start,
              //                                 style: GoogleFonts.tajawal(
              //                                   fontWeight: FontWeight.w500,
              //                                   fontStyle: FontStyle.normal,
              //                                   fontSize: 14.spm(context),
              //                                   color: ColorUtils.black30,
              //                                 ),
              //                               ),
              //                             ),
              //
              //
              //                           ],
              //                         ),
              //
              //
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
              //           ),
              //         );
              //       },
              //       childCount: firstImageList.length,
              //     )
              // ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.hpmm(context)),
                  child: Column(
                    children: [

                      SpacerWidget.spacerWidget(spaceHeight: 16.hm(context)),

                      Container(
                        alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                        child: Text(
                          "All Restaurant".tr,
                          textAlign: Get.locale.toString() == "en" ?  TextAlign.start : TextAlign.end,
                          style: GoogleFonts.tajawal(
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                            fontSize: 20.spm(context),
                            color: ColorUtils.black30,
                          ),
                        ),
                      ),

                      SpacerWidget.spacerWidget(spaceHeight: 17.hm(context)),



                    ],
                  ),
                ),
              ),


              // SliverToBoxAdapter(
              //   child: Padding(
              //     padding: EdgeInsets.symmetric(horizontal: 16.hpmm(context)),
              //     child: Column(
              //       children: [
              //
              //         SpacerWidget.spacerWidget(spaceHeight: 16.hm(context)),
              //
              //         Container(
              //           height: 97.hm(context),
              //           width: 390.wm(context),
              //           decoration: BoxDecoration(
              //               color: Colors.transparent
              //           ),
              //           child: ListView.builder(
              //             scrollDirection: Axis.horizontal,
              //             itemCount: listImageList.length,
              //             itemBuilder: (context,int index) {
              //               return Container(
              //                 width: 80.wm(context),
              //                 alignment: Alignment.center,
              //                 child: Column(
              //                   mainAxisAlignment: MainAxisAlignment.center,
              //                   crossAxisAlignment: CrossAxisAlignment.center,
              //                   children: [
              //                     Container(
              //                       height: 60.hm(context),
              //                       width: 60.wm(context),
              //                       decoration: BoxDecoration(
              //                         color: Colors.transparent,
              //                         borderRadius: BorderRadius.circular(8.rm(context)),
              //                       ),
              //                       margin: EdgeInsets.only(
              //                         right: 12.rpmm(context),
              //                       ),
              //                       child: FittedBox(
              //                         fit: BoxFit.fill,
              //                         child: Image.asset(
              //                           listImageList[index].image!,
              //                           fit: BoxFit.fill,
              //                         ),
              //                       ),
              //                     ),
              //
              //                     SpacerWidget.spacerWidget(spaceHeight: 8.hm(context)),
              //
              //                     Expanded(
              //                       child: Container(
              //                         alignment: Alignment.topCenter,
              //                         child: Text(
              //                           "${listImageList[index].name}".tr,
              //                           textAlign: TextAlign.center,
              //                           style: GoogleFonts.tajawal(
              //                             fontWeight: FontWeight.w500,
              //                             fontStyle: FontStyle.normal,
              //                             fontSize: 16.spm(context),
              //                             color: ColorUtils.black255,
              //                           ),
              //                         ),
              //                       ),
              //                     ),
              //
              //
              //                   ],
              //                 ),
              //               );
              //             },
              //           ),
              //         ),
              //
              //         SpacerWidget.spacerWidget(spaceHeight: 17.hm(context)),
              //
              //
              //
              //       ],
              //     ),
              //   ),
              // ),


              isSubmit.value == false ?
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (context,int index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.hpmm(context)),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 9.hpmm(context),
                            vertical: 15.vpmm(context),
                          ),
                          decoration: BoxDecoration(
                            color: ColorUtils.white255,
                            border: Border.all(color: ColorUtils.white217,width: 1),
                            borderRadius: BorderRadius.circular(12.rm(context)),
                          ),
                          margin: EdgeInsets.only(
                            bottom: 17.bpmm(context),
                          ),
                          child: TextButton(
                            style: TextButton.styleFrom(padding: EdgeInsets.zero),
                            onPressed: () async {
                              Get.off(()=>RestaurantDetailsScreen(storeId: storesResponseModel.value.data!.data![index].sId!,),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                            },
                            child: Row(
                              children: [

                                Container(
                                  height: 108.hm(context),
                                  width: 100.wm(context),
                                  decoration: BoxDecoration(
                                      color: Colors.transparent
                                  ),
                                  child: Column(
                                    children: [

                                      Container(
                                        height: 35.hm(context),
                                        width: 100.wm(context),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10.rm(context)),
                                            topRight: Radius.circular(10.rm(context)),
                                          ),
                                          color: storesResponseModel.value.data?.data?[index].status == "crowded" ? ColorUtils.yellow160 :
                                          storesResponseModel.value.data?.data?[index].status == "available" ? ColorUtils.green142 :
                                          ColorUtils.red211,
                                        ),
                                        padding: EdgeInsets.symmetric(vertical: 2.vpmm(context),horizontal: 2.hpmm(context)),
                                        alignment: Alignment.center,
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "${storesResponseModel.value.data?.data?[index].status ?? ""}".tr,
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.tajawal(
                                              fontWeight: FontWeight.w700,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 12.spm(context),
                                              color: ColorUtils.white255,
                                            ),
                                          ),
                                        ),
                                      ),

                                      Expanded(
                                        child: Container(
                                          height: 73.hm(context),
                                          width: 100.wm(context),
                                          decoration: BoxDecoration(
                                            border: Border(
                                              right: BorderSide(color: ColorUtils.white217,width: 0.5),
                                              left: BorderSide(color: ColorUtils.white217,width: 0.5),
                                              bottom: BorderSide(color: ColorUtils.white217,width: 0.5),
                                            ),
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(10.rm(context)),
                                              bottomRight: Radius.circular(10.rm(context)),
                                            ),
                                          ),
                                          child: FittedBox(
                                            fit: BoxFit.fill,
                                            child: storesResponseModel.value.data?.data?[index].image == null ?
                                            Image.asset(
                                              ImagePathUtils.noImageIconImagePath,
                                              fit: BoxFit.fill,
                                              alignment: Alignment.center,
                                            ) :
                                            Image.network(
                                              storesResponseModel.value.data?.data?[index].image ?? "",
                                              fit: BoxFit.fill,
                                              alignment: Alignment.center,
                                            ),
                                          ),
                                        ),
                                      )




                                    ],
                                  ),
                                ),

                                SpacerWidget.spacerWidget(spaceWidth: 12.wm(context)),


                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [


                                      Container(
                                        alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                        child: Text(
                                          "${storesResponseModel.value.data?.data?[index].name ?? ""}".tr,
                                          textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                          style: GoogleFonts.tajawal(
                                            fontWeight: FontWeight.w700,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 18.spm(context),
                                            color: ColorUtils.black30,
                                          ),
                                        ),
                                      ),


                                      SpacerWidget.spacerWidget(spaceHeight: 10.hm(context)),

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [


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
                                              "${storesResponseModel.value.data?.data?[index].ratings ?? ""}".tr,
                                              textAlign: TextAlign.start,
                                              style: GoogleFonts.tajawal(
                                                fontWeight: FontWeight.w500,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 14.spm(context),
                                                color: ColorUtils.black30,
                                              ),
                                            ),
                                          ),


                                        ],
                                      ),


                                      SpacerWidget.spacerWidget(spaceHeight: 10.hm(context)),


                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [


                                          Container(
                                            height: 18.hm(context),
                                            width: 17.wm(context),
                                            decoration: BoxDecoration(
                                              color: Colors.transparent,
                                            ),
                                            child: FittedBox(
                                              fit: BoxFit.cover,
                                              child: Image.asset(
                                                ImagePathUtils.locationIconImagePath,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),

                                          SpacerWidget.spacerWidget(spaceWidth: 8.wm(context)),

                                          storesResponseModel.value.data?.data?[index].location != null ?
                                          FutureBuilder(
                                              future: calculateDistanceFromCurrentLocation(
                                                storesResponseModel.value.data!.data![index].location!.coordinates!.first,
                                                storesResponseModel.value.data!.data![index].location!.coordinates!.last,
                                              ),
                                              builder: (context, snapshot) {
                                                return Row(
                                                  children: [
                                                    Container(
                                                      alignment: Alignment.centerLeft,
                                                      child: Text(
                                                        "${snapshot.data?.ceil()} km near you".tr,
                                                        textAlign: TextAlign.start,
                                                        style: GoogleFonts.tajawal(
                                                          fontWeight: FontWeight.w500,
                                                          fontStyle: FontStyle.normal,
                                                          fontSize: 14.spm(context),
                                                          color: ColorUtils.black30,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              }
                                          ) :
                                          FutureBuilder(
                                              future: calculateDistanceFromCurrentLocation(
                                                storesResponseModel.value.data!.data![index].locations!.first.location!.coordinates!.first,
                                                storesResponseModel.value.data!.data![index].locations!.first.location!.coordinates!.last,
                                              ),
                                              builder: (context, snapshot) {
                                                return Row(
                                                  children: [
                                                    Container(
                                                      alignment: Alignment.centerLeft,
                                                      child: Text(
                                                        "${snapshot.data?.ceil()} km near you".tr,
                                                        textAlign: TextAlign.start,
                                                        style: GoogleFonts.tajawal(
                                                          fontWeight: FontWeight.w500,
                                                          fontStyle: FontStyle.normal,
                                                          fontSize: 14.spm(context),
                                                          color: ColorUtils.black30,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              }
                                          ),

                                        ],
                                      ),





                                    ],
                                  ),
                                ),


                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    childCount: storesResponseModel.value.data?.data?.length,
                  )
              ) :
              SliverToBoxAdapter(
                child: Container(
                  height: 45.hm(context),
                  width: 390.wm(context),
                  decoration: BoxDecoration(
                      color: Colors.transparent
                  ),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),


            ],
          ),
        ) :
        Center(child: CircularProgressIndicator(),),
      ));
    }
  }



}


class GridImageList {
  String? image;
  String? rating;
  String? address;
  String? restaurant;
  String? status;

  GridImageList({
    required this.image,
    required this.rating,
    required this.address,
    required this.restaurant,
    required this.status,
  });
}


class ListImageList {
  String? image;
  String? name;

  ListImageList({
    required this.image,
    required this.name,
  });
}


