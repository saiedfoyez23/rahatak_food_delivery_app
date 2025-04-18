import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rahatak_food_delivery_app/utils/utils.dart';

import '../screen/screen.dart';

class ProductDetailsScreenWidget extends GetxController {


  RxInt number = 0.obs;
  RxInt selectSize = 0.obs;
  RxInt quantity = 1.obs;
  Rx<TextEditingController> noteController = TextEditingController().obs;


  Widget productDetailsScreenWidget({required BuildContext context}) {
    if(MediaQuery.sizeOf(context).height > 1000) {
      return Obx(()=>SafeArea(
        child: Container(
          height: 1134.ht(context),
          width: 744.wt(context),
          decoration: BoxDecoration(
            color: ColorUtils.white248,
          ),
          child: CustomScrollView(
            slivers: [

              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 37.hpmt(context)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      SpacerWidget.spacerWidget(spaceHeight: 11.ht(context),),

                      Row(
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
                                Get.off(()=>RestaurantDetailsScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
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


                    ],
                  ),
                ),
              ),


              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 103.hpmt(context)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [


                      SpacerWidget.spacerWidget(spaceHeight: 26.ht(context),),


                      Container(
                        height: 340.ht(context),
                        width: 358.wt(context),
                        decoration: BoxDecoration(
                            color: Colors.transparent
                        ),
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Image.asset(
                            number.value == 0 ? ImagePathUtils.productImage_1 :
                            number.value == 1 ? ImagePathUtils.productImage_2 :
                            ImagePathUtils.pList_1,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),

                      SpacerWidget.spacerWidget(spaceHeight: 12.ht(context),),



                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: List.generate(
                            3,
                                (index) {
                              return Container(
                                height: 60.ht(context),
                                width: 60.wt(context),
                                decoration: number.value == index ?
                                BoxDecoration(
                                  color: Colors.transparent,
                                  border: Border.all(color: ColorUtils.blue192,width: 1),
                                ) : BoxDecoration(
                                  color: Colors.transparent,
                                ),
                                margin: EdgeInsets.only(right: 12.rpmt(context)),
                                child: TextButton(
                                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                  onPressed: () {
                                    number.value = index;
                                  },
                                  child: FittedBox(
                                    fit: BoxFit.cover,
                                    child: Image.asset(
                                      index == 0 ? ImagePathUtils.productImage_1 :
                                      index == 1 ? ImagePathUtils.productImage_2 :
                                      ImagePathUtils.pList_1,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              );
                            }
                        ),
                      ),

                      SpacerWidget.spacerWidget(spaceHeight: 31.ht(context),),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Tanoor",
                              textAlign: TextAlign.start,
                              style: GoogleFonts.tajawal(
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                                fontSize: 22.spt(context),
                                color: ColorUtils.black30,
                              ),
                            ),
                          ),


                          Container(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "1.900 OMR",
                              textAlign: TextAlign.start,
                              style: GoogleFonts.tajawal(
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                                fontSize: 22.spt(context),
                                color: ColorUtils.black30,
                              ),
                            ),
                          ),


                        ],
                      ),


                      SpacerWidget.spacerWidget(spaceHeight: 20.ht(context),),


                      Container(
                        alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                        child: Text(
                          "Fresh oven bread stuffed with chicken or meat shawarma with special sauces and fresh vegetables.",
                          textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                          style: GoogleFonts.tajawal(
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            fontSize: 16.spt(context),
                            color: ColorUtils.black61,
                          ),
                        ),
                      ),


                      SpacerWidget.spacerWidget(spaceHeight: 20.ht(context),),


                      Container(
                        alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                        child: Text(
                          "Notes: ",
                          textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                          style: GoogleFonts.tajawal(
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            fontSize: 16.spt(context),
                            color: ColorUtils.black33,
                          ),
                        ),
                      ),


                      SpacerWidget.spacerWidget(spaceHeight: 12.ht(context),),


                      TextFormField(
                        controller: noteController.value,
                        textAlign: TextAlign.start,
                        cursorColor: ColorUtils.blue192,
                        cursorHeight: 20.ht(context),
                        style: GoogleFonts.tajawal(
                          fontSize: 16.spt(context),
                          fontStyle: FontStyle.normal,
                          color: ColorUtils.black51,
                          fontWeight: FontWeight.w400,
                        ),
                        maxLines: 5,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          hintText: "Add sauces, spices, salad, ...",
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
                            maxHeight: 85.ht(context),
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


                      SpacerWidget.spacerWidget(spaceHeight: 20.ht(context),),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [


                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "SIZE ",
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.tajawal(
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 16.spt(context),
                                    color: ColorUtils.black33,
                                  ),
                                ),
                              ),


                              SpacerWidget.spacerWidget(spaceHeight: 8.ht(context)),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: List.generate(
                                    3,
                                        (index) {
                                      return Container(
                                        height: 32.ht(context),
                                        width: 57.wt(context),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10.rm(context)),
                                          border: Border.all(
                                            color: selectSize.value == index ? ColorUtils.blue192 : ColorUtils.gray136,
                                            width: 1,
                                          ),
                                          color: selectSize.value == index ? ColorUtils.white255 : ColorUtils.white233,
                                        ),
                                        margin: EdgeInsets.only(right: 12.rpmt(context)),
                                        child: TextButton(
                                          style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                          onPressed: () {
                                            selectSize.value = index;
                                          },
                                          child: Center(
                                            child: Container(
                                              alignment: Alignment.center,
                                              child: Text(
                                                index == 0 ? "SMALL" : index == 1 ? "MIDDLE" : "LARGE",
                                                textAlign: TextAlign.start,
                                                style: GoogleFonts.tajawal(
                                                  fontWeight: FontWeight.w700,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 12.spt(context),
                                                  color: selectSize.value == index ? ColorUtils.black51 : ColorUtils.gray136,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                ),
                              )


                            ],
                          ),


                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [


                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "quantity ",
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.tajawal(
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 16.spt(context),
                                    color: ColorUtils.black33,
                                  ),
                                ),
                              ),


                              SpacerWidget.spacerWidget(spaceHeight: 8.ht(context)),

                              Container(
                                height: 32.ht(context),
                                width: 90.wt(context),
                                padding: EdgeInsets.symmetric(horizontal: 8.hpmt(context),vertical: 4.vpmt(context)),
                                decoration: BoxDecoration(
                                  border: Border.all(color: ColorUtils.blue210,width: 0.5),
                                  borderRadius: BorderRadius.circular(4.rt(context)),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [

                                    Container(
                                      height: 20.ht(context),
                                      width: 20.wt(context),
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                      ),
                                      child: TextButton(
                                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                        onPressed: () {
                                          quantity.value = quantity.value + 1;
                                        },
                                        child: FittedBox(
                                          fit: BoxFit.cover,
                                          child: Image.asset(
                                            ImagePathUtils.plusIconImagePath,
                                            fit: BoxFit.cover,
                                            alignment: Alignment.center,
                                          ),
                                        ),
                                      ),
                                    ),

                                    Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "${quantity}",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.tajawal(
                                          fontWeight: FontWeight.w700,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 16.spt(context),
                                          color: ColorUtils.black33,
                                        ),
                                      ),
                                    ),


                                    Container(
                                      height: 20.ht(context),
                                      width: 20.wt(context),
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                      ),
                                      child: TextButton(
                                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                        onPressed: quantity.value == 1 ? null : () {
                                          quantity.value = quantity.value - 1;
                                        },
                                        child: FittedBox(
                                          fit: BoxFit.cover,
                                          child: Image.asset(
                                            ImagePathUtils.minusIconImagePath,
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



                        ],
                      ),


                      SpacerWidget.spacerWidget(spaceHeight: 42.ht(context),),

                      Container(
                        height: 48.ht(context),
                        width: 300.wt(context),
                        decoration: BoxDecoration(
                          color: ColorUtils.blue192,
                          borderRadius: BorderRadius.circular(8.rt(context)),
                        ),
                        child: TextButton(
                          style: TextButton.styleFrom(padding: EdgeInsets.zero),
                          onPressed: () async {
                            Get.off(()=>CartScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                          },
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Add to Cart",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.tajawal(
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 18.spt(context),
                                    color: ColorUtils.white255,
                                  ),
                                ),


                                SpacerWidget.spacerWidget(spaceWidth: 10.wm(context)),


                                Container(
                                  height: 24.ht(context),
                                  width: 27.wt(context),
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                  ),
                                  child: FittedBox(
                                    fit: BoxFit.cover,
                                    child: Image.asset(
                                      ImagePathUtils.cartPlusIconImagePath,
                                      fit: BoxFit.cover,
                                      alignment: Alignment.center,
                                    ),
                                  ),
                                ),



                              ],
                            ),
                          ),
                        ),
                      )


                    ],
                  ),
                ),
              )


            ],
          ),
        ),
      ));
    } else {
      return SafeArea(
        child: Obx(()=>Container(
          height: 844.hm(context),
          width: 390.wm(context),
          decoration: BoxDecoration(
            color: ColorUtils.white248,
          ),
          child: CustomScrollView(
            slivers: [

              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.hpmm(context)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      SpacerWidget.spacerWidget(spaceHeight: 11.hm(context),),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          Container(
                            height: MediaQuery.sizeOf(context).height > 1000 ? 40.ht(context) : 40.hm(context),
                            width: MediaQuery.sizeOf(context).width > 500 ? 40.wt(context) : 40.wm(context),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                            ),
                            child: TextButton(
                              style: TextButton.styleFrom(padding: EdgeInsets.zero),
                              onPressed: () {
                                Get.off(()=>RestaurantDetailsScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
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

                      SpacerWidget.spacerWidget(spaceHeight: 26.hm(context),),


                      Container(
                        height: 340.hm(context),
                        width: 358.wm(context),
                        decoration: BoxDecoration(
                            color: Colors.transparent
                        ),
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Image.asset(
                            number.value == 0 ? ImagePathUtils.productImage_1 :
                            number.value == 1 ? ImagePathUtils.productImage_2 :
                            ImagePathUtils.pList_1,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),

                      SpacerWidget.spacerWidget(spaceHeight: 12.hm(context),),



                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: List.generate(
                            3,
                                (index) {
                              return Container(
                                height: 60.hm(context),
                                width: 60.wm(context),
                                decoration: number.value == index ?
                                BoxDecoration(
                                  color: Colors.transparent,
                                  border: Border.all(color: ColorUtils.blue192,width: 1),
                                ) : BoxDecoration(
                                  color: Colors.transparent,
                                ),
                                margin: EdgeInsets.only(right: 12.rpmm(context)),
                                child: TextButton(
                                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                  onPressed: () {
                                    number.value = index;
                                  },
                                  child: FittedBox(
                                    fit: BoxFit.cover,
                                    child: Image.asset(
                                      index == 0 ? ImagePathUtils.productImage_1 :
                                      index == 1 ? ImagePathUtils.productImage_2 :
                                      ImagePathUtils.pList_1,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              );
                            }
                        ),
                      ),

                      SpacerWidget.spacerWidget(spaceHeight: 31.hm(context),),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Tanoor",
                              textAlign: TextAlign.start,
                              style: GoogleFonts.tajawal(
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                                fontSize: 22.spm(context),
                                color: ColorUtils.black30,
                              ),
                            ),
                          ),


                          Container(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "1.900 OMR",
                              textAlign: TextAlign.start,
                              style: GoogleFonts.tajawal(
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                                fontSize: 22.spm(context),
                                color: ColorUtils.black30,
                              ),
                            ),
                          ),


                        ],
                      ),


                      SpacerWidget.spacerWidget(spaceHeight: 20.hm(context),),


                      Container(
                        alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                        child: Text(
                          "Fresh oven bread stuffed with chicken or meat shawarma with special sauces and fresh vegetables.",
                          textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                          style: GoogleFonts.tajawal(
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            fontSize: 16.spm(context),
                            color: ColorUtils.black61,
                          ),
                        ),
                      ),


                      SpacerWidget.spacerWidget(spaceHeight: 20.hm(context),),


                      Container(
                        alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                        child: Text(
                          "Notes: ",
                          textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                          style: GoogleFonts.tajawal(
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            fontSize: 16.spm(context),
                            color: ColorUtils.black33,
                          ),
                        ),
                      ),


                      SpacerWidget.spacerWidget(spaceHeight: 12.hm(context),),


                      TextFormField(
                        controller: noteController.value,
                        textAlign: TextAlign.start,
                        cursorColor: ColorUtils.blue192,
                        cursorHeight: 20.hm(context),
                        style: GoogleFonts.tajawal(
                          fontSize: 16.spm(context),
                          fontStyle: FontStyle.normal,
                          color: ColorUtils.black51,
                          fontWeight: FontWeight.w400,
                        ),
                        maxLines: 5,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          hintText: "Add sauces, spices, salad, ...",
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
                            maxHeight: 85.hm(context),
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


                      SpacerWidget.spacerWidget(spaceHeight: 20.hm(context),),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [


                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "SIZE ",
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.tajawal(
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 16.spm(context),
                                    color: ColorUtils.black33,
                                  ),
                                ),
                              ),


                              SpacerWidget.spacerWidget(spaceHeight: 8.hm(context)),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: List.generate(
                                    3,
                                    (index) {
                                      return Container(
                                        height: 32.hm(context),
                                        width: 57.wm(context),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10.rm(context)),
                                          border: Border.all(
                                            color: selectSize.value == index ? ColorUtils.blue192 : ColorUtils.gray136,
                                            width: 1,
                                          ),
                                          color: selectSize.value == index ? ColorUtils.white255 : ColorUtils.white233,
                                        ),
                                        margin: EdgeInsets.only(right: 12.rpmm(context)),
                                        child: TextButton(
                                          style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                          onPressed: () {
                                            selectSize.value = index;
                                          },
                                          child: Center(
                                            child: Container(
                                              alignment: Alignment.center,
                                              child: Text(
                                                index == 0 ? "SMALL" : index == 1 ? "MIDDLE" : "LARGE",
                                                textAlign: TextAlign.start,
                                                style: GoogleFonts.tajawal(
                                                  fontWeight: FontWeight.w700,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 12.spm(context),
                                                  color: selectSize.value == index ? ColorUtils.black51 : ColorUtils.gray136,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                ),
                              )


                            ],
                          ),


                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [


                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "quantity ",
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.tajawal(
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 16.spm(context),
                                    color: ColorUtils.black33,
                                  ),
                                ),
                              ),


                              SpacerWidget.spacerWidget(spaceHeight: 8.hm(context)),

                              Container(
                                height: 32.hm(context),
                                width: 90.wm(context),
                                padding: EdgeInsets.symmetric(horizontal: 8.hpmm(context),vertical: 4.vpmm(context)),
                                decoration: BoxDecoration(
                                  border: Border.all(color: ColorUtils.blue210,width: 0.5),
                                  borderRadius: BorderRadius.circular(4.rm(context)),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [

                                    Container(
                                      height: 20.hm(context),
                                      width: 20.wm(context),
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                      ),
                                      child: TextButton(
                                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                        onPressed: () {
                                          quantity.value = quantity.value + 1;
                                        },
                                        child: FittedBox(
                                          fit: BoxFit.cover,
                                          child: Image.asset(
                                            ImagePathUtils.plusIconImagePath,
                                            fit: BoxFit.cover,
                                            alignment: Alignment.center,
                                          ),
                                        ),
                                      ),
                                    ),

                                    Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "${quantity}",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.tajawal(
                                          fontWeight: FontWeight.w700,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 16.spm(context),
                                          color: ColorUtils.black33,
                                        ),
                                      ),
                                    ),


                                    Container(
                                      height: 20.hm(context),
                                      width: 20.wm(context),
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                      ),
                                      child: TextButton(
                                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                        onPressed: quantity.value == 1 ? null : () {
                                          quantity.value = quantity.value - 1;
                                        },
                                        child: FittedBox(
                                          fit: BoxFit.cover,
                                          child: Image.asset(
                                            ImagePathUtils.minusIconImagePath,
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
                          )



                        ],
                      ),


                      SpacerWidget.spacerWidget(spaceHeight: 26.hm(context),),


                    ],
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: Container(
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
                        Get.off(()=>CartScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                      },
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Add to Cart",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.tajawal(
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                                fontSize: 18.spm(context),
                                color: ColorUtils.white255,
                              ),
                            ),


                            SpacerWidget.spacerWidget(spaceWidth: 10.wm(context)),


                            Container(
                              height: 24.hm(context),
                              width: 27.wm(context),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                              ),
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: Image.asset(
                                  ImagePathUtils.cartPlusIconImagePath,
                                  fit: BoxFit.cover,
                                  alignment: Alignment.center,
                                ),
                              ),
                            ),



                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )


            ],
          ),
        ),)
      );
    }
  }


}