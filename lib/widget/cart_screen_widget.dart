import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rahatak_food_delivery_app/screen/order_address_screen.dart';
import 'package:rahatak_food_delivery_app/utils/utils.dart';

class CartScreenWidget extends GetxController {


  RxList<CartList> cartList = <CartList>[
    CartList(index: 0,name: "Tanoor", amount: "1.900 OMR", size: "Size: Medium", notes: "Notes: Spicy", quantity: "1", image: ImagePathUtils.pList_3),
    CartList(index: 1,name: "Chicken Fries", amount: "1.500 OMR", size: "Size: Medium", notes: "Notes: Spicy", quantity: "1", image: ImagePathUtils.pList_1),
    CartList(index: 2,name: "Classic Burger", amount: "1.200 OMR", size: "Size: Medium", notes: "Notes: Spicy", quantity: "1", image: ImagePathUtils.productImage_4),
  ].obs;


  Widget cartScreenWidget({required BuildContext context}) {
    if(MediaQuery.sizeOf(context).height > 1133) {
      return SafeArea(
        child: Container(
          height: 1133.ht(context),
          width: 744.wt(context),
          decoration: BoxDecoration(
            color: ColorUtils.white248,
          ),
          child: Obx(()=>CustomScrollView(
            slivers: [
        
        
              SliverToBoxAdapter(
                child: Column(
                  children: [
        
                    SpacerWidget.spacerWidget(spaceHeight: 20.ht(context)),
        
        
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Cart".tr,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: 16.spt(context),
                          color: ColorUtils.black255,
                        ),
                      ),
                    ),
        
                    SpacerWidget.spacerWidget(spaceHeight: 32.ht(context)),
                    
                    
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 138.hpmt(context)),
                      child: Column(
                        children: [
                      
                      
                          Container(
                            alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                            child: Text(
                              "Orders ( 5 )".tr,
                              textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                              style: GoogleFonts.tajawal(
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                                fontSize: 20.spt(context),
                                color: ColorUtils.black30,
                              ),
                            ),
                          ),
                      
                      
                          SpacerWidget.spacerWidget(spaceHeight: 20.ht(context)),
                      
                          Container(
                            height: 390.ht(context),
                            width: 468.wt(context),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                            ),
                            child: ListView.builder(
                              itemCount: cartList.length,
                              itemBuilder: (context,int index) {
                                return Obx(()=>Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 9.hpmt(context),
                                    vertical: 9.vpmt(context),
                                  ),
                                  margin: EdgeInsets.only(
                                    bottom: 12.bpmt(context),
                                  ),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(ImagePathUtils.borderIconImagePath),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                      
                                      Container(
                                        height: 102.ht(context),
                                        width: 102.wt(context),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12.rm(context)),
                                        ),
                                        child: FittedBox(
                                          fit: BoxFit.fill,
                                          child: Image.asset(
                                            cartList[index].image,
                                            fit: BoxFit.fill,
                                            alignment: Alignment.center,
                                          ),
                                        ),
                                      ),
                      
                      
                                      SpacerWidget.spacerWidget(spaceWidth: 13.wt(context)),
                      
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                      
                                            Container(
                                              alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                              child: Text(
                                                "${cartList[index].name}".tr,
                                                textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                                style: GoogleFonts.tajawal(
                                                  fontWeight: FontWeight.w700,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 18.spt(context),
                                                  color: ColorUtils.black30,
                                                ),
                                              ),
                                            ),
                      
                                            SpacerWidget.spacerWidget(spaceHeight: 5.hpmt(context)),
                      
                                            Container(
                                              alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                              child: Text(
                                                "${cartList[index].amount}".tr,
                                                textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                                style: GoogleFonts.tajawal(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 16.spt(context),
                                                  color: ColorUtils.black30,
                                                ),
                                              ),
                                            ),
                      
                                            SpacerWidget.spacerWidget(spaceHeight: 5.hpmt(context)),
                      
                                            Container(
                                              alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                              child: Text(
                                                "${cartList[index].size}".tr,
                                                textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                                style: GoogleFonts.tajawal(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 14.spt(context),
                                                  color: ColorUtils.gray163,
                                                ),
                                              ),
                                            ),
                      
                                            SpacerWidget.spacerWidget(spaceHeight: 5.hpmt(context)),
                      
                                            Container(
                                              alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                              child: Text(
                                                "${cartList[index].notes}".tr,
                                                textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                                style: GoogleFonts.tajawal(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 14.spt(context),
                                                  color: ColorUtils.gray163,
                                                ),
                                              ),
                                            ),
                      
                                          ],
                                        ),
                                      ),
                      
                      
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                      
                      
                                          Container(
                                            height: 14.ht(context),
                                            width: 14.wt(context),
                                            decoration: BoxDecoration(
                                              color: Colors.transparent,
                                            ),
                                            child: TextButton(
                                              style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                              onPressed: () {
                                                showAdaptiveDialog(
                                                  context: context,
                                                  barrierDismissible: true,
                                                  builder: (context) {
                                                    return Padding(
                                                      padding: EdgeInsets.symmetric(
                                                        vertical: 440.vpmt(context),
                                                        horizontal: 158.hpmt(context),
                                                      ),
                                                      child: Container(
                                                        width: 428.wt(context),
                                                        height: 211.ht(context),
                                                        decoration: BoxDecoration(
                                                          color: ColorUtils.white255,
                                                          borderRadius: BorderRadius.circular(16.rt(context)),
                                                        ),
                                                        padding: EdgeInsets.symmetric(
                                                          vertical: 30.vpmt(context),
                                                          horizontal: 20.hpmt(context),
                                                        ),
                                                        child: Column(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          children: [
                      
                      
                                                            Container(
                                                              width: 428.wt(context),
                                                              alignment: Alignment.center,
                                                              child: Text(
                                                                "Delete meal".tr,
                                                                textAlign: TextAlign.center,
                                                                style: GoogleFonts.tajawal(
                                                                  fontWeight: FontWeight.w700,
                                                                  fontStyle: FontStyle.normal,
                                                                  fontSize: 18.spt(context),
                                                                  color: ColorUtils.black255,
                                                                  height: (35.ht(context) / 18.spt(context)),
                                                                ),
                                                              ),
                                                            ),
                      
                                                            Container(
                                                              width: 428.wt(context),
                                                              alignment: Alignment.center,
                                                              child: Text(
                                                                "Are you really sure you want to cancel the meal?".tr,
                                                                textAlign: TextAlign.center,
                                                                style: GoogleFonts.tajawal(
                                                                  fontWeight: FontWeight.w500,
                                                                  fontStyle: FontStyle.normal,
                                                                  fontSize: 18.spt(context),
                                                                  color: ColorUtils.black255,
                                                                  height: (35.ht(context) / 16.spt(context)),
                                                                ),
                                                              ),
                                                            ),
                      
                      
                                                            SpacerWidget.spacerWidget(spaceHeight: 20.ht(context)),
                      
                      
                                                            Row(
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                      
                      
                                                                Container(
                                                                  height: 48.ht(context),
                                                                  width: 153.wt(context),
                                                                  decoration: BoxDecoration(
                                                                    color: ColorUtils.blue192,
                                                                    borderRadius: BorderRadius.circular(8.rt(context),),
                                                                  ),
                                                                  child: TextButton(
                                                                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                                                    onPressed: () async {
                                                                      Get.back();
                                                                    },
                                                                    child: Center(
                                                                      child: Text(
                                                                        "Yes".tr,
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
                      
                                                                SpacerWidget.spacerWidget(spaceWidth: 12.wt(context),),
                      
                      
                                                                Container(
                                                                  height: 48.ht(context),
                                                                  width: 153.wt(context),
                                                                  decoration: BoxDecoration(
                                                                    border: Border.all(color: ColorUtils.gray136,width: 1),
                                                                    color: ColorUtils.white255,
                                                                    borderRadius: BorderRadius.circular(8.rt(context),),
                                                                  ),
                                                                  child: TextButton(
                                                                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                                                    onPressed: () async {
                                                                      Get.back();
                                                                    },
                                                                    child: Center(
                                                                      child: Text(
                                                                        "Cancel".tr,
                                                                        textAlign: TextAlign.center,
                                                                        style: GoogleFonts.tajawal(
                                                                          fontWeight: FontWeight.w700,
                                                                          fontStyle: FontStyle.normal,
                                                                          fontSize: 18.spt(context),
                                                                          color: ColorUtils.black51,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                      
                      
                                                              ],
                                                            )
                      
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                              child: FittedBox(
                                                fit: BoxFit.cover,
                                                child: Image.asset(
                                                  ImagePathUtils.crossIconImagePath,
                                                  fit: BoxFit.cover,
                                                  alignment: Alignment.center,
                                                ),
                                              ),
                                            ),
                                          ),
                      
                      
                                          SpacerWidget.spacerWidget(spaceHeight: 54.ht(context)),
                      
                      
                      
                      
                                          Container(
                                            height: 32.ht(context),
                                            width: 90.wt(context),
                                            padding: EdgeInsets.symmetric(horizontal: 8.hpmt(context),vertical: 4.vpmt(context)),
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
                                                      cartList[index].quantity = "${int.parse(cartList.where((e)=>e.index == index).first.quantity) + 1}";
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
                                                    "${cartList[index].quantity} ",
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
                                                    onPressed: cartList[index].quantity == "1" ? null : () {
                                                      cartList[index].quantity = "${int.parse(cartList.where((e)=>e.index == index).first.quantity) - 1}";
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
                                      ),
                      
                      
                                    ],
                                  ),
                                ));
                              },
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
                              color: ColorUtils.white255,
                              border: Border.all(
                                color: ColorUtils.white217,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(12.rt(context)),
                            ),
                            child: Column(
                              children: [
                      
                      
                                Container(
                                  alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                  child: Text(
                                    "Order Details".tr,
                                    textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                    style: GoogleFonts.tajawal(
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 20.spt(context),
                                      color: ColorUtils.black30,
                                    ),
                                  ),
                                ),
                      
                      
                                SpacerWidget.spacerWidget(spaceHeight: 16.ht(context)),
                      
                      
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                      
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Price".tr,
                                        textAlign: TextAlign.start,
                                        style: GoogleFonts.tajawal(
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 18.spt(context),
                                          color: ColorUtils.gray117,
                                        ),
                                      ),
                                    ),
                      
                      
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "7.300 OMR".tr,
                                        textAlign: TextAlign.start,
                                        style:GoogleFonts.tajawal(
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 18.spt(context),
                                          color: ColorUtils.gray117,
                                        ),
                                      ),
                                    ),
                      
                      
                                  ],
                                ),
                      
                                SpacerWidget.spacerWidget(spaceHeight: 12.ht(context)),
                      
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                      
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Delivery fee".tr,
                                        textAlign: TextAlign.start,
                                        style: GoogleFonts.tajawal(
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 18.spt(context),
                                          color: ColorUtils.gray117,
                                        ),
                                      ),
                                    ),
                      
                      
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "1.500 OMR".tr,
                                        textAlign: TextAlign.start,
                                        style:GoogleFonts.tajawal(
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 18.spt(context),
                                          color: ColorUtils.gray117,
                                        ),
                                      ),
                                    ),
                      
                      
                                  ],
                                ),
                      
                      
                                SpacerWidget.spacerWidget(spaceHeight: 10.ht(context)),
                      
                                Container(
                                  height: 1.ht(context),
                                  width: 468.wt(context),
                                  decoration: BoxDecoration(
                                    color: ColorUtils.gray136,
                                  ),
                                ),
                      
                      
                                SpacerWidget.spacerWidget(spaceHeight: 12.ht(context)),
                      
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                      
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Total".tr,
                                        textAlign: TextAlign.start,
                                        style: GoogleFonts.tajawal(
                                          fontWeight: FontWeight.w700,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 18.spt(context),
                                          color: ColorUtils.black51,
                                        ),
                                      ),
                                    ),
                      
                      
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "8.800 OMR".tr,
                                        textAlign: TextAlign.start,
                                        style:GoogleFonts.tajawal(
                                          fontWeight: FontWeight.w700,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 18.spt(context),
                                          color: ColorUtils.black51,
                                        ),
                                      ),
                                    ),
                      
                      
                                  ],
                                ),
                      
                              ],
                            ),
                          ),
                      
                      
                          SpacerWidget.spacerWidget(spaceHeight: 20.ht(context)),
                      
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
                                  "Confirm order".tr,
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
                      
                          SpacerWidget.spacerWidget(spaceHeight: 17.ht(context)),
                          
                        ],
                      ),
                    )
        
        
                   
        
                  ],
                ),
              ),
        
        
            ],
          )),
        ),
      );
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
                      children: [

                        SpacerWidget.spacerWidget(spaceHeight: 20.hm(context)),


                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            "Cart".tr,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.tajawal(
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              fontSize: 16.spm(context),
                              color: ColorUtils.black255,
                            ),
                          ),
                        ),

                        SpacerWidget.spacerWidget(spaceHeight: 32.hm(context)),


                        Container(
                          alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                          child: Text(
                            "Orders ( 5 )".tr,
                            textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                            style: GoogleFonts.tajawal(
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              fontSize: 20.spm(context),
                              color: ColorUtils.black30,
                            ),
                          ),
                        ),


                        SpacerWidget.spacerWidget(spaceHeight: 20.hm(context)),

                        Container(
                          height: 390.hm(context),
                          width: 358.wm(context),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: ListView.builder(
                            itemCount: cartList.length,
                            itemBuilder: (context,int index) {
                              return Obx(()=>Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 9.hpmm(context),
                                  vertical: 9.vpmm(context),
                                ),
                                margin: EdgeInsets.only(
                                  bottom: 12.bpmm(context),
                                ),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(ImagePathUtils.borderIconImagePath),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [

                                    Container(
                                      height: 102.hm(context),
                                      width: 102.wm(context),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12.rm(context)),
                                      ),
                                      child: FittedBox(
                                        fit: BoxFit.fill,
                                        child: Image.asset(
                                          cartList[index].image,
                                          fit: BoxFit.fill,
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                    ),


                                    SpacerWidget.spacerWidget(spaceWidth: 13.wm(context)),

                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [

                                          Container(
                                            alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                            child: Text(
                                              "${cartList[index].name}".tr,
                                              textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                              style: GoogleFonts.tajawal(
                                                fontWeight: FontWeight.w700,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 18.spm(context),
                                                color: ColorUtils.black30,
                                              ),
                                            ),
                                          ),

                                          SpacerWidget.spacerWidget(spaceHeight: 5.hpmm(context)),

                                          Container(
                                            alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                            child: Text(
                                              "${cartList[index].amount}".tr,
                                              textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                              style: GoogleFonts.tajawal(
                                                fontWeight: FontWeight.w500,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 16.spm(context),
                                                color: ColorUtils.black30,
                                              ),
                                            ),
                                          ),

                                          SpacerWidget.spacerWidget(spaceHeight: 5.hpmm(context)),

                                          Container(
                                            alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                            child: Text(
                                              "${cartList[index].size}".tr,
                                              textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                              style: GoogleFonts.tajawal(
                                                fontWeight: FontWeight.w500,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 14.spm(context),
                                                color: ColorUtils.gray163,
                                              ),
                                            ),
                                          ),

                                          SpacerWidget.spacerWidget(spaceHeight: 5.hpmm(context)),

                                          Container(
                                            alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                            child: Text(
                                              "${cartList[index].notes}".tr,
                                              textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                              style: GoogleFonts.tajawal(
                                                fontWeight: FontWeight.w500,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 14.spm(context),
                                                color: ColorUtils.gray163,
                                              ),
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),


                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [


                                        Container(
                                          height: 14.hm(context),
                                          width: 14.wm(context),
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                          ),
                                          child: TextButton(
                                            style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                            onPressed: () {
                                              showAdaptiveDialog(
                                                context: context,
                                                barrierDismissible: true,
                                                builder: (context) {
                                                  return Padding(
                                                    padding: EdgeInsets.symmetric(
                                                      vertical: 271.vpmm(context),
                                                      horizontal: 16.hpmm(context),
                                                    ),
                                                    child: Container(
                                                      width: 358.wm(context),
                                                      height: 283.hm(context),
                                                      decoration: BoxDecoration(
                                                        color: ColorUtils.white255,
                                                        borderRadius: BorderRadius.circular( 16.rm(context)),
                                                      ),
                                                      padding: EdgeInsets.symmetric(
                                                        vertical: 30.vpmm(context),
                                                        horizontal: 20.hpmm(context),
                                                      ),
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children: [


                                                          Container(
                                                            width: 358.wm(context),
                                                            alignment: Alignment.center,
                                                            child: Text(
                                                              "Delete meal".tr,
                                                              textAlign: TextAlign.center,
                                                              style: GoogleFonts.tajawal(
                                                                fontWeight: FontWeight.w700,
                                                                fontStyle: FontStyle.normal,
                                                                fontSize: 18.spm(context),
                                                                color: ColorUtils.black255,
                                                                height: (35.hm(context) / 18.spm(context)),
                                                              ),
                                                            ),
                                                          ),

                                                          Container(
                                                            width: 358.wm(context),
                                                            alignment: Alignment.center,
                                                            child: Text(
                                                              "Are you really sure you want to cancel the meal?".tr,
                                                              textAlign: TextAlign.center,
                                                              style: GoogleFonts.tajawal(
                                                                fontWeight: FontWeight.w500,
                                                                fontStyle: FontStyle.normal,
                                                                fontSize: 18.spm(context),
                                                                color: ColorUtils.black255,
                                                                height: (35.hm(context) / 16.spm(context)),
                                                              ),
                                                            ),
                                                          ),


                                                          SpacerWidget.spacerWidget(spaceHeight: 20.hm(context)),


                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [


                                                              Container(
                                                                height: 48.hm(context),
                                                                width: 153.wm(context),
                                                                decoration: BoxDecoration(
                                                                  color: ColorUtils.blue192,
                                                                  borderRadius: BorderRadius.circular(8.rm(context),),
                                                                ),
                                                                child: TextButton(
                                                                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                                                  onPressed: () async {
                                                                    Get.back();
                                                                  },
                                                                  child: Center(
                                                                    child: Text(
                                                                      "Yes".tr,
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

                                                              SpacerWidget.spacerWidget(spaceWidth: 12.wm(context),),


                                                              Container(
                                                                height: 48.hm(context),
                                                                width: 153.wm(context),
                                                                decoration: BoxDecoration(
                                                                  border: Border.all(color: ColorUtils.gray136,width: 1),
                                                                  color: ColorUtils.white255,
                                                                  borderRadius: BorderRadius.circular(8.rm(context),),
                                                                ),
                                                                child: TextButton(
                                                                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                                                  onPressed: () async {
                                                                    Get.back();
                                                                  },
                                                                  child: Center(
                                                                    child: Text(
                                                                      "Cancel".tr,
                                                                      textAlign: TextAlign.center,
                                                                      style: GoogleFonts.tajawal(
                                                                        fontWeight: FontWeight.w700,
                                                                        fontStyle: FontStyle.normal,
                                                                        fontSize: 18.spm(context),
                                                                        color: ColorUtils.black51,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),


                                                            ],
                                                          )

                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                            child: FittedBox(
                                              fit: BoxFit.cover,
                                              child: Image.asset(
                                                ImagePathUtils.crossIconImagePath,
                                                fit: BoxFit.cover,
                                                alignment: Alignment.center,
                                              ),
                                            ),
                                          ),
                                        ),


                                        SpacerWidget.spacerWidget(spaceHeight: 54.hm(context)),




                                        Container(
                                          height: 32.hm(context),
                                          width: 90.wm(context),
                                          padding: EdgeInsets.symmetric(horizontal: 8.hpmm(context),vertical: 4.vpmm(context)),
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
                                                    cartList[index].quantity = "${int.parse(cartList.where((e)=>e.index == index).first.quantity) + 1}";
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
                                                  "${cartList[index].quantity} ",
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
                                                  onPressed: cartList[index].quantity == "1" ? null : () {
                                                    cartList[index].quantity = "${int.parse(cartList.where((e)=>e.index == index).first.quantity) - 1}";
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
                                    ),


                                  ],
                                ),
                              ));
                            },
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
                            color: ColorUtils.white255,
                            border: Border.all(
                              color: ColorUtils.white217,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(12.rm(context)),
                          ),
                          child: Column(
                            children: [


                              Container(
                                alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                child: Text(
                                  "Order Details".tr,
                                  textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                  style: GoogleFonts.tajawal(
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 20.spm(context),
                                    color: ColorUtils.black30,
                                  ),
                                ),
                              ),


                              SpacerWidget.spacerWidget(spaceHeight: 16.hm(context)),


                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Price".tr,
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.tajawal(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 18.spm(context),
                                        color: ColorUtils.gray117,
                                      ),
                                    ),
                                  ),


                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "7.300 OMR".tr,
                                      textAlign: TextAlign.start,
                                      style:GoogleFonts.tajawal(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 18.spm(context),
                                        color: ColorUtils.gray117,
                                      ),
                                    ),
                                  ),


                                ],
                              ),

                              SpacerWidget.spacerWidget(spaceHeight: 12.hm(context)),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Delivery fee".tr,
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.tajawal(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 18.spm(context),
                                        color: ColorUtils.gray117,
                                      ),
                                    ),
                                  ),


                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "1.500 OMR".tr,
                                      textAlign: TextAlign.start,
                                      style:GoogleFonts.tajawal(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 18.spm(context),
                                        color: ColorUtils.gray117,
                                      ),
                                    ),
                                  ),


                                ],
                              ),


                              SpacerWidget.spacerWidget(spaceHeight: 10.hm(context)),

                              Container(
                                height: 1.hm(context),
                                width: 390.wm(context),
                                decoration: BoxDecoration(
                                  color: ColorUtils.gray136,
                                ),
                              ),


                              SpacerWidget.spacerWidget(spaceHeight: 12.hm(context)),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Total".tr,
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.tajawal(
                                        fontWeight: FontWeight.w700,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 18.spm(context),
                                        color: ColorUtils.black51,
                                      ),
                                    ),
                                  ),


                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "8.800 OMR".tr,
                                      textAlign: TextAlign.start,
                                      style:GoogleFonts.tajawal(
                                        fontWeight: FontWeight.w700,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 18.spm(context),
                                        color: ColorUtils.black51,
                                      ),
                                    ),
                                  ),


                                ],
                              ),

                            ],
                          ),
                        ),


                        SpacerWidget.spacerWidget(spaceHeight: 20.hm(context)),

                        Container(
                          height: 48.hm(context),
                          width: 358.wm(context),
                          decoration: BoxDecoration(
                            color: ColorUtils.blue192,
                            borderRadius: BorderRadius.circular(8.rm(context)),
                          ),
                          child: TextButton(
                            style: TextButton.styleFrom(padding: EdgeInsets.zero),
                            onPressed: () async {
                              Get.off(()=>OrderAddressScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                            },
                            child: Center(
                              child: Text(
                                "Confirm order".tr,
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

                        SpacerWidget.spacerWidget(spaceHeight: 17.hm(context)),

                      ],
                    ),
                  ),
                ),


              ],
            )
        )),
      );
    }
  }



}


class CartList {
  int index;
  String name;
  String amount;
  String size;
  String notes;
  String quantity;
  String image;

  CartList({
    required this.index,
    required this.name,
    required this.amount,
    required this.size,
    required this.notes,
    required this.quantity,
    required this.image,
  });

}