import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rahatak_food_delivery_app/controller/controller.dart';
import 'package:rahatak_food_delivery_app/screen/screen.dart';
import 'package:rahatak_food_delivery_app/utils/utils.dart';
import 'package:rahatak_food_delivery_app/widget/widget.dart';
import '../model/model.dart';

class SearchScreenWidget extends GetxController {
  BuildContext context;
  SearchScreenWidget({required this.context});

  Rx<TextEditingController> searchController = TextEditingController().obs;
  Rx<ProductsResponseModel> productsResponseModel = ProductsResponseModel().obs;

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


  RxInt bigIndex = 0.obs;
  RxBool isLoading = false.obs;
  RxBool isSubmit = false.obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
      await ProductController.getProductResponse(
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
        productsResponseModel.value = value;
      });
    });
  }

  Widget searchScreenWidget({required BuildContext context}) {
    // if(MediaQuery.sizeOf(context).height > 1133) {
    //   return Obx(()=>SafeArea(
    //     child: Container(
    //       height: 1133.ht(context),
    //       width: 744.wt(context),
    //       decoration: BoxDecoration(
    //         color: ColorUtils.white248,
    //       ),
    //       child: isLoading.value == true ?
    //       Center(child: CircularProgressIndicator(),) :
    //       CustomScrollView(
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
    //                     "Search".tr,
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
    //                 SpacerWidget.spacerWidget(spaceHeight: 33.ht(context)),
    //
    //                 Padding(
    //                   padding: EdgeInsets.symmetric(horizontal: 78.hpmt(context)),
    //                   child: Column(
    //                     children: [
    //
    //                       TextFormField(
    //                         controller: searchController.value,
    //                         textAlign: TextAlign.start,
    //                         cursorColor: ColorUtils.blue192,
    //                         style: GoogleFonts.openSans(
    //                           fontSize: 16.spt(context),
    //                           fontStyle: FontStyle.normal,
    //                           color: ColorUtils.black51,
    //                           fontWeight: FontWeight.w400,
    //                         ),
    //                         cursorHeight: 20.ht(context),
    //                         textAlignVertical: TextAlignVertical.top,
    //                         decoration: InputDecoration(
    //                           alignLabelWithHint: true,
    //                           hintText: "Search for a restaurant, dish...".tr,
    //                           hintStyle: GoogleFonts.openSans(
    //                             fontSize: 16.spt(context),
    //                             fontWeight: FontWeight.w400,
    //                             fontStyle: FontStyle.normal,
    //                             color: ColorUtils.gray136,
    //                           ),
    //                           filled: true,
    //                           prefixIconConstraints: BoxConstraints(
    //                             maxHeight: 48.ht(context),
    //                             minWidth: 36.wt(context),
    //                           ),
    //                           prefixIcon: Padding(
    //                             padding: EdgeInsets.only(
    //                               left: 12.lpmt(context),
    //                               right: 10.rpmt(context),
    //                               top: 17.33.tpmt(context),
    //                               bottom: 17.33.bpmt(context),
    //                             ),
    //                             child: FittedBox(
    //                               fit: BoxFit.cover,
    //                               child: Image.asset(
    //                                 ImagePathUtils.searchIconImagePath,
    //                                 fit: BoxFit.cover,
    //                                 alignment: Alignment.center,
    //                               ),
    //                             ),
    //                           ),
    //                           suffixIcon: Container(
    //                             height: 24.ht(context),
    //                             width: 24.wt(context),
    //                             padding: EdgeInsets.symmetric(
    //                               horizontal: 13.hpmt(context),
    //                               vertical: 13.vpmt(context),
    //                             ),
    //                             decoration: BoxDecoration(
    //                                 color: Colors.transparent
    //                             ),
    //                             child: TextButton(
    //                               style: TextButton.styleFrom(padding: EdgeInsets.zero),
    //                               onPressed: () {
    //                                 Get.off(()=>FilterSearchScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
    //                               },
    //                               child: FittedBox(
    //                                 fit: BoxFit.cover,
    //                                 child: Image.asset(
    //                                   ImagePathUtils.filterIconImagePath,
    //                                   fit: BoxFit.cover,
    //                                   alignment: Alignment.center,
    //                                 ),
    //                               ),
    //                             ),
    //                           ),
    //                           fillColor: ColorUtils.white255,
    //                           contentPadding: EdgeInsets.symmetric(
    //                             horizontal: 12.hpmt(context),
    //                             vertical: 12.vpmt(context),
    //                           ),
    //                           constraints: BoxConstraints(
    //                             maxHeight: 48.ht(context),
    //                           ),
    //                           border:  OutlineInputBorder(
    //                             borderRadius: BorderRadius.circular(8.rt(context)),
    //                             borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
    //                           ),
    //                           enabledBorder: OutlineInputBorder(
    //                             borderRadius: BorderRadius.circular(8.rt(context)),
    //                             borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
    //                           ),
    //                           focusedBorder: OutlineInputBorder(
    //                             borderRadius: BorderRadius.circular(8.rt(context)),
    //                             borderSide: BorderSide(color: ColorUtils.blue192,width: 1),
    //                           ),
    //
    //                         ),
    //                       ),
    //
    //
    //                       SpacerWidget.spacerWidget(spaceHeight: 32.ht(context)),
    //
    //                     ],
    //                   ),
    //                 )
    //
    //               ],
    //             ),
    //           ),
    //
    //
    //           SliverList(
    //             delegate: SliverChildBuilderDelegate(
    //                   (context,int index) {
    //                 return Padding(
    //                   padding: EdgeInsets.symmetric(horizontal: 138.hpmt(context)),
    //                   child: Container(
    //                     padding: EdgeInsets.symmetric(
    //                       horizontal: 12.hpmt(context),
    //                       vertical: 12.vpmt(context),
    //                     ),
    //                     decoration: BoxDecoration(
    //                       color: ColorUtils.white255,
    //                       borderRadius: BorderRadius.circular(12.rt(context)),
    //                       border: Border.all(color: ColorUtils.white217,width: 1),
    //                     ),
    //                     margin: EdgeInsets.only(
    //                       bottom: 10.bpmt(context),
    //                     ),
    //                     child: TextButton(
    //                       style: TextButton.styleFrom(padding: EdgeInsets.zero),
    //                       onPressed: () async {
    //                         Get.off(()=>ProductDetailsScreen(productId: productsResponseModel.value.data?.data?[index].sId,),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
    //                       },
    //                       child: Row(
    //                         children: [
    //
    //                           Container(
    //                             height: 100.ht(context),
    //                             width: 100.wt(context),
    //                             decoration: BoxDecoration(
    //                               borderRadius: BorderRadius.circular(12.rm(context)),
    //                             ),
    //                             child: FittedBox(
    //                               fit: BoxFit.fill,
    //                               child: Image.network(
    //                                 productsResponseModel.value.data!.data![index].images!.first,
    //                                 fit: BoxFit.fill,
    //                                 alignment: Alignment.center,
    //                               ),
    //                             ),
    //                           ),
    //
    //
    //                           SpacerWidget.spacerWidget(spaceWidth: 12.wt(context)),
    //
    //
    //                           Expanded(
    //                             child: Column(
    //                               mainAxisAlignment: MainAxisAlignment.center,
    //                               crossAxisAlignment: CrossAxisAlignment.start,
    //                               children: [
    //
    //
    //                                 Container(
    //                                   alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
    //                                   child: Text(
    //                                     "${productsResponseModel.value.data?.data?[index].name ?? ""}".tr,
    //                                     textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
    //                                     style: GoogleFonts.tajawal(
    //                                       fontWeight: FontWeight.w700,
    //                                       fontStyle: FontStyle.normal,
    //                                       fontSize: 18.spt(context),
    //                                       color: ColorUtils.black30,
    //                                     ),
    //                                   ),
    //                                 ),
    //
    //
    //                                 SpacerWidget.spacerWidget(spaceHeight: 10.ht(context)),
    //
    //                                 Container(
    //                                   alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
    //                                   child: Text(
    //                                     "${productsResponseModel.value.data?.data?[index].description ?? ""}".tr,
    //                                     textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.start,
    //                                     style: GoogleFonts.tajawal(
    //                                       fontWeight: FontWeight.w500,
    //                                       fontStyle: FontStyle.normal,
    //                                       fontSize: 14.spt(context),
    //                                       color: ColorUtils.gray117,
    //                                     ),
    //                                   ),
    //                                 ),
    //
    //                                 SpacerWidget.spacerWidget(spaceHeight: 10.ht(context)),
    //
    //                                 Row(
    //                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                                   crossAxisAlignment: CrossAxisAlignment.center,
    //                                   children: [
    //
    //
    //                                     Row(
    //                                       children: [
    //
    //                                         Container(
    //                                           height: 18.ht(context),
    //                                           width: 17.wt(context),
    //                                           decoration: BoxDecoration(
    //                                             color: Colors.transparent,
    //                                           ),
    //                                           child: FittedBox(
    //                                             fit: BoxFit.cover,
    //                                             child: Image.asset(
    //                                               ImagePathUtils.timeIconImagePath,
    //                                               fit: BoxFit.cover,
    //                                             ),
    //                                           ),
    //                                         ),
    //
    //                                         SpacerWidget.spacerWidget(spaceWidth: 8.wt(context)),
    //
    //                                         Container(
    //                                           alignment: Alignment.centerLeft,
    //                                           child: Text(
    //                                             "${productsResponseModel.value.data?.data?[index].timeRequired ?? ""} Minutes".tr,
    //                                             textAlign: TextAlign.start,
    //                                             style: GoogleFonts.tajawal(
    //                                               fontWeight: FontWeight.w500,
    //                                               fontStyle: FontStyle.normal,
    //                                               fontSize: 14.spt(context),
    //                                               color: ColorUtils.black30,
    //                                             ),
    //                                           ),
    //                                         ),
    //
    //
    //                                       ],
    //                                     ),
    //
    //
    //                                     Container(
    //                                       alignment: Alignment.centerLeft,
    //                                       child: Text(
    //                                         "${productsResponseModel.value.data?.data?[index].variations?.first.price ?? ""} OMR(${productsResponseModel.value.data?.data?[index].variations?.first.size.toString().toUpperCase()})".tr,
    //                                         textAlign: TextAlign.start,
    //                                         style: GoogleFonts.tajawal(
    //                                           fontWeight: FontWeight.w500,
    //                                           fontStyle: FontStyle.normal,
    //                                           fontSize: 14.spt(context),
    //                                           color: ColorUtils.black30,
    //                                         ),
    //                                       ),
    //                                     ),
    //
    //
    //
    //
    //
    //                                   ],
    //                                 ),
    //
    //                                 SpacerWidget.spacerWidget(spaceHeight: 10.ht(context)),
    //
    //
    //                               ],
    //                             ),
    //                           ),
    //
    //                         ],
    //                       ),
    //                     ),
    //                   ),
    //                 );
    //               },
    //               childCount: productsResponseModel.value.data?.data?.length,
    //             ),
    //           ),
    //
    //
    //         ],
    //       ),
    //     ),
    //   ));
    // } else {
    //   return Obx(()=>SafeArea(
    //     child: Container(
    //       height: 844.hm(context),
    //       width: 390.wm(context),
    //       decoration: BoxDecoration(
    //         color: ColorUtils.white248,
    //       ),
    //       child:  isLoading.value == true ?
    //       Center(child: CircularProgressIndicator(),) :
    //       CustomScrollView(
    //         slivers: [
    //
    //
    //           SliverToBoxAdapter(
    //             child: Column(
    //               children: [
    //
    //
    //                 SpacerWidget.spacerWidget(spaceHeight: 20.hm(context)),
    //
    //
    //                 Container(
    //                   alignment: Alignment.center,
    //                   child: Text(
    //                     "Search".tr,
    //                     textAlign: TextAlign.center,
    //                     style: GoogleFonts.tajawal(
    //                       fontWeight: FontWeight.w700,
    //                       fontStyle: FontStyle.normal,
    //                       fontSize: 16.spm(context),
    //                       color: ColorUtils.black255,
    //                     ),
    //                   ),
    //                 ),
    //
    //                 SpacerWidget.spacerWidget(spaceHeight: 33.hm(context)),
    //
    //                 Padding(
    //                   padding: EdgeInsets.symmetric(horizontal: 16.hpmm(context)),
    //                   child: Column(
    //                     children: [
    //
    //                       TextFormField(
    //                         controller: searchController.value,
    //                         textAlign: TextAlign.start,
    //                         cursorColor: ColorUtils.blue192,
    //                         style: GoogleFonts.openSans(
    //                           fontSize: 16.spm(context),
    //                           fontStyle: FontStyle.normal,
    //                           color: ColorUtils.black51,
    //                           fontWeight: FontWeight.w400,
    //                         ),
    //                         cursorHeight: 20.hm(context),
    //                         textAlignVertical: TextAlignVertical.top,
    //                         decoration: InputDecoration(
    //                           alignLabelWithHint: true,
    //                           hintText: "Search for a restaurant, dish...".tr,
    //                           hintStyle: GoogleFonts.openSans(
    //                             fontSize: 16.spm(context),
    //                             fontWeight: FontWeight.w400,
    //                             fontStyle: FontStyle.normal,
    //                             color: ColorUtils.gray136,
    //                           ),
    //                           filled: true,
    //                           prefixIconConstraints: BoxConstraints(
    //                             maxHeight: 48.hm(context),
    //                             minWidth: 36.wm(context),
    //                           ),
    //                           prefixIcon: Padding(
    //                             padding: EdgeInsets.only(
    //                               left: 12.lpmm(context),
    //                               right: 10.rpmm(context),
    //                               top: 17.33.tpmm(context),
    //                               bottom: 17.33.bpmm(context),
    //                             ),
    //                             child: FittedBox(
    //                               fit: BoxFit.cover,
    //                               child: Image.asset(
    //                                 ImagePathUtils.searchIconImagePath,
    //                                 fit: BoxFit.cover,
    //                                 alignment: Alignment.center,
    //                               ),
    //                             ),
    //                           ),
    //                           suffixIcon: Container(
    //                             height: 24.hm(context),
    //                             width: 24.wm(context),
    //                             padding: EdgeInsets.symmetric(
    //                               horizontal: 13.hpmm(context),
    //                               vertical: 13.vpmm(context),
    //                             ),
    //                             decoration: BoxDecoration(
    //                               color: Colors.transparent,
    //                             ),
    //                             child: TextButton(
    //                               style: TextButton.styleFrom(padding: EdgeInsets.zero),
    //                               onPressed: () {
    //                                 Get.off(()=>FilterSearchScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
    //                               },
    //                               child: FittedBox(
    //                                 fit: BoxFit.cover,
    //                                 child: Image.asset(
    //                                   ImagePathUtils.filterIconImagePath,
    //                                   fit: BoxFit.cover,
    //                                   alignment: Alignment.center,
    //                                 ),
    //                               ),
    //                             ),
    //                           ),
    //                           fillColor: ColorUtils.white255,
    //                           contentPadding: EdgeInsets.symmetric(
    //                             horizontal: 12.hpmm(context),
    //                             vertical: 12.vpmm(context),
    //                           ),
    //                           constraints: BoxConstraints(
    //                             maxWidth: 358.wm(context),
    //                             maxHeight: 48.hm(context),
    //                           ),
    //                           border:  OutlineInputBorder(
    //                             borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).height > 1000 ? 8.rt(context) : 8.rm(context)),
    //                             borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
    //                           ),
    //                           enabledBorder: OutlineInputBorder(
    //                             borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).height > 1000 ? 8.rt(context) : 8.rm(context)),
    //                             borderSide: BorderSide(color: ColorUtils.gray163,width: 1),
    //                           ),
    //                           focusedBorder: OutlineInputBorder(
    //                             borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).height > 1000 ? 8.rt(context) : 8.rm(context)),
    //                             borderSide: BorderSide(color: ColorUtils.blue192,width: 1),
    //                           ),
    //                         ),
    //                       ),
    //
    //
    //                       SpacerWidget.spacerWidget(spaceHeight: 32.hm(context)),
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
    //           SliverList(
    //             delegate: SliverChildBuilderDelegate(
    //                   (context,int index) {
    //                 return Padding(
    //                   padding: EdgeInsets.symmetric(horizontal: 16.hpmm(context)),
    //                   child: Container(
    //                     padding: EdgeInsets.symmetric(
    //                       horizontal: 12.hpmm(context),
    //                       vertical: 12.vpmm(context),
    //                     ),
    //                     decoration: BoxDecoration(
    //                       color: ColorUtils.white255,
    //                       borderRadius: BorderRadius.circular(12.rm(context)),
    //                       border: Border.all(color: ColorUtils.white217,width: 1),
    //                     ),
    //                     margin: EdgeInsets.only(
    //                       bottom: 10.bpmm(context),
    //                     ),
    //                     child: TextButton(
    //                       style: TextButton.styleFrom(padding: EdgeInsets.zero),
    //                       onPressed: () async {
    //                         Get.off(()=>ProductDetailsScreen(productId: productsResponseModel.value.data?.data?[index].sId,),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
    //                       },
    //                       child: Row(
    //                         children: [
    //
    //                           Container(
    //                             height: 100.hm(context),
    //                             width: 100.wm(context),
    //                             decoration: BoxDecoration(
    //                               borderRadius: BorderRadius.circular(12.rm(context)),
    //                             ),
    //                             child: FittedBox(
    //                               fit: BoxFit.fill,
    //                               child: Image.network(
    //                                 productsResponseModel.value.data!.data![index].images!.first,
    //                                 fit: BoxFit.fill,
    //                                 alignment: Alignment.center,
    //                               ),
    //                             ),
    //                           ),
    //
    //
    //                           SpacerWidget.spacerWidget(spaceWidth: 12.wm(context)),
    //
    //
    //                           Expanded(
    //                             child: Column(
    //                               mainAxisAlignment: MainAxisAlignment.center,
    //                               crossAxisAlignment: CrossAxisAlignment.start,
    //                               children: [
    //
    //
    //                                 Container(
    //                                   alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
    //                                   child: Text(
    //                                     "${productsResponseModel.value.data?.data?[index].name ?? ""}".tr,
    //                                     textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
    //                                     style: GoogleFonts.tajawal(
    //                                       fontWeight: FontWeight.w700,
    //                                       fontStyle: FontStyle.normal,
    //                                       fontSize: 18.spm(context),
    //                                       color: ColorUtils.black30,
    //                                     ),
    //                                   ),
    //                                 ),
    //
    //
    //                                 SpacerWidget.spacerWidget(spaceHeight: 10.hm(context)),
    //
    //                                 Container(
    //                                   alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
    //                                   child: Text(
    //                                     "${productsResponseModel.value.data?.data?[index].description ?? ""}".tr,
    //                                     textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.start,
    //                                     style: GoogleFonts.tajawal(
    //                                       fontWeight: FontWeight.w500,
    //                                       fontStyle: FontStyle.normal,
    //                                       fontSize: 14.spm(context),
    //                                       color: ColorUtils.gray117,
    //                                     ),
    //                                   ),
    //                                 ),
    //
    //                                 SpacerWidget.spacerWidget(spaceHeight: 10.hm(context)),
    //
    //                                 Row(
    //                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                                   crossAxisAlignment: CrossAxisAlignment.center,
    //                                   children: [
    //
    //
    //                                     Row(
    //                                       children: [
    //
    //                                         Container(
    //                                           height: 18.hm(context),
    //                                           width: 17.wm(context),
    //                                           decoration: BoxDecoration(
    //                                             color: Colors.transparent,
    //                                           ),
    //                                           child: FittedBox(
    //                                             fit: BoxFit.cover,
    //                                             child: Image.asset(
    //                                               ImagePathUtils.timeIconImagePath,
    //                                               fit: BoxFit.cover,
    //                                             ),
    //                                           ),
    //                                         ),
    //
    //                                         SpacerWidget.spacerWidget(spaceWidth: 8.wm(context)),
    //
    //                                         Container(
    //                                           alignment: Alignment.centerLeft,
    //                                           child: Text(
    //                                             "${productsResponseModel.value.data?.data?[index].timeRequired ?? ""} Minutes".tr,
    //                                             textAlign: TextAlign.start,
    //                                             style: GoogleFonts.tajawal(
    //                                               fontWeight: FontWeight.w500,
    //                                               fontStyle: FontStyle.normal,
    //                                               fontSize: 14.spm(context),
    //                                               color: ColorUtils.black30,
    //                                             ),
    //                                           ),
    //                                         ),
    //
    //
    //                                       ],
    //                                     ),
    //
    //
    //                                     Container(
    //                                       alignment: Alignment.centerLeft,
    //                                       child: Text(
    //                                         "${productsResponseModel.value.data?.data?[index].variations?.first.price ?? ""} OMR(${productsResponseModel.value.data?.data?[index].variations?.first.size.toString().toUpperCase()})".tr,
    //                                         textAlign: TextAlign.start,
    //                                         style: GoogleFonts.tajawal(
    //                                           fontWeight: FontWeight.w500,
    //                                           fontStyle: FontStyle.normal,
    //                                           fontSize: 14.spm(context),
    //                                           color: ColorUtils.black30,
    //                                         ),
    //                                       ),
    //                                     ),
    //
    //
    //
    //
    //
    //                                   ],
    //                                 ),
    //
    //                                 SpacerWidget.spacerWidget(spaceHeight: 10.hm(context)),
    //
    //
    //                               ],
    //                             ),
    //                           ),
    //
    //                         ],
    //                       ),
    //                     ),
    //                   ),
    //                 );
    //               },
    //               childCount: productsResponseModel.value.data?.data?.length,
    //             ),
    //           ),
    //
    //
    //         ],
    //       ),
    //     ),
    //   ));
    // }
    return Obx(()=>SafeArea(
      child: Container(
        height: 844.hm(context),
        width: 390.wm(context),
        decoration: BoxDecoration(
          color: ColorUtils.white248,
        ),
        child:  isLoading.value == true ?
        Center(child: CircularProgressIndicator(),) :
        CustomScrollView(
          slivers: [


            SliverToBoxAdapter(
              child: Column(
                children: [


                  SpacerWidget.spacerWidget(spaceHeight: 20.hm(context)),


                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Search".tr,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.tajawal(
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        fontSize: 16.spm(context),
                        color: ColorUtils.black255,
                      ),
                    ),
                  ),

                  SpacerWidget.spacerWidget(spaceHeight: 33.hm(context)),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.hpmm(context)),
                    child: Column(
                      children: [

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
                            await ProductController.getSearchProductResponse(
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
                              productsResponseModel.value = value;
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
                                color: Colors.transparent,
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


                        SpacerWidget.spacerWidget(spaceHeight: 32.hm(context)),
                      ],
                    ),
                  )


                ],
              ),
            ),

            isSubmit.value == false ?
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context,int index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.hpmm(context)),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.hpmm(context),
                        vertical: 12.vpmm(context),
                      ),
                      decoration: BoxDecoration(
                        color: ColorUtils.white255,
                        borderRadius: BorderRadius.circular(12.rm(context)),
                        border: Border.all(color: ColorUtils.white217,width: 1),
                      ),
                      margin: EdgeInsets.only(
                        bottom: 10.bpmm(context),
                      ),
                      child: TextButton(
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        onPressed: () async {
                          Get.off(()=>ProductDetailsScreen(productId: productsResponseModel.value.data?.data?[index].sId,),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                        },
                        child: Row(
                          children: [

                            Container(
                              height: 100.hm(context),
                              width: 100.wm(context),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.rm(context)),
                              ),
                              child: FittedBox(
                                fit: BoxFit.fill,
                                child: productsResponseModel.value.data?.data?[index].images?.isEmpty == true || productsResponseModel.value.data?.data?[index].images == null?
                                Image.asset(
                                  ImagePathUtils.noImageImagePath,
                                  fit: BoxFit.fill,
                                ) : Image.network(
                                  productsResponseModel.value.data!.data![index].images!.first,
                                  fit: BoxFit.fill,
                                ),
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
                                      "${productsResponseModel.value.data?.data?[index].name ?? ""}".tr,
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

                                  Container(
                                    alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                    child: Text(
                                      "${productsResponseModel.value.data?.data?[index].description ?? ""}".tr,
                                      textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.start,
                                      style: GoogleFonts.tajawal(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14.spm(context),
                                        color: ColorUtils.gray117,
                                      ),
                                    ),
                                  ),

                                  SpacerWidget.spacerWidget(spaceHeight: 10.hm(context)),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [


                                      Row(
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
                                                ImagePathUtils.timeIconImagePath,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),

                                          SpacerWidget.spacerWidget(spaceWidth: 8.wm(context)),

                                          Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              "${productsResponseModel.value.data?.data?[index].timeRequired ?? ""} ${"Minutes".tr}".tr,
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


                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "${productsResponseModel.value.data?.data?[index].variations?.first.price ?? ""} ${"OMR".tr}(${productsResponseModel.value.data?.data?[index].variations?.first.size.toString().toUpperCase().tr})",
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


                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  );
                },
                childCount: productsResponseModel.value.data?.data?.length,
              ),
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
      ),
    ));
  }


}
