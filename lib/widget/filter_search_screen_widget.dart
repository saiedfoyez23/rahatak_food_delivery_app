import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rahatak_food_delivery_app/utils/utils.dart';
import 'package:rahatak_food_delivery_app/widget/widget.dart';

import '../controller/controller.dart';
import '../model/model.dart';
import '../screen/screen.dart';

class FilterSearchScreenWidget extends GetxController {


  RxInt bigIndex = 0.obs;
  RxBool isLoading = false.obs;
  Rx<CategoriesResponseModel> categoriesResponseModel = CategoriesResponseModel().obs;
  RxString categoryId = "".obs;
  BuildContext context;
  RxString governorate = "".obs;
  FilterSearchScreenWidget({required this.context});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
      await ProductController.getCategoriesResponse(
        onSuccess: (e) async {
          isLoading.value = false;
          await ProductController.checkLocalCategoriesResponse().then((value) {
            if(value?.data != null) {
              categoriesResponseModel.value = value!;
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


  RxList<ListImageList> listImageList = <ListImageList>[
    ListImageList(image: ImagePathUtils.extraImageList_1, name: "Burger"),
    ListImageList(image: ImagePathUtils.extraImageList_2, name: "Pizza"),
    ListImageList(image: ImagePathUtils.extraImageList_3, name: "Seafood"),
    ListImageList(image: ImagePathUtils.extraImageList_4, name: "Grilled"),
    ListImageList(image: ImagePathUtils.extraImageList_5, name: "Shawarma"),
    ListImageList(image: ImagePathUtils.extraImageList_6, name: "Pasta"),
    ListImageList(image: ImagePathUtils.extraImageList_7, name: "Salad"),
    ListImageList(image: ImagePathUtils.extraImageList_8, name: "Juices"),
    ListImageList(image: ImagePathUtils.extraImageList_9, name: "Pastries"),
    ListImageList(image: ImagePathUtils.extraImageList_10, name: "Steak"),
  ].obs;

  RxList<String> locations = <String>[
    "All",
    "Muscat",
    "Al-Batinah",
    "Musandam",
    "Al Wusta",
    "AdDakhiliyah",
    "Al Dhahirah",
    "Sharkia",
    "Dhofar",
  ].obs;


  RxInt bigIndex_1 = 0.obs;
  RxInt bigIndex_2 = 0.obs;


  Widget filterSearchScreenWidget({required BuildContext context}) {
    // if(MediaQuery.sizeOf(context).height > 1000) {
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
    //                 SpacerWidget.spacerWidget(spaceHeight: 11.ht(context),),
    //
    //                 Padding(
    //                   padding: EdgeInsets.symmetric(horizontal: 37.hpmt(context)),
    //                   child: Directionality(
    //                     textDirection: TextDirection.ltr,
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
    //                               Get.off(()=>SearchScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
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
    //                               "Filter search".tr,
    //                               textAlign: TextAlign.center,
    //                               style: GoogleFonts.tajawal(
    //                                 fontWeight: FontWeight.w700,
    //                                 fontStyle: FontStyle.normal,
    //                                 fontSize: 16.spt(context),
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
    //                 SpacerWidget.spacerWidget(spaceHeight: 26.ht(context),),
    //
    //                 Padding(
    //                   padding: EdgeInsets.symmetric(horizontal: 138.hpmt(context)),
    //                   child: Column(
    //                     children: [
    //                       Container(
    //                         alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
    //                         child: Text(
    //                           "Type of food".tr,
    //                           textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
    //                           style: GoogleFonts.tajawal(
    //                             fontWeight: FontWeight.w700,
    //                             fontStyle: FontStyle.normal,
    //                             fontSize: 18.spt(context),
    //                             color: ColorUtils.black30,
    //                           ),
    //                         ),
    //                       ),
    //
    //
    //                       SpacerWidget.spacerWidget(spaceHeight: 18.hm(context),),
    //
    //
    //                       Wrap(
    //                         children: List.generate(categoriesResponseModel.value.data!.length, (index) {
    //                           return Padding(
    //                             padding: EdgeInsets.only(right: 10.rpmt(context)),
    //                             child: SizedBox(
    //                               height: 110.ht(context),
    //                               width: 90.wt(context),
    //                               child: TextButton(
    //                                 onPressed: () async {
    //                                   bigIndex.value = index + 1 ;
    //                                 },
    //                                 style: TextButton.styleFrom(padding: EdgeInsets.zero),
    //                                 child: Container(
    //                                   height: 110.ht(context),
    //                                   width: 90.wt(context),
    //                                   decoration: BoxDecoration(
    //                                       color: Colors.transparent,
    //                                       borderRadius: BorderRadius.circular(8.rt(context)),
    //                                       border: bigIndex.value == (index + 1) ?
    //                                       Border.all(color: ColorUtils.blue192,width: 1) :
    //                                       Border.all(color: Colors.transparent,width: 1)
    //                                   ),
    //                                   child: Column(
    //                                     mainAxisAlignment: MainAxisAlignment.center,
    //                                     crossAxisAlignment: CrossAxisAlignment.center,
    //                                     children: [
    //                                       Container(
    //                                         height: 60.ht(context),
    //                                         width: 60.wt(context),
    //                                         decoration: BoxDecoration(
    //                                           color: Colors.transparent,
    //                                           borderRadius: BorderRadius.circular(8.rm(context)),
    //                                         ),
    //                                         child: FittedBox(
    //                                           fit: BoxFit.fill,
    //                                           child: Image.network(
    //                                             categoriesResponseModel.value.data![index].icon!,
    //                                             fit: BoxFit.fill,
    //                                           ),
    //                                         ),
    //                                       ),
    //
    //                                       SpacerWidget.spacerWidget(spaceHeight: 8.ht(context)),
    //
    //
    //                                       Container(
    //                                         alignment: Alignment.center,
    //                                         child: Text(
    //                                           "${categoriesResponseModel.value.data![index].name ?? ""}".tr,
    //                                           textAlign: TextAlign.center,
    //                                           style: GoogleFonts.tajawal(
    //                                             fontWeight: FontWeight.w500,
    //                                             fontStyle: FontStyle.normal,
    //                                             fontSize: 16.spt(context),
    //                                             color: ColorUtils.black255,
    //                                           ),
    //                                         ),
    //                                       ),
    //
    //
    //                                     ],
    //                                   ),
    //                                 ),
    //                               ),
    //                             ),
    //                           );
    //                         }),
    //                       ),
    //
    //
    //                       SpacerWidget.spacerWidget(spaceHeight: 13.ht(context),),
    //
    //
    //                       Container(
    //                         alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
    //                         child: Text(
    //                           "Locations".tr,
    //                           textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
    //                           style: GoogleFonts.tajawal(
    //                             fontWeight: FontWeight.w700,
    //                             fontStyle: FontStyle.normal,
    //                             fontSize: 18.spt(context),
    //                             color: ColorUtils.black30,
    //                           ),
    //                         ),
    //                       ),
    //
    //
    //                       SpacerWidget.spacerWidget(spaceHeight: 18.ht(context),),
    //
    //
    //                       Wrap(
    //                         children: List.generate(locations.length, (index) {
    //                           return SizedBox(
    //                             height: 70.ht(context),
    //                             width: 120.wt(context),
    //                             child: TextButton(
    //                               onPressed: () async {
    //                                 bigIndex_1.value = index + 1 ;
    //                               },
    //                               style: TextButton.styleFrom(padding: EdgeInsets.zero),
    //                               child: Container(
    //                                 height: 70.ht(context),
    //                                 width: 120.wt(context),
    //                                 decoration: BoxDecoration(
    //                                   color: bigIndex_1.value == (index + 1) ? ColorUtils.blue192 : Colors.transparent,
    //                                   borderRadius: BorderRadius.circular(8.rt(context)),
    //                                   border: Border.all(color: ColorUtils.white217,width: 1),
    //                                 ),
    //                                 margin: EdgeInsets.only(bottom: 10.bpmt(context),right: 10.rpmt(context)),
    //                                 padding: EdgeInsets.symmetric(horizontal: 5.hpmt(context),vertical: 5.vpmt(context)),
    //                                 child: Column(
    //                                   mainAxisAlignment: MainAxisAlignment.center,
    //                                   crossAxisAlignment: CrossAxisAlignment.end,
    //                                   children: [
    //
    //                                     Container(
    //                                       alignment: Alignment.center,
    //                                       child: Text(
    //                                         "${locations[index]}".tr,
    //                                         textAlign: TextAlign.center,
    //                                         style: GoogleFonts.tajawal(
    //                                           fontWeight: FontWeight.w700,
    //                                           fontStyle: FontStyle.normal,
    //                                           fontSize: 16.spt(context),
    //                                           color: bigIndex_1.value == (index + 1) ? ColorUtils.white255 : ColorUtils.black51,
    //                                         ),
    //                                       ),
    //                                     ),
    //
    //
    //                                   ],
    //                                 ),
    //                               ),
    //                             ),
    //                           );
    //                         }),
    //                       ),
    //
    //
    //                       SpacerWidget.spacerWidget(spaceHeight: 13.ht(context),),
    //
    //
    //                       Container(
    //                         alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
    //                         child: Text(
    //                           "working hours".tr,
    //                           textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
    //                           style: GoogleFonts.tajawal(
    //                             fontWeight: FontWeight.w700,
    //                             fontStyle: FontStyle.normal,
    //                             fontSize: 18.spt(context),
    //                             color: ColorUtils.black30,
    //                           ),
    //                         ),
    //                       ),
    //
    //
    //                       SpacerWidget.spacerWidget(spaceHeight: 18.ht(context),),
    //
    //
    //                       Wrap(
    //
    //                         children: List.generate(3, (index) {
    //                           return SizedBox(
    //                             height: 70.ht(context),
    //                             width: 143.wt(context),
    //                             child: TextButton(
    //                               onPressed: () async {
    //                                 bigIndex_2.value = index + 1 ;
    //                               },
    //                               style: TextButton.styleFrom(padding: EdgeInsets.zero),
    //                               child: Container(
    //                                 height: 70.ht(context),
    //                                 width: 143.wt(context),
    //                                 decoration: BoxDecoration(
    //                                   color: bigIndex_2.value == (index + 1) ? ColorUtils.blue192 : Colors.transparent,
    //                                   borderRadius: BorderRadius.circular(8.rt(context)),
    //                                   border: Border.all(color: ColorUtils.white217,width: 1),
    //                                 ),
    //                                 margin: EdgeInsets.only(bottom: 10.bpmt(context),right: 10.rpmt(context)),
    //                                 padding: EdgeInsets.symmetric(horizontal: 5.hpmt(context),vertical: 5.vpmt(context)),
    //                                 child: Column(
    //                                   mainAxisAlignment: MainAxisAlignment.center,
    //                                   crossAxisAlignment: CrossAxisAlignment.end,
    //                                   children: [
    //
    //                                     Container(
    //                                       alignment: Alignment.center,
    //                                       child: Text(
    //                                         index == 0 ? "All".tr : index == 1 ? "Open Now".tr : "24 hours".tr,
    //                                         textAlign: TextAlign.center,
    //                                         style: GoogleFonts.tajawal(
    //                                           fontWeight: FontWeight.w700,
    //                                           fontStyle: FontStyle.normal,
    //                                           fontSize: 16.spt(context),
    //                                           color: bigIndex_2.value == (index + 1) ? ColorUtils.white255 : ColorUtils.black51,
    //                                         ),
    //                                       ),
    //                                     ),
    //
    //
    //                                   ],
    //                                 ),
    //                               ),
    //                             ),
    //                           );
    //                         }),
    //                       ),
    //
    //
    //                       SpacerWidget.spacerWidget(spaceHeight: 40.ht(context),),
    //
    //
    //                       Row(
    //                         mainAxisAlignment: MainAxisAlignment.center,
    //                         children: [
    //
    //
    //                           Container(
    //                             height: 48.ht(context),
    //                             width: 205.wt(context),
    //                             decoration: BoxDecoration(
    //                                 color: ColorUtils.blue192,
    //                                 borderRadius: BorderRadius.circular(8.rt(context),)
    //                             ),
    //                             child: TextButton(
    //                               style: TextButton.styleFrom(padding: EdgeInsets.zero),
    //                               onPressed: () async {
    //                                 //Get.off(()=>SearchResultScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
    //                               },
    //                               child: Center(
    //                                 child: Text(
    //                                   "Search".tr,
    //                                   textAlign: TextAlign.center,
    //                                   style: GoogleFonts.tajawal(
    //                                       fontWeight: FontWeight.w700,
    //                                       fontStyle: FontStyle.normal,
    //                                       fontSize: 18.spt(context),
    //                                       color: ColorUtils.white255
    //                                   ),
    //                                 ),
    //                               ),
    //                             ),
    //                           ),
    //
    //                           SpacerWidget.spacerWidget(spaceWidth: 16.wt(context)),
    //
    //
    //                           Container(
    //                             height: 48.ht(context),
    //                             width: 205.wt(context),
    //                             decoration: BoxDecoration(
    //                               border: Border.all(color: ColorUtils.gray136,width: 1),
    //                               color: ColorUtils.white255,
    //                               borderRadius: BorderRadius.circular(8.rt(context),),
    //                             ),
    //                             child: TextButton(
    //                               style: TextButton.styleFrom(padding: EdgeInsets.zero),
    //                               onPressed: () async {
    //                                 Get.off(()=>SearchScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
    //                               },
    //                               child: Center(
    //                                 child: Text(
    //                                   "Cancel".tr,
    //                                   textAlign: TextAlign.center,
    //                                   style: GoogleFonts.tajawal(
    //                                     fontWeight: FontWeight.w700,
    //                                     fontStyle: FontStyle.normal,
    //                                     fontSize: 18.spt(context),
    //                                     color: ColorUtils.black51,
    //                                   ),
    //                                 ),
    //                               ),
    //                             ),
    //                           ),
    //
    //
    //                         ],
    //                       ),
    //
    //
    //                       SpacerWidget.spacerWidget(spaceHeight: 20.ht(context),),
    //                     ],
    //                   ),
    //                 ),
    //
    //
    //
    //
    //
    //               ],
    //             ),
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
                                Get.off(()=>SearchScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
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
                                "Filter search".tr,
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
                        "Type of food".tr,
                        textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: 18.spm(context),
                          color: ColorUtils.black30,
                        ),
                      ),
                    ),


                    SpacerWidget.spacerWidget(spaceHeight: 18.hm(context),),


                    Wrap(
                      children: List.generate(categoriesResponseModel.value.data!.length, (index) {
                        return SizedBox(
                          height: 110.hm(context),
                          width: 80.wm(context),
                          child: TextButton(
                            onPressed: () async {
                              bigIndex.value = index + 1 ;
                              categoryId.value = categoriesResponseModel.value.data?[index].sId;
                            },
                            style: TextButton.styleFrom(padding: EdgeInsets.zero),
                            child: Container(
                              height: 110.hm(context),
                              width: 80.wm(context),
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(8.rm(context)),
                                  border: bigIndex.value == (index + 1) ?
                                  Border.all(color: ColorUtils.blue192,width: 1) :
                                  Border.all(color: Colors.transparent,width: 1)
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [

                                  Container(
                                    height: 60.hm(context),
                                    width: 60.wm(context),
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(8.rm(context)),
                                    ),
                                    child: FittedBox(
                                      fit: BoxFit.fill,
                                      child: Image.network(
                                        categoriesResponseModel.value.data![index].icon!,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),

                                  SpacerWidget.spacerWidget(spaceHeight: 8.hm(context)),


                                  Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "${categoriesResponseModel.value.data?[index].name ?? ""}".tr,
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.tajawal(
                                        fontWeight: FontWeight.w500,
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
                        );
                      }),
                    ),


                    SpacerWidget.spacerWidget(spaceHeight: 13.hm(context),),


                    Container(
                      alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                      child: Text(
                        "Locations".tr,
                        textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: 18.spm(context),
                          color: ColorUtils.black30,
                        ),
                      ),
                    ),


                    SpacerWidget.spacerWidget(spaceHeight: 18.hm(context),),


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


                    SpacerWidget.spacerWidget(spaceHeight: 13.hm(context),),


                    Container(
                      alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                      child: Text(
                        "working hours",
                        textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: 18.spm(context),
                          color: ColorUtils.black30,
                        ),
                      ),
                    ),


                    SpacerWidget.spacerWidget(spaceHeight: 18.hm(context),),


                    Wrap(
                      children: List.generate(3, (index) {
                        return SizedBox(
                          height: 70.hm(context),
                          width: index == 0 ? 55.wm(context) : 143.wm(context),
                          child: TextButton(
                            onPressed: () async {
                              bigIndex_2.value = index + 1 ;
                            },
                            style: TextButton.styleFrom(padding: EdgeInsets.zero),
                            child: Container(
                              height: 70.hm(context),
                              width: index == 0 ? 55.wm(context) : 143.wm(context),
                              decoration: BoxDecoration(
                                color: bigIndex_2.value == (index + 1) ? ColorUtils.blue192 : Colors.transparent,
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
                                      index == 0 ? "All".tr : index == 1 ? "Open Now".tr : "24 hours".tr,
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.tajawal(
                                        fontWeight: FontWeight.w700,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 16.spm(context),
                                        color: bigIndex_2.value == (index + 1) ? ColorUtils.white255 : ColorUtils.black51,
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


                    SpacerWidget.spacerWidget(spaceHeight: 40.hm(context),),


                    Row(
                      children: [


                        Container(
                          height: 48.hm(context),
                          width: 170.wm(context),
                          decoration: BoxDecoration(
                              color: ColorUtils.blue192,
                              borderRadius: BorderRadius.circular(8.rm(context),)
                          ),
                          child: TextButton(
                            style: TextButton.styleFrom(padding: EdgeInsets.zero),
                            onPressed: () async {
                              Get.off(()=>SearchResultScreen(categoryId: categoryId.value,location: governorate.value,),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                            },
                            child: Center(
                              child: Text(
                                "Search".tr,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.tajawal(
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 18.spm(context),
                                    color: ColorUtils.white255
                                ),
                              ),
                            ),
                          ),
                        ),

                        SpacerWidget.spacerWidget(spaceWidth: 16.wm(context)),


                        Container(
                          height: 48.hm(context),
                          width: 170.wm(context),
                          decoration: BoxDecoration(
                            border: Border.all(color: ColorUtils.gray136,width: 1),
                            color: ColorUtils.white255,
                            borderRadius: BorderRadius.circular(8.rm(context),),
                          ),
                          child: TextButton(
                            style: TextButton.styleFrom(padding: EdgeInsets.zero),
                            onPressed: () async {
                              Get.off(()=>SearchScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                            },
                            child: Center(
                              child: Text(
                                "Cancel".tr,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.tajawal(
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                  fontSize: MediaQuery.sizeOf(context).height > 1000 ? 18.spt(context) : 18.spm(context),
                                  color: ColorUtils.black51,
                                ),
                              ),
                            ),
                          ),
                        ),


                      ],
                    ),


                    SpacerWidget.spacerWidget(spaceHeight: 20.hm(context),),


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