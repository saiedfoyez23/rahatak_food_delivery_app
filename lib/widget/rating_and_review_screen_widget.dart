import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rahatak_food_delivery_app/controller/controller.dart';
import 'package:rahatak_food_delivery_app/utils/utils.dart';

import '../controller/order_controller.dart';
import '../model/model.dart';
import '../screen/screen.dart';

class RatingAndReviewScreenWidget extends GetxController {

  BuildContext context;
  String orderId;
  RxBool isLoading = false.obs;
  RxBool isRider = false.obs;
  RatingAndReviewScreenWidget({required this.context,required this.orderId});
  Rx<PickUpRequestResponseModel> pickUpRequestResponseModel = PickUpRequestResponseModel().obs;
  RxString selectId = "".obs;
  RxInt rating = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(const Duration(seconds: 1),() async {
      await OrderController.getOrderPickUpReviewRequest(
        orderId: orderId,
        onSuccess: (e,status) async {
          if(status != "delivered") {
            CustomSnackBar().errorCustomSnackBar(context: context, message: "The Order status is ${status}.It is not delivered");
            Get.off(()=>OrderHistoryScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
          }
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
      });
    });
  }



  Widget ratingAndReviewScreenWidget({required BuildContext context}) {
    // if(MediaQuery.sizeOf(context).height > 1000) {
    //   return SafeArea(
    //     child: Container(
    //       height: 1133.ht(context),
    //       width: 744.wt(context),
    //       decoration: BoxDecoration(
    //         color: ColorUtils.white248,
    //       ),
    //       child: CustomScrollView(
    //         slivers: [
    //
    //
    //           SliverToBoxAdapter(
    //             child: Column(
    //               children: [
    //
    //                 SpacerWidget.spacerWidget(spaceHeight: 11.ht(context)),
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
    //                               Get.off(()=>ProfileScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
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
    //                               "Rating".tr,
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
    //
    //                 SpacerWidget.spacerWidget(spaceHeight: 26.ht(context)),
    //
    //
    //                 Container(
    //                   width: 468.wt(context),
    //                   padding: EdgeInsets.symmetric(horizontal: 20.hpmt(context),vertical: 20.vpmt(context)),
    //                   decoration: BoxDecoration(
    //                     borderRadius: BorderRadius.circular(10.rt(context)),
    //                     border: Border.all(
    //                       color: ColorUtils.white217,
    //                       width: 0.5,
    //                     ),
    //                   ),
    //                   child: Column(
    //                     mainAxisAlignment: MainAxisAlignment.start,
    //                     crossAxisAlignment: CrossAxisAlignment.center,
    //                     children: [
    //
    //
    //
    //                       Container(
    //                         padding: EdgeInsets.only(
    //                           left: 10.lpmt(context),
    //                           right: 10.rpmt(context),
    //                           bottom: 20.bpmt(context),
    //                         ),
    //                         decoration: BoxDecoration(
    //                           image: DecorationImage(
    //                               image: AssetImage(ImagePathUtils.dotIconImagePath),
    //                               fit: BoxFit.fill
    //                           ),
    //                         ),
    //                         child: Row(
    //                           children: [
    //
    //
    //                             Container(
    //                               height: 80.ht(context),
    //                               width: 80.wt(context),
    //                               decoration: BoxDecoration(
    //                                 color: ColorUtils.gray136,
    //                                 borderRadius: BorderRadius.circular(10.rt(context)),
    //                               ),
    //                             ),
    //
    //
    //                             SpacerWidget.spacerWidget(spaceWidth: 14.wt(context)),
    //
    //
    //                             Expanded(
    //                               child: Column(
    //                                 mainAxisAlignment: MainAxisAlignment.center,
    //                                 crossAxisAlignment: CrossAxisAlignment.start,
    //                                 children: [
    //
    //
    //                                   Container(
    //                                     alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
    //                                     child: Text(
    //                                       "Blue Fish".tr,
    //                                       textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
    //                                       style: GoogleFonts.tajawal(
    //                                         fontWeight: FontWeight.w700,
    //                                         fontStyle: FontStyle.normal,
    //                                         fontSize: 18.spt(context),
    //                                         color: ColorUtils.black30,
    //                                       ),
    //                                     ),
    //                                   ),
    //
    //
    //                                   SpacerWidget.spacerWidget(spaceHeight: 8.ht(context)),
    //
    //
    //
    //                                   Container(
    //                                     alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
    //                                     child: Text(
    //                                       "Seafood".tr,
    //                                       textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
    //                                       style: GoogleFonts.tajawal(
    //                                         fontWeight: FontWeight.w700,
    //                                         fontStyle: FontStyle.normal,
    //                                         fontSize: 14.spt(context),
    //                                         color: ColorUtils.gray117,
    //                                       ),
    //                                     ),
    //                                   ),
    //
    //
    //                                   SpacerWidget.spacerWidget(spaceHeight: 8.ht(context)),
    //
    //                                   Row(
    //                                     mainAxisAlignment: MainAxisAlignment.start,
    //                                     crossAxisAlignment: CrossAxisAlignment.center,
    //                                     children: [
    //
    //
    //                                       Container(
    //                                         height: 18.ht(context),
    //                                         width: 17.wt(context),
    //                                         decoration: BoxDecoration(
    //                                           color: Colors.transparent,
    //                                         ),
    //                                         child: FittedBox(
    //                                           fit: BoxFit.cover,
    //                                           child: Image.asset(
    //                                             ImagePathUtils.starIconImagePath,
    //                                             fit: BoxFit.cover,
    //                                           ),
    //                                         ),
    //                                       ),
    //
    //                                       SpacerWidget.spacerWidget(spaceWidth: 8.wt(context)),
    //
    //                                       Container(
    //                                         alignment: Alignment.centerLeft,
    //                                         child: Text(
    //                                           "3.9".tr,
    //                                           textAlign: TextAlign.start,
    //                                           style: GoogleFonts.tajawal(
    //                                             fontWeight: FontWeight.w500,
    //                                             fontStyle: FontStyle.normal,
    //                                             fontSize: 14.spt(context),
    //                                             color: ColorUtils.black30,
    //                                           ),
    //                                         ),
    //                                       ),
    //
    //
    //                                     ],
    //                                   ),
    //
    //
    //                                 ],
    //                               ),
    //                             ),
    //
    //
    //                           ],
    //                         ),
    //                       ),
    //
    //
    //                       SpacerWidget.spacerWidget(spaceHeight: 13.ht(context)),
    //
    //
    //                       Container(
    //                         alignment: Alignment.center,
    //                         child: Text(
    //                           "How was your experience?".tr,
    //                           textAlign: TextAlign.center,
    //                           style: GoogleFonts.tajawal(
    //                             fontWeight: FontWeight.w500,
    //                             fontStyle: FontStyle.normal,
    //                             fontSize: 16.spt(context),
    //                             color: ColorUtils.black255,
    //                           ),
    //                         ),
    //                       ),
    //
    //
    //                       SpacerWidget.spacerWidget(spaceHeight: 16.ht(context)),
    //
    //
    //                       Row(
    //                         mainAxisAlignment: MainAxisAlignment.center,
    //                         children: List.generate(5, (index) {
    //                           return Icon(Icons.star,size: 24.st(context),color: index > 2 ? ColorUtils.white217 : ColorUtils.yellow175,);
    //                         }),
    //                       ),
    //
    //
    //
    //                       SpacerWidget.spacerWidget(spaceHeight: 16.ht(context)),
    //
    //
    //
    //                       Container(
    //                         height: 48.ht(context),
    //                         width: 320.wt(context),
    //                         decoration: BoxDecoration(
    //                           color: ColorUtils.blue192,
    //                           borderRadius: BorderRadius.circular(8.rt(context)),
    //                         ),
    //                         child: TextButton(
    //                           style: TextButton.styleFrom(padding: EdgeInsets.zero),
    //                           onPressed: () async {},
    //                           child: Center(
    //                             child: Text(
    //                               "Submit Your Rating".tr,
    //                               textAlign: TextAlign.center,
    //                               style: GoogleFonts.tajawal(
    //                                 fontWeight: FontWeight.w700,
    //                                 fontStyle: FontStyle.normal,
    //                                 fontSize: 18.spt(context),
    //                                 color: ColorUtils.white255,
    //                               ),
    //                             ),
    //                           ),
    //                         ),
    //                       ),
    //
    //
    //                     ],
    //                   ),
    //                 ),
    //
    //
    //                 SpacerWidget.spacerWidget(spaceHeight: 25.ht(context)),
    //
    //
    //                 Container(
    //                   width: 468.wt(context),
    //                   padding: EdgeInsets.symmetric(horizontal: 20.hpmt(context),vertical: 20.vpmt(context)),
    //                   decoration: BoxDecoration(
    //                     borderRadius: BorderRadius.circular(10.rt(context)),
    //                     border: Border.all(
    //                       color: ColorUtils.white217,
    //                       width: 0.5,
    //                     ),
    //                   ),
    //                   child: Column(
    //                     mainAxisAlignment: MainAxisAlignment.start,
    //                     crossAxisAlignment: CrossAxisAlignment.center,
    //                     children: [
    //
    //
    //
    //                       Container(
    //                         padding: EdgeInsets.only(
    //                           left: 10.lpmt(context),
    //                           right: 10.rpmt(context),
    //                           bottom: 20.bpmt(context),
    //                         ),
    //                         decoration: BoxDecoration(
    //                           image: DecorationImage(
    //                               image: AssetImage(ImagePathUtils.dotIconImagePath),
    //                               fit: BoxFit.fill
    //                           ),
    //                         ),
    //                         child: Row(
    //                           children: [
    //
    //
    //                             Container(
    //                               height: 80.ht(context),
    //                               width: 80.wt(context),
    //                               decoration: BoxDecoration(
    //                                 color: ColorUtils.gray136,
    //                                 borderRadius: BorderRadius.circular(10.rt(context)),
    //                               ),
    //                             ),
    //
    //
    //                             SpacerWidget.spacerWidget(spaceWidth: 14.wt(context)),
    //
    //
    //                             Expanded(
    //                               child: Column(
    //                                 mainAxisAlignment: MainAxisAlignment.center,
    //                                 crossAxisAlignment: CrossAxisAlignment.start,
    //                                 children: [
    //
    //
    //                                   Container(
    //                                     alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
    //                                     child: Text(
    //                                       "Abdullah".tr,
    //                                       textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
    //                                       style: GoogleFonts.tajawal(
    //                                         fontWeight: FontWeight.w700,
    //                                         fontStyle: FontStyle.normal,
    //                                         fontSize: 18.spt(context),
    //                                         color: ColorUtils.black30,
    //                                       ),
    //                                     ),
    //                                   ),
    //
    //
    //                                   SpacerWidget.spacerWidget(spaceHeight: 8.ht(context)),
    //
    //                                   Row(
    //                                     mainAxisAlignment: MainAxisAlignment.start,
    //                                     crossAxisAlignment: CrossAxisAlignment.center,
    //                                     children: [
    //
    //
    //                                       Container(
    //                                         height: 18.ht(context),
    //                                         width: 17.wt(context),
    //                                         decoration: BoxDecoration(
    //                                           color: Colors.transparent,
    //                                         ),
    //                                         child: FittedBox(
    //                                           fit: BoxFit.cover,
    //                                           child: Image.asset(
    //                                             ImagePathUtils.starIconImagePath,
    //                                             fit: BoxFit.cover,
    //                                           ),
    //                                         ),
    //                                       ),
    //
    //                                       SpacerWidget.spacerWidget(spaceWidth: 8.wt(context)),
    //
    //                                       Container(
    //                                         alignment: Alignment.centerLeft,
    //                                         child: Text(
    //                                           "3.9".tr,
    //                                           textAlign: TextAlign.start,
    //                                           style: GoogleFonts.tajawal(
    //                                             fontWeight: FontWeight.w500,
    //                                             fontStyle: FontStyle.normal,
    //                                             fontSize: 14.spt(context),
    //                                             color: ColorUtils.black30,
    //                                           ),
    //                                         ),
    //                                       ),
    //
    //
    //                                     ],
    //                                   ),
    //
    //
    //                                 ],
    //                               ),
    //                             ),
    //
    //
    //                           ],
    //                         ),
    //                       ),
    //
    //
    //                       SpacerWidget.spacerWidget(spaceHeight: 13.ht(context)),
    //
    //
    //                       Container(
    //                         alignment: Alignment.center,
    //                         child: Text(
    //                           "How was your experience?".tr,
    //                           textAlign: TextAlign.center,
    //                           style: GoogleFonts.tajawal(
    //                             fontWeight: FontWeight.w500,
    //                             fontStyle: FontStyle.normal,
    //                             fontSize: 16.spt(context),
    //                             color: ColorUtils.black255,
    //                           ),
    //                         ),
    //                       ),
    //
    //
    //                       SpacerWidget.spacerWidget(spaceHeight: 16.ht(context)),
    //
    //
    //                       Row(
    //                         mainAxisAlignment: MainAxisAlignment.center,
    //                         children: List.generate(5, (index) {
    //                           return Icon(Icons.star,size: 24.st(context),color: index > 2 ? ColorUtils.white217 : ColorUtils.yellow175,);
    //                         }),
    //                       ),
    //
    //
    //
    //                       SpacerWidget.spacerWidget(spaceHeight: 16.hm(context)),
    //
    //
    //
    //                       Container(
    //                         height: 48.ht(context),
    //                         width: 320.wt(context),
    //                         decoration: BoxDecoration(
    //                           color: ColorUtils.blue192,
    //                           borderRadius: BorderRadius.circular(8.rt(context) ),
    //                         ),
    //                         child: TextButton(
    //                           style: TextButton.styleFrom(padding: EdgeInsets.zero),
    //                           onPressed: () async {},
    //                           child: Center(
    //                             child: Text(
    //                               "Submit Your Rating".tr,
    //                               textAlign: TextAlign.center,
    //                               style: GoogleFonts.tajawal(
    //                                 fontWeight: FontWeight.w700,
    //                                 fontStyle: FontStyle.normal,
    //                                 fontSize: 18.spt(context),
    //                                 color: ColorUtils.white255,
    //                               ),
    //                             ),
    //                           ),
    //                         ),
    //                       ),
    //
    //
    //                     ],
    //                   ),
    //                 ),
    //
    //               ],
    //             ),
    //           )
    //
    //
    //         ],
    //       ),
    //     ),
    //   );
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

                    SpacerWidget.spacerWidget(spaceHeight: 11.hm(context)),

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
                                Get.off(()=>ProfileScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
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
                                "Rating".tr,
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


                    SpacerWidget.spacerWidget(spaceHeight: 26.hm(context)),


                    Column(
                      children: List.generate(pickUpRequestResponseModel.value.data!.order!.items!.length, (Index) {
                        return Obx(()=> Column(
                          children: [
                            Container(
                              width: 390.wm(context),
                              padding: EdgeInsets.symmetric(horizontal: 20.hpmm(context),vertical: 20.vpmm(context)),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.rm(context)),
                                border: Border.all(
                                  color: ColorUtils.white217,
                                  width: 0.5,
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [



                                  Container(
                                    padding: EdgeInsets.only(
                                      left: 10.lpmm(context),
                                      right: 10.rpmm(context),
                                      bottom: 20.bpmm(context),
                                    ),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(ImagePathUtils.dotIconImagePath),
                                          fit: BoxFit.fill
                                      ),
                                    ),
                                    child: Row(
                                      children: [



                                        Container(
                                          height: 80.hm(context),
                                          width: 80.wm(context),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(12.rm(context)),
                                          ),
                                          child: FittedBox(
                                            fit: BoxFit.fill,
                                            child: pickUpRequestResponseModel.value.data?.order?.items?[Index].product?.images?.isEmpty == true ||pickUpRequestResponseModel.value.data?.order?.items?[Index] == null?
                                            Image.asset(
                                              ImagePathUtils.noImageImagePath,
                                              fit: BoxFit.fill,
                                            ) : Image.network(
                                              pickUpRequestResponseModel.value.data!.order!.items![Index].product!.images!.first,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),



                                        SpacerWidget.spacerWidget(spaceWidth: 14.wm(context)),


                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [


                                              Container(
                                                alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                                child: Text(
                                                  "${pickUpRequestResponseModel.value.data?.order?.items?[Index].product?.name ?? ""}".tr,
                                                  textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                                  style: GoogleFonts.tajawal(
                                                    fontWeight: FontWeight.w700,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 18.spm(context),
                                                    color: ColorUtils.black30,
                                                  ),
                                                ),
                                              ),


                                              SpacerWidget.spacerWidget(spaceHeight: 8.hm(context)),



                                              Container(
                                                alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                                child: Text(
                                                  "${pickUpRequestResponseModel.value.data?.order?.store?.name ?? ""}".tr,
                                                  textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                                  style: GoogleFonts.tajawal(
                                                    fontWeight: FontWeight.w700,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 14.spm(context),
                                                    color: ColorUtils.gray117,
                                                  ),
                                                ),
                                              ),


                                              SpacerWidget.spacerWidget(spaceHeight: 8.hm(context)),

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
                                                      "${pickUpRequestResponseModel.value.data?.order?.items?[Index].product?.ratings ?? ""}".tr,
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


                                            ],
                                          ),
                                        ),


                                      ],
                                    ),
                                  ),


                                  SpacerWidget.spacerWidget(spaceHeight: 13.hm(context)),


                                  Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "How was your experience?".tr,
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.tajawal(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 16.spm(context),
                                        color: ColorUtils.black255,
                                      ),
                                    ),
                                  ),


                                  SpacerWidget.spacerWidget(spaceHeight: 16.hm(context)),


                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: List.generate(5, (index) {
                                      return Container(
                                        height: 35.hm(context),
                                        width: 35.wm(context),
                                        decoration: BoxDecoration(
                                            color: Colors.transparent
                                        ),
                                        child: IconButton(
                                          onPressed: () async {
                                            selectId.value = pickUpRequestResponseModel.value.data?.order?.items?[Index].sId;
                                            rating.value = index;
                                            print(rating.value);
                                          },
                                          icon: Icon(
                                            Icons.star,
                                            size: 24.sm(context),
                                            color: index <= rating.value  && selectId.value == pickUpRequestResponseModel.value.data?.order?.items?[Index].sId ?
                                            ColorUtils.yellow175 :
                                            ColorUtils.white217,
                                          ),
                                        ),
                                      );
                                    }),
                                  ),



                                  SpacerWidget.spacerWidget(spaceHeight: 16.hm(context)),



                                  selectId.value == pickUpRequestResponseModel.value.data?.order?.items?[Index].product?.sId ?
                                  Container(
                                    height: 48.hm(context),
                                    width: 300.wm(context),
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                    ),
                                    child: Center(child: CircularProgressIndicator(),),
                                  ) :
                                  Container(
                                    height: 48.hm(context),
                                    width: 300.wm(context),
                                    decoration: BoxDecoration(
                                      color: ColorUtils.blue192,
                                      borderRadius: BorderRadius.circular(8.rm(context)),
                                    ),
                                    child: TextButton(
                                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                      onPressed: () async {
                                        selectId.value = pickUpRequestResponseModel.value.data?.order?.items?[Index].product?.sId;
                                        Map<String,dynamic> data = {
                                          "product": pickUpRequestResponseModel.value.data?.order?.items?[Index].product?.sId,
                                          "stars": (rating.value + 1)
                                        };
                                        print(data);
                                        RatingController.getReviewResponse(
                                          data: data,
                                          onSuccess: (e) async {
                                            selectId.value = "";
                                            rating.value = 0;
                                            CustomSnackBar().successCustomSnackBar(context: context, message: e);
                                          },
                                          onFail: (e) async {
                                            selectId.value = "";
                                            rating.value = 0;
                                            CustomSnackBar().errorCustomSnackBar(context: context, message: e);
                                          },
                                          onExceptionFail: (e) async {
                                            selectId.value = "";
                                            rating.value = 0;
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
                                      },
                                      child: Center(
                                        child: Text(
                                          "Submit Your Rating".tr,
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


                                ],
                              ),
                            ),
                            SpacerWidget.spacerWidget(spaceHeight: 25.hm(context)),
                          ],
                        ));
                      }),
                    ),


                    pickUpRequestResponseModel.value.data?.rider == null ?
                    SpacerWidget.spacerWidget() :
                    Container(
                      width: 390.wm(context),
                      padding: EdgeInsets.symmetric(horizontal: 20.hpmm(context),vertical: 20.vpmm(context)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.rm(context)),
                        border: Border.all(
                          color: ColorUtils.white217,
                          width: 0.5,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [



                          Container(
                            padding: EdgeInsets.only(
                              left: 10.lpmm(context),
                              right: 10.rpmm(context),
                              bottom: 20.bpmm(context),
                            ),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(ImagePathUtils.dotIconImagePath),
                                  fit: BoxFit.fill
                              ),
                            ),
                            child: Row(
                              children: [



                                Container(
                                  height: 80.hm(context),
                                  width: 80.wm(context),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.rm(context)),
                                  ),
                                  child: FittedBox(
                                    fit: BoxFit.fill,
                                    child: pickUpRequestResponseModel.value.data?.rider?.image == null ?
                                    Image.asset(
                                      ImagePathUtils.noImageImagePath,
                                      fit: BoxFit.fill,
                                    ) : Image.network(
                                      pickUpRequestResponseModel.value.data!.rider!.image,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),



                                SpacerWidget.spacerWidget(spaceWidth: 14.wm(context)),


                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [


                                      Container(
                                        alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                        child: Text(
                                          "${pickUpRequestResponseModel.value.data?.rider?.name ?? ""}".tr,
                                          textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                          style: GoogleFonts.tajawal(
                                            fontWeight: FontWeight.w700,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 18.spm(context),
                                            color: ColorUtils.black30,
                                          ),
                                        ),
                                      ),


                                      SpacerWidget.spacerWidget(spaceHeight: 8.hm(context)),

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
                                              "${pickUpRequestResponseModel.value.data?.rider?.ratings ?? ""}".tr,
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


                                    ],
                                  ),
                                ),


                              ],
                            ),
                          ),


                          SpacerWidget.spacerWidget(spaceHeight: 13.hm(context)),


                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              "How was your experience?".tr,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.tajawal(
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                fontSize: 16.spm(context),
                                color: ColorUtils.black255,
                              ),
                            ),
                          ),


                          SpacerWidget.spacerWidget(spaceHeight: 16.hm(context)),


                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(5, (index) {
                              return Container(
                                height: 35.hm(context),
                                width: 35.wm(context),
                                decoration: BoxDecoration(
                                    color: Colors.transparent
                                ),
                                child: IconButton(
                                  onPressed: () async {
                                    selectId.value = pickUpRequestResponseModel.value.data?.rider?.sId;
                                    rating.value = index;
                                    print(rating.value);
                                  },
                                  icon: Icon(
                                    Icons.star,
                                    size: 24.sm(context),
                                    color: index <= rating.value  && selectId.value == pickUpRequestResponseModel.value.data?.rider?.sId ?
                                    ColorUtils.yellow175 :
                                    ColorUtils.white217,
                                  ),
                                ),
                              );
                            }),
                          ),



                          SpacerWidget.spacerWidget(spaceHeight: 16.hm(context)),



                          isRider.value == true ?
                          Container(
                            height: 48.hm(context),
                            width: 300.wm(context),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                            ),
                            child: Center(child: CircularProgressIndicator(),),
                          ) :
                          Container(
                            height: 48.hm(context),
                            width: 300.wm(context),
                            decoration: BoxDecoration(
                              color: ColorUtils.blue192,
                              borderRadius: BorderRadius.circular(8.rm(context)),
                            ),
                            child: TextButton(
                              style: TextButton.styleFrom(padding: EdgeInsets.zero),
                              onPressed: () async {
                                isRider.value = true;
                                Map<String,dynamic> data = {
                                  "rider": pickUpRequestResponseModel.value.data?.rider?.sId,
                                  "stars": (rating.value + 1)
                                };
                                print(data);
                                RatingController.getReviewResponse(
                                  data: data,
                                  onSuccess: (e) async {
                                    isRider.value = false;
                                    selectId.value = "";
                                    rating.value = 0;
                                    CustomSnackBar().successCustomSnackBar(context: context, message: e);
                                  },
                                  onFail: (e) async {
                                    isRider.value = false;
                                    selectId.value = "";
                                    rating.value = 0;
                                    CustomSnackBar().errorCustomSnackBar(context: context, message: e);
                                  },
                                  onExceptionFail: (e) async {
                                    isRider.value = false;
                                    selectId.value = "";
                                    rating.value = 0;
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
                              },
                              child: Center(
                                child: Text(
                                  "Submit Your Rating".tr,
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

                        ],
                      ),
                    ),

                    SpacerWidget.spacerWidget(spaceHeight: 25.hm(context)),

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