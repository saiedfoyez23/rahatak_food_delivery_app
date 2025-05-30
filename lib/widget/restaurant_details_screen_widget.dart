import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rahatak_food_delivery_app/controller/controller.dart';
import 'package:rahatak_food_delivery_app/model/model.dart';
import 'package:rahatak_food_delivery_app/screen/screen.dart';
import 'package:rahatak_food_delivery_app/utils/utils.dart';

class RestaurantDetailsScreenWidget extends GetxController {

  Rx<SingleStoreDetailsResponseModel> singleStoreDetailsResponseModel = SingleStoreDetailsResponseModel().obs;
  Rx<ProductsResponseModel> productsResponseModel = ProductsResponseModel().obs;
  String storeId;
  BuildContext context;
  RxBool isSubmit = false.obs;
  RestaurantDetailsScreenWidget({required this.storeId,required this.context});
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
      await StoresController.getSingleStoresResponse(
        storeId: storeId,
        onSuccess: (e) async {
          await ProductController.getProductByStoreResponse(
            storeId: storeId,
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
        singleStoreDetailsResponseModel.value = value;
      });
    });
  }



  RxList<FoodDetails> foodDetails = <FoodDetails>[
    FoodDetails(
      name: "Tanoor",
      time: "10 Minutes",
      amount: "1.900 OMR",
      description: "Fresh oven bread stuffed with chicken or meat shawarma with special sauces and fresh vegetables.",
      image: "images/extra_image/p_list_1.png",
    ),
    FoodDetails(
        image: "images/extra_image/p_list_4.png",
        name: "Sandwich Packet",
        time: "20 Minutes",
        amount: "2.200 OMR",
        description: "An assortment of mini shawarma sandwiches, filled with various flavors and served with fries and appetizers."
    ),
    FoodDetails(
        image: "images/extra_image/p_list_3.png",
        name: "Chicken Fries",
        time: "10 Minutes", amount: "1.500 OMR",
        description: "Crispy fries topped with shawarma pieces, melted cheese, and special sauces."
    ),
    FoodDetails(
        image: "images/extra_image/p_list_2.png",
        name: "Meal Name",
        time: "15 Minutes",
        amount: "3.500 OMR",
        description: "Mini sandwich box with 3 delicious sauces such as garlic, hummus, and tahini, to add a rich flavor to your meal."),
  ].obs;


  Widget restaurantDetailsScreenWidget({required BuildContext context}) {
    if(MediaQuery.sizeOf(context).height > 1000) {
      return Obx(()=>SafeArea(
        child: Container(
          height: 1133.ht(context),
          width: 744.wt(context),
          decoration: BoxDecoration(
            color: ColorUtils.white248,
          ),
          child: isLoading.value == false ? CustomScrollView(
            slivers: [

              SliverToBoxAdapter(
                child: Container(
                  height: 522.ht(context),
                  width: 744.wt(context),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [


                      SizedBox(
                        height: 522.ht(context),
                        width: 744.wt(context),
                      ),


                      Container(
                        height: 522.ht(context),
                        width: 744.wt(context),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            Container(
                              height: 340.ht(context),
                              width: 744.wt(context),
                              decoration: BoxDecoration(
                                  color: Colors.transparent
                              ),
                              child: FittedBox(
                                fit: BoxFit.fill,
                                child: singleStoreDetailsResponseModel.value.data?.cover == null ?
                                Image.asset(
                                  ImagePathUtils.noImageImagePath,
                                  fit: BoxFit.fill,
                                ) : Image.network(
                                  singleStoreDetailsResponseModel.value.data!.cover!,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),


                          ],
                        ),
                      ),


                      Container(
                        height: 522.ht(context),
                        width: 744.wt(context),
                        decoration: BoxDecoration(
                            color: Colors.transparent
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 37.hpmt(context)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Column(
                              children: [

                                SpacerWidget.spacerWidget(spaceHeight: 4.ht(context)),


                                Directionality(
                                  textDirection: TextDirection.ltr,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 40.ht(context),
                                        width: 40.wt(context),
                                        decoration: BoxDecoration(
                                            color: Colors.transparent
                                        ),
                                        child: TextButton(
                                          style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                          onPressed: () {
                                            Get.off(()=>HomeScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
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
                                    ],
                                  ),
                                ),

                              ],
                            ),


                            Container(
                              width: 500.wt(context),
                              decoration: BoxDecoration(
                                color: ColorUtils.white255,
                                borderRadius: BorderRadius.circular(10.rt(context)),
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: 10.vpmt(context),
                                horizontal: 12.hpmt(context),
                              ),
                              child: Row(
                                children: [

                                  Container(
                                    height: 120.ht(context),
                                    width: 100.wt(context),
                                    decoration: BoxDecoration(
                                        color: Colors.transparent
                                    ),
                                    child: Column(
                                      children: [

                                        Container(
                                          height: 35.ht(context),
                                          width: 100.wt(context),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10.rt(context)),
                                              topRight: Radius.circular(10.rt(context)),
                                            ),
                                            color: singleStoreDetailsResponseModel.value.data?.status == "crowded" ? ColorUtils.yellow160 :
                                            singleStoreDetailsResponseModel.value.data?.status == "available" ? ColorUtils.green142 :
                                            ColorUtils.red211,
                                          ),
                                          padding: EdgeInsets.symmetric(vertical: 2.vpmt(context),horizontal: 2.hpmt(context)),
                                          alignment: Alignment.center,
                                          child: Container(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "${singleStoreDetailsResponseModel.value.data?.status}".tr,
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
                                            height: 85.ht(context),
                                            width: 100.wt(context),
                                            decoration: BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: ColorUtils.white217,width: 0.5),
                                                left: BorderSide(color: ColorUtils.white217,width: 0.5),
                                                bottom: BorderSide(color: ColorUtils.white217,width: 0.5),
                                              ),
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(10.rt(context)),
                                                bottomRight: Radius.circular(10.rt(context)),
                                              ),
                                            ),
                                            child:FittedBox(
                                              fit: BoxFit.fill,
                                              child: singleStoreDetailsResponseModel.value.data?.image == null ?
                                              Image.asset(
                                                ImagePathUtils.noImageImagePath,
                                                fit: BoxFit.fill,
                                              ) : Image.network(
                                                singleStoreDetailsResponseModel.value.data!.image!,
                                                fit: BoxFit.fill,
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
                                            "${singleStoreDetailsResponseModel.value.data?.name ?? ""}".tr,
                                            textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                            style: GoogleFonts.tajawal(
                                              fontWeight: FontWeight.w700,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 18.spt(context),
                                              color: ColorUtils.black30,
                                            ),
                                          ),
                                        ),


                                        SpacerWidget.spacerWidget(spaceHeight: 10.hm(context)),

                                        Row(
                                          children: List.generate(singleStoreDetailsResponseModel.value.data!.categories!.length, (Index) {
                                            return Container(
                                              alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                              child: Text(
                                                "${singleStoreDetailsResponseModel.value.data?.categories?[Index].name ?? ""}, ".tr,
                                                textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                                style: GoogleFonts.tajawal(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 14.spt(context),
                                                  color: ColorUtils.gray117,
                                                ),
                                              ),
                                            );
                                          }),
                                        ),


                                        SpacerWidget.spacerWidget(spaceHeight: 10.ht(context)),


                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
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
                                                "${singleStoreDetailsResponseModel.value.data?.ratings ?? ""}".tr,
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


                                        SpacerWidget.spacerWidget(spaceWidth: 12.wt(context)),


                                        singleStoreDetailsResponseModel.value.data?.locations != null ?
                                        Column(
                                          children: List.generate(singleStoreDetailsResponseModel.value.data!.locations!.length, (Index) {
                                            return Column(
                                              children: [
                                                SpacerWidget.spacerWidget(spaceHeight: 5.ht(context)),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
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

                                                    Container(
                                                      alignment: Alignment.centerLeft,
                                                      child: Text(
                                                        "${singleStoreDetailsResponseModel.value.data?.locations?[Index].governorate ?? ""}, ${singleStoreDetailsResponseModel.value.data?.locations?[Index].state ?? ""}".tr,
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
                                              ],
                                            );
                                          }),
                                        ) :
                                        SpacerWidget.spacerWidget(),



                                        singleStoreDetailsResponseModel.value.data?.workingHours != null ?
                                        Column(
                                          children: List.generate(singleStoreDetailsResponseModel.value.data!.workingHours!.length, (Index) {
                                            return Column(
                                              children: [
                                                SpacerWidget.spacerWidget(spaceHeight: 5.ht(context)),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
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
                                                          ImagePathUtils.timeIconImagePath,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),

                                                    SpacerWidget.spacerWidget(spaceWidth: 8.wt(context)),

                                                    Container(
                                                      alignment: Alignment.centerLeft,
                                                      child: Text(
                                                        "${singleStoreDetailsResponseModel.value.data?.workingHours?[Index].from} - ${singleStoreDetailsResponseModel.value.data?.workingHours?[Index].to}".tr,
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
                                              ],
                                            );
                                          }),
                                        ) :
                                        SpacerWidget.spacerWidget(),


                                      ],
                                    ),
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
              ),


              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 78.hpmt(context)),
                  child: Column(
                    children: [
                      SpacerWidget.spacerWidget(spaceHeight: 26.ht(context)),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              "Menu".tr,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.tajawal(
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                                fontSize: 20.spt(context),
                                color: ColorUtils.black30,
                              ),
                            ),
                          ),


                          Container(
                            height: 24.ht(context),
                            width: 24.wt(context),
                            decoration: BoxDecoration(
                                color: Colors.transparent
                            ),
                            child: TextButton(
                              style: TextButton.styleFrom(padding: EdgeInsets.zero),
                              onPressed: () {
                                showAdaptiveDialog(
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding: EdgeInsets.only(
                                          top: 580.tpmt(context),
                                          bottom: 280.tpmt(context),
                                          left: Get.locale.toString() == "en" ? 557.lpmt(context) : 78.rpmt(context),
                                          right: Get.locale.toString() == "en" ? 78.rpmt(context) : 557.lpmt(context)
                                      ),
                                      child: Container(
                                        height: 88.ht(context),
                                        width: 150.wt(context),
                                        decoration: BoxDecoration(
                                          color: ColorUtils.white255,
                                          borderRadius: BorderRadius.circular(10.rt(context)),
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4,
                                              spreadRadius: 0,
                                              color: ColorUtils.black05,
                                              offset: Offset(0, 0),
                                            )
                                          ],
                                        ),
                                        child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: List.generate(singleStoreDetailsResponseModel.value.data!.categories!.length, (Index) {
                                              return Container(
                                                height: 42.ht(context),
                                                width: 150.wt(context),
                                                decoration: BoxDecoration(
                                                  color: Colors.transparent,
                                                ),
                                                child: TextButton(
                                                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                                  onPressed: () async {
                                                    isSubmit.value = true;
                                                    await ProductController.getProductByCategoryResponse(
                                                      categoryId: singleStoreDetailsResponseModel.value.data?.categories?[Index].sId,
                                                      onSuccess: (e) async {
                                                        Get.back();
                                                        isSubmit.value = false;
                                                        CustomSnackBar().successCustomSnackBar(context: context, message: e);
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
                                                  child: Center(
                                                    child: Text(
                                                      "${singleStoreDetailsResponseModel.value.data?.categories?[Index].name ?? ""}".tr,
                                                      textAlign: TextAlign.center,
                                                      style: GoogleFonts.tajawal(
                                                        fontWeight: FontWeight.w500,
                                                        fontStyle: FontStyle.normal,
                                                        fontSize: 16.spt(context),
                                                        color: ColorUtils.black33,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            })
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: Image.asset(
                                  ImagePathUtils.listShowImagePath,
                                  fit: BoxFit.cover,
                                  alignment: Alignment.center,
                                ),
                              ),
                            ),
                          ),


                        ],
                      ),

                      SpacerWidget.spacerWidget(spaceHeight: 18.ht(context)),
                    ],
                  ),
                ),
              ),


              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 78.hpmt(context)),
                sliver: SliverGrid.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 17.ht(context),
                    mainAxisSpacing: 12.wt(context),
                    childAspectRatio: 288.wt(context) / 330.ht(context),
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
                      child: TextButton(
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        onPressed: () async {
                          Get.off(()=>ProductDetailsScreen(productId: productsResponseModel.value.data?.data?[index].sId,),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                        },
                        child: Column(
                          children: [


                            Container(
                              height: 150.ht(context),
                              width: 150.wt(context),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.rt(context)),
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


                            SpacerWidget.spacerWidget(spaceHeight: 10.ht(context)),

                            Container(
                              alignment: Get.locale.toString() == "en" ? Alignment.center : Alignment.center,
                              child: Text(
                                "${productsResponseModel.value.data?.data?[index].name ?? ""}".tr,
                                textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                style: GoogleFonts.tajawal(
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 18.spt(context),
                                  color: ColorUtils.black30,
                                ),
                              ),
                            ),


                            SpacerWidget.spacerWidget(spaceHeight: 10.ht(context)),

                            Container(
                              alignment: Get.locale.toString() == "en" ? Alignment.center : Alignment.center,
                              child: Text(
                                "${productsResponseModel.value.data?.data?[index].description ?? ""}".tr,
                                textAlign: Get.locale.toString() == "en" ? TextAlign.center : TextAlign.center,
                                style: GoogleFonts.tajawal(
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14.spt(context),
                                  color: ColorUtils.gray117,
                                ),
                              ),
                            ),

                            SpacerWidget.spacerWidget(spaceHeight: 10.ht(context)),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [


                                Row(
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
                                          ImagePathUtils.timeIconImagePath,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),

                                    SpacerWidget.spacerWidget(spaceWidth: 8.wt(context)),

                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "${productsResponseModel.value.data?.data?[index].timeRequired ?? ""} ${"Minutes".tr}".tr,
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


                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "${productsResponseModel.value.data?.data?[index].variations?.first.price ?? ""} ${"OMR".tr}(${productsResponseModel.value.data?.data?[index].variations?.first.size.toString().toUpperCase().tr})",
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

                            SpacerWidget.spacerWidget(spaceHeight: 10.ht(context)),


                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: productsResponseModel.value.data?.data?.length,
                ),
              ),




            ],
          ) : Center(child: CircularProgressIndicator(),),
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
          child: isLoading.value == false ? CustomScrollView(
            slivers: [

              SliverToBoxAdapter(
                child: Container(
                  height: 404.hm(context),
                  width: 390.wm(context),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [


                      SizedBox(
                        height: 404.hm(context),
                        width: 390.wm(context),
                      ),


                      Container(
                        height: 404.hm(context),
                        width: 390.wm(context),
                        decoration: BoxDecoration(
                            color: Colors.transparent
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            Container(
                              height: 265.hm(context),
                              width: 390.wm(context),
                              decoration: BoxDecoration(
                                  color: Colors.transparent
                              ),
                              child: FittedBox(
                                fit: BoxFit.fill,
                                child: singleStoreDetailsResponseModel.value.data?.cover == null ?
                                Image.asset(
                                  ImagePathUtils.noImageImagePath,
                                  fit: BoxFit.fill,
                                ) : Image.network(
                                  singleStoreDetailsResponseModel.value.data!.cover!,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),


                          ],
                        ),
                      ),


                      Container(
                        height: 404.hm(context),
                        width: 390.wm(context),
                        decoration: BoxDecoration(
                            color: Colors.transparent
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 16.hpmm(context)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Column(
                              children: [

                                SpacerWidget.spacerWidget(spaceHeight: 4.hm(context)),


                                Directionality(
                                  textDirection: TextDirection.ltr,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 40.hm(context),
                                        width: 40.wm(context),
                                        decoration: BoxDecoration(
                                            color: Colors.transparent
                                        ),
                                        child: TextButton(
                                          style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                          onPressed: () {
                                            Get.off(()=>HomeScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
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
                                    ],
                                  ),
                                ),

                              ],
                            ),


                            Container(
                              width: 317.wm(context),
                              decoration: BoxDecoration(
                                color: ColorUtils.white255,
                                borderRadius: BorderRadius.circular(10.rm(context)),
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: 10.vpmm(context),
                                horizontal: 12.hpmm(context),
                              ),
                              child: Row(
                                children: [

                                  Container(
                                    height: 120.hm(context),
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
                                            color: singleStoreDetailsResponseModel.value.data?.status == "crowded" ? ColorUtils.yellow160 :
                                            singleStoreDetailsResponseModel.value.data?.status == "available" ? ColorUtils.green142 :
                                            ColorUtils.red211,
                                          ),
                                          padding: EdgeInsets.symmetric(vertical: 2.vpmm(context),horizontal: 2.hpmm(context)),
                                          alignment: Alignment.center,
                                          child: Container(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "${singleStoreDetailsResponseModel.value.data?.status ?? ""}".tr,
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
                                            height: 85.hm(context),
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
                                              child: singleStoreDetailsResponseModel.value.data?.image == null ?
                                              Image.asset(
                                                ImagePathUtils.noImageImagePath,
                                                fit: BoxFit.fill,
                                              ) : Image.network(
                                                singleStoreDetailsResponseModel.value.data!.image!,
                                                fit: BoxFit.fill,
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
                                            "${singleStoreDetailsResponseModel.value.data?.name ?? ""}".tr,
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
                                          children: List.generate(singleStoreDetailsResponseModel.value.data!.categories!.length, (Index) {
                                            return Container(
                                              alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                              child: Text(
                                                "${singleStoreDetailsResponseModel.value.data?.categories?[Index].name ?? ""}, ".tr,
                                                textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                                style: GoogleFonts.tajawal(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 14.spm(context),
                                                  color: ColorUtils.gray117,
                                                ),
                                              ),
                                            );
                                          }),
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
                                                "${singleStoreDetailsResponseModel.value.data?.ratings ?? ""}".tr,
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



                                        singleStoreDetailsResponseModel.value.data?.locations != null ?
                                        Column(
                                          children: List.generate(singleStoreDetailsResponseModel.value.data!.locations!.length, (Index) {
                                            return Row(
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

                                                Container(
                                                  alignment: Alignment.centerLeft,
                                                  child: Text(
                                                    "${singleStoreDetailsResponseModel.value.data?.locations?[Index].governorate ?? ""}, ${singleStoreDetailsResponseModel.value.data?.locations?[Index].state ?? ""}".tr,
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
                                          }),
                                        ) :
                                        SpacerWidget.spacerWidget(),



                                        SpacerWidget.spacerWidget(spaceHeight: 10.hm(context)),


                                        singleStoreDetailsResponseModel.value.data?.workingHours != null ?
                                        Column(
                                          children: List.generate(singleStoreDetailsResponseModel.value.data!.workingHours!.length, (Index) {
                                            return Column(
                                              children: [
                                                SpacerWidget.spacerWidget(spaceHeight: 5.hm(context)),
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
                                                          ImagePathUtils.timeIconImagePath,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),

                                                    SpacerWidget.spacerWidget(spaceWidth: 8.wm(context)),

                                                    Container(
                                                      alignment: Alignment.centerLeft,
                                                      child: Text(
                                                        "${singleStoreDetailsResponseModel.value.data?.workingHours?[Index].from} - ${singleStoreDetailsResponseModel.value.data?.workingHours?[Index].to}".tr,
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
                                            );
                                          }),
                                        ) :
                                        SpacerWidget.spacerWidget(),



                                      ],
                                    ),
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
              ),


              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.hpmm(context)),
                  child: Column(
                    children: [
                      SpacerWidget.spacerWidget(spaceHeight: 19.hm(context)),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              "Menu".tr,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.tajawal(
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                                fontSize: 20.spm(context),
                                color: ColorUtils.black30,
                              ),
                            ),
                          ),


                          Container(
                            height: 24.hm(context),
                            width: 24.wm(context),
                            decoration: BoxDecoration(
                                color: Colors.transparent
                            ),
                            child: TextButton(
                              style: TextButton.styleFrom(padding: EdgeInsets.zero),
                              onPressed: () {
                                showAdaptiveDialog(
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding: EdgeInsets.only(
                                          top: 460.tpmm(context),
                                          bottom: 124.tpmm(context),
                                          left: Get.locale.toString() == "en" ? 277.lpmm(context) : 16.rpmm(context),
                                          right: Get.locale.toString() == "en" ? 16.rpmm(context) : 277.lpmm(context)
                                      ),
                                      child: Container(
                                        height: 88.hm(context),
                                        width: 150.wm(context),
                                        decoration: BoxDecoration(
                                          color: ColorUtils.white255,
                                          borderRadius: BorderRadius.circular(10.rm(context)),
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4,
                                              spreadRadius: 0,
                                              color: ColorUtils.black05,
                                              offset: Offset(0, 0),
                                            )
                                          ],
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: List.generate(singleStoreDetailsResponseModel.value.data!.categories!.length, (Index) {
                                            return Container(
                                              height: 42.hm(context),
                                              width: 150.wm(context),
                                              decoration: BoxDecoration(
                                                color: Colors.transparent,
                                              ),
                                              child: TextButton(
                                                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                                onPressed: () async {
                                                  isSubmit.value = true;
                                                  await ProductController.getProductByCategoryResponse(
                                                    categoryId: singleStoreDetailsResponseModel.value.data?.categories?[Index].sId,
                                                    onSuccess: (e) async {
                                                      Get.back();
                                                      isSubmit.value = false;
                                                      CustomSnackBar().successCustomSnackBar(context: context, message: e);
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
                                                child: Center(
                                                  child: Text(
                                                    "${singleStoreDetailsResponseModel.value.data?.categories?[Index].name ?? ""}".tr,
                                                    textAlign: TextAlign.center,
                                                    style: GoogleFonts.tajawal(
                                                      fontWeight: FontWeight.w500,
                                                      fontStyle: FontStyle.normal,
                                                      fontSize: 16.spm(context),
                                                      color: ColorUtils.black33,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          })
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: Image.asset(
                                  ImagePathUtils.listShowImagePath,
                                  fit: BoxFit.cover,
                                  alignment: Alignment.center,
                                ),
                              ),
                            ),
                          ),


                        ],
                      ),

                      SpacerWidget.spacerWidget(spaceHeight: 18.hm(context)),
                    ],
                  ),
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
          ) : Center(child: CircularProgressIndicator(),),
        ),
      ));
    }
  }



}

class FoodDetails {

  String name;
  String time;
  String image;
  String amount;
  String description;

  FoodDetails({
    required this.name,
    required this.time,
    required this.image,
    required this.amount,
    required this.description,
  });
}