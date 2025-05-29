import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rahatak_food_delivery_app/utils/utils.dart';

import '../controller/controller.dart';
import '../model/model.dart';
import '../screen/screen.dart';

class OrderHistoryScreenWidget extends GetxController {

  Rx<UserWiseOrderListResponseModel> userWiseOrderListResponseModel = UserWiseOrderListResponseModel().obs;
  BuildContext context;
  OrderHistoryScreenWidget({required this.context});
  RxBool isLoading = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(const Duration(seconds: 1),() async {
      await OrderController.getUserWiseOrderList(
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
        userWiseOrderListResponseModel.value = value;
      });
    });
  }


  Widget orderHistoryScreenWidget({required BuildContext context}) {
    return Obx(()=>SafeArea(
      child: Container(
        height: 844.hm(context),
        width: 390.wm(context),
        decoration: BoxDecoration(
          color: ColorUtils.white248,
        ),
        child: isLoading.value == false ?
        CustomScrollView(
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
                                "Order History".tr,
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
      
                  ],
                ),
              ),
            ),

            SliverList(
                delegate: SliverChildBuilderDelegate(
                    (context,int index) {
                      return  Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.hpmm(context)),
                        child: Container(
                          width: 390.wm(context),
                          padding: EdgeInsets.symmetric(vertical: 9.vpmm(context),horizontal: 8.hpmm(context)),
                          margin: EdgeInsets.only(bottom: 10.bpmm(context)),
                          decoration: BoxDecoration(
                              border: Border.all(color: ColorUtils.gray155,width: .5),
                              borderRadius: BorderRadius.circular(10.rm(context))
                          ),
                          child: Column(
                            children: [


                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  Container(
                                    alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
                                    child: Text(
                                      "Order number ${userWiseOrderListResponseModel.value.data?.data?[index].orderId ?? ""}".tr,
                                      textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                      style: GoogleFonts.tajawal(
                                        fontWeight: FontWeight.w700,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 18.spm(context),
                                        color: ColorUtils.black33,
                                      ),
                                    ),
                                  ),

                                  Container(
                                    height: 37.hm(context),
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                    ),
                                    child: TextButton(
                                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                      onPressed: () async {
                                        Get.off(()=>RatingAndReviewScreen(orderId: userWiseOrderListResponseModel.value.data?.data?[index].sId,),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                                      },
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [

                                          Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              "Ratting".tr,
                                              textAlign: TextAlign.start,
                                              style: GoogleFonts.tajawal(
                                                fontWeight: FontWeight.w700,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 14.spm(context),
                                                color: ColorUtils.blue192,
                                              ),
                                            ),
                                          ),

                                          SpacerWidget.spacerWidget(spaceWidth: 6.wm(context)),


                                          Icon(Icons.arrow_forward_ios_sharp,size: 15.sm(context),color: ColorUtils.blue192,),





                                        ],
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                        
                        
                        
                              SpacerWidget.spacerWidget(spaceHeight: 11.hm(context)),
                        
                              Container(
                                alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
                                child: Text(
                                  "${userWiseOrderListResponseModel.value.data?.data?[index].customer?.name ?? ""}".tr,
                                  textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                  style: GoogleFonts.tajawal(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14.spm(context),
                                    color: ColorUtils.gray117,
                                  ),
                                ),
                              ),
                        
                        
                              SpacerWidget.spacerWidget(spaceHeight: 3.hm(context)),
                        
                        
                              Container(
                                alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
                                child: Text(
                                  "${userWiseOrderListResponseModel.value.data?.data?[index].deliveryLocation?.city ?? ""}, ${userWiseOrderListResponseModel.value.data?.data?[index].deliveryLocation?.governorate?.first ?? ""}, ${userWiseOrderListResponseModel.value.data?.data?[index].deliveryLocation?.state ?? ""}".tr,
                                  textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                  style: GoogleFonts.tajawal(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14.spm(context),
                                    color: ColorUtils.gray117,
                                  ),
                                ),
                              ),
                        
                        
                              SpacerWidget.spacerWidget(spaceHeight: 3.hm(context)),

                        
                              Container(
                                alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
                                child: Text(
                                  userWiseOrderListResponseModel.value.data?.data?[index].paymentMethod == "cod" ? "Payment method: Cash on delivery".tr : "Payment method: Online Payment".tr,
                                  textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                  style: GoogleFonts.tajawal(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14.spm(context),
                                    color: ColorUtils.gray117,
                                  ),
                                ),
                              ),
                        
                        
                              SpacerWidget.spacerWidget(spaceHeight: 11.hm(context)),
                        
                        
                              Container(
                                height: 1.5.hm(context),
                                width: 390.wm(context),
                                decoration: BoxDecoration(
                                    color: ColorUtils.white217
                                ),
                              ),
                        
                        
                        
                              SpacerWidget.spacerWidget(spaceHeight: 11.hm(context)),
                        
                        
                              Container(
                                alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
                                child: Text(
                                  "Order details".tr,
                                  textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                  style: GoogleFonts.tajawal(
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 18.spm(context),
                                    color: ColorUtils.black33,
                                  ),
                                ),
                              ),
                        
                              SpacerWidget.spacerWidget(spaceHeight: 11.hm(context)),
                        
                              Container(
                                alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
                                child: Text(
                                  "${userWiseOrderListResponseModel.value.data?.data?[index].store?.name ?? ""}".tr,
                                  textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                  style: GoogleFonts.tajawal(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14.spm(context),
                                    color: ColorUtils.gray117,
                                  ),
                                ),
                              ),
                              
                        
                              SpacerWidget.spacerWidget(spaceHeight: 13.hm(context)),
                              
                              
                              Column(
                                children: List.generate(userWiseOrderListResponseModel.value.data!.data![index].items!.length, (Index) {
                                  return  Container(
                                    width: 390.wm(context),
                                    padding: EdgeInsets.symmetric(vertical: 9.vpmm(context),horizontal: 9.hpmm(context)),
                                    margin: EdgeInsets.only(bottom: 17.bpmm(context)),
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      image: DecorationImage(
                                        image: AssetImage(ImagePathUtils.dotBorderIconImagePath),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [


                                        Container(
                                          height: 50.hm(context),
                                          width: 50.wm(context),
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                          ),
                                          child: FittedBox(
                                            fit: BoxFit.fill,
                                            child: userWiseOrderListResponseModel.value.data?.data?[index].items?[Index].product?.images != null ?
                                            Image.network(
                                              userWiseOrderListResponseModel.value.data!.data![index].items![Index].product!.images!.first,
                                              fit: BoxFit.cover,
                                            ) :
                                            Image.asset(
                                              ImagePathUtils.pList_1,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),

                                        SpacerWidget.spacerWidget(spaceWidth: 13.wm(context)),


                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [

                                              Container(
                                                alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
                                                child: Text(
                                                  "${userWiseOrderListResponseModel.value.data?.data?[index].items?[Index].product?.name ?? ""}".tr,
                                                  textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                                  style: GoogleFonts.tajawal(
                                                    fontWeight: FontWeight.w700,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 18.spm(context),
                                                    color: ColorUtils.black33,
                                                  ),
                                                ),
                                              ),


                                              SpacerWidget.spacerWidget(spaceHeight: 8.hm(context)),


                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [

                                                  Container(
                                                    alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
                                                    child: Text(
                                                      "${"Quantity".tr}: ${userWiseOrderListResponseModel.value.data?.data?[index].items?[Index].quantity}",
                                                      textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                                      style: GoogleFonts.tajawal(
                                                        fontWeight: FontWeight.w500,
                                                        fontStyle: FontStyle.normal,
                                                        fontSize: 14.spm(context),
                                                        color: ColorUtils.gray117,
                                                      ),
                                                    ),
                                                  ),


                                                  Container(
                                                    alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
                                                    child: Text(
                                                      "${"Size".tr}: ${userWiseOrderListResponseModel.value.data?.data?[index].items?[Index].size.toString().toUpperCase()}",
                                                      textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                                      style: GoogleFonts.tajawal(
                                                        fontWeight: FontWeight.w500,
                                                        fontStyle: FontStyle.normal,
                                                        fontSize: 14.spm(context),
                                                        color: ColorUtils.gray117,
                                                      ),
                                                    ),
                                                  ),



                                                  Container(
                                                    alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
                                                    child: Text(
                                                      "${userWiseOrderListResponseModel.value.data?.data?[index].items?[Index].price} ${"OMR".tr}",
                                                      textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                                      style: GoogleFonts.tajawal(
                                                        fontWeight: FontWeight.w500,
                                                        fontStyle: FontStyle.normal,
                                                        fontSize: 14.spm(context),
                                                        color: ColorUtils.gray117,
                                                      ),
                                                    ),
                                                  ),

                                                ],
                                              )


                                            ],
                                          ),
                                        )


                                      ],
                                    ),
                                  );
                                })
                              ),
                              
                              
                              Container(
                                height: 1.5.hm(context),
                                width: 390.wm(context),
                                decoration: BoxDecoration(
                                    color: ColorUtils.white217
                                ),
                              ),
                        
                        
                        
                              SpacerWidget.spacerWidget(spaceHeight: 11.hm(context)),
                        
                        
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
                                    child: Text(
                                      "Total amount".tr,
                                      textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                      style: GoogleFonts.tajawal(
                                        fontWeight: FontWeight.w700,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 18.spm(context),
                                        color: ColorUtils.black33,
                                      ),
                                    ),
                                  ),
                        
                        
                                  Container(
                                    alignment: Get.locale.toString() == "en" ? Alignment.centerLeft :  Alignment.centerRight,
                                    child: Text(
                                      "${userWiseOrderListResponseModel.value.data?.data?[index].total} ${"OMR".tr}",
                                      textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                      style: GoogleFonts.tajawal(
                                        fontWeight: FontWeight.w700,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 18.spm(context),
                                        color: ColorUtils.black33,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                        
                        
                            ],
                          ),
                        ),
                      );
                    },
                  childCount: userWiseOrderListResponseModel.value.data?.data?.length,
                )
            )
      
      
          ],
        ) :
        Center(child: CircularProgressIndicator(),),
      ),
    ));
  }



}