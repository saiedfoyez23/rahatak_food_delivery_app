import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rahatak_food_delivery_app/utils/utils.dart';
import 'package:rahatak_food_delivery_app/widget/widget.dart';

import '../screen/screen.dart';

class PaymentScreenWidget extends GetxController {

  RxBool isProductListShow = false.obs;
  RxBool isVisaOrMastercard = false.obs;
  RxBool isCash = false.obs;
  RxBool isCheckIn = false.obs;

  Rx<TextEditingController> cardNameController = TextEditingController().obs;
  Rx<TextEditingController> cardNumberController = TextEditingController().obs;
  Rx<TextEditingController> expiryDateController = TextEditingController().obs;
  Rx<TextEditingController> cvvController = TextEditingController().obs;

  Rx<TextEditingController> otp1 = TextEditingController().obs;
  Rx<TextEditingController> otp2 = TextEditingController().obs;
  Rx<TextEditingController> otp3 = TextEditingController().obs;
  Rx<TextEditingController> otp4 = TextEditingController().obs;
  Rx<TextEditingController> otp5 = TextEditingController().obs;
  Rx<TextEditingController> otp6 = TextEditingController().obs;



  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<TextEditingController> phoneNumberController = TextEditingController().obs;
  Rx<TextEditingController> governorateController = TextEditingController().obs;
  Rx<TextEditingController> stateController = TextEditingController().obs;
  Rx<TextEditingController> cityController = TextEditingController().obs;

  RxInt timeCounter = 60.obs;

  RxList<CartList> cartList = <CartList>[
    CartList(index: 0,name: "Tanoor", amount: "1900 OMR", size: "Size: Medium", notes: "Notes: Spicy", quantity: "Quantity 2", image: ImagePathUtils.pList_3),
    CartList(index: 1,name: "Chicken Fries", amount: "1500 OMR", size: "Size: Large", notes: "Notes: Spicy", quantity: "Quantity 2", image: ImagePathUtils.pList_1),
    CartList(index: 2,name: "Classic Burger", amount: "1200 OMR", size: "Size: Small", notes: "Notes: Spicy", quantity: "Quantity 2", image: ImagePathUtils.productImage_4),
  ].obs;


  Future<void> otpTimer() async {
    Future.delayed(Duration(seconds: 1), () async {
      if(timeCounter > 0) {
        timeCounter.value = timeCounter.value - 1;
        otpTimer();
      } else {
        timeCounter.value = 0;
      }
    });
  }

  Widget paymentScreenWidget({required BuildContext context}) {
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          SpacerWidget.spacerWidget(spaceHeight: 11.ht(context),),

                          Directionality(
                            textDirection: TextDirection.ltr,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 37.hpmt(context)),
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
                                        Get.delete<PaymentScreenWidget>(force: true);
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
                                        "Payment".tr,
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
                                  height: 56.ht(context),
                                  width: 468.wt(context),
                                  decoration: BoxDecoration(
                                    border: isCash.value == false  ?
                                    Border.all(color: ColorUtils.white217,width: 1) :
                                    Border.all(color: ColorUtils.blue192,width: 1),
                                    borderRadius: BorderRadius.circular(10.rt(context)),
                                  ),
                                  padding: EdgeInsets.symmetric(vertical: 12.vpmt(context),horizontal: 12.hpmt(context)),
                                  child: TextButton(
                                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                    onPressed: () async {
                                      if(isCash.value == true) {
                                        isProductListShow.value = false;
                                        isVisaOrMastercard.value = false;
                                        isCash.value = false;
                                      } else {
                                        isProductListShow.value = false;
                                        isVisaOrMastercard.value = false;
                                        isCash.value = true;
                                      }
                                    },
                                    child: Row(
                                      children: [
                            
                            
                                        Container(
                                          height: 30.ht(context),
                                          width: 30.wt(context),
                                          decoration: BoxDecoration(
                                            border:  isCash.value  == false  ?
                                            Border.all(color: ColorUtils.white217,width: 1) :
                                            Border.all(color: ColorUtils.blue192,width: 1),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Center(
                                            child: Container(
                                              height: 16.ht(context),
                                              width: 16.wt(context),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color:  isCash.value == false ?
                                                  Colors.transparent : ColorUtils.blue192
                                              ),
                                            ),
                                          ),
                                        ),
                            
                                        SpacerWidget.spacerWidget(spaceWidth: 12.wt(context)),
                            
                                        Expanded(
                                          child: Container(
                                            alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                            child: Text(
                                              "Cash".tr,
                                              textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                              style: GoogleFonts.tajawal(
                                                fontWeight: FontWeight.w700,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 18.spt(context),
                                                color: ColorUtils.black30,
                                              ),
                                            ),
                                          ),
                                        ),
                            
                                      ],
                                    ),
                                  ),
                                ),
                            
                                SpacerWidget.spacerWidget(spaceHeight: 16.ht(context),),
                            
                            
                                isCash.value == true ?
                                Column(
                                  children: [
                            
                                    SpacerWidget.spacerWidget(spaceHeight: 12.ht(context),),
                                    Container(
                                      alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                      child: Text(
                                        "Name*".tr,
                                        textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                        style: GoogleFonts.tajawal(
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 16.spm(context),
                                          color: ColorUtils.black255,
                                        ),
                                      ),
                                    ),
                            
                                    SpacerWidget.spacerWidget(spaceHeight: 12.ht(context),),
                            
                            
                                    TextFormField(
                                      controller: nameController.value,
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
                                        hintText: "Enter your name".tr,
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
                            
                                    SpacerWidget.spacerWidget(spaceHeight: 12.ht(context),),
                            
                            
                                    Container(
                                      alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                      child: Text(
                                        "Phone Number *".tr,
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
                                      controller: phoneNumberController.value,
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
                                        hintText: "+88017XXXXXXXX".tr,
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
                            
                            
                                    Container(
                                      alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                      child: Text(
                                        "Governorate *".tr,
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
                                        hintText: "Muscat".tr,
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
                                                "State".tr,
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
                                                hintText: "Al Khoud".tr,
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
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "City".tr,
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
                                                hintText: "Al Khoud".tr,
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
                            
                            
                                    SpacerWidget.spacerWidget(spaceHeight: 12.ht(context),),
                            
                            
                                    Container(
                                      height: 20.ht(context),
                                      width: 464.wt(context),
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                      ),
                                      child: FittedBox(
                                        fit: BoxFit.fill,
                                        child: Image.asset(
                                          ImagePathUtils.dotBorderIconImagePath,
                                          fit: BoxFit.fill,
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                    ),
                            
                                    SpacerWidget.spacerWidget(spaceHeight: 12.hm(context),),
                            
                            
                                  ],
                                ) :
                                SpacerWidget.spacerWidget(),
                            
                            
                                Container(
                                  height: 56.ht(context),
                                  width: 468.wt(context),
                                  decoration: BoxDecoration(
                                    border: isVisaOrMastercard.value == false  ?
                                    Border.all(color: ColorUtils.white217,width: 1) :
                                    Border.all(color: ColorUtils.blue192,width: 1),
                                    borderRadius: BorderRadius.circular(10.rt(context)),
                                  ),
                                  padding: EdgeInsets.symmetric(vertical: 12.vpmt(context),horizontal: 12.hpmt(context)),
                                  child: TextButton(
                                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                    onPressed: () async {
                                      if(isVisaOrMastercard.value == true) {
                                        isProductListShow.value = false;
                                        isVisaOrMastercard.value = false;
                                        isCash.value = false;
                                      } else {
                                        isProductListShow.value = false;
                                        isVisaOrMastercard.value = true;
                                        isCash.value = false;
                                      }
                                    },
                                    child: Row(
                                      children: [
                            
                            
                                        Container(
                                          height: 30.ht(context),
                                          width: 30.wt(context),
                                          decoration: BoxDecoration(
                                            border: isVisaOrMastercard.value == false  ?
                                            Border.all(color: ColorUtils.white217,width: 1) :
                                            Border.all(color: ColorUtils.blue192,width: 1),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Center(
                                            child: Container(
                                              height: 16.ht(context),
                                              width: 16.wt(context),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: isVisaOrMastercard.value == false ?
                                                  Colors.transparent : ColorUtils.blue192
                                              ),
                                            ),
                                          ),
                                        ),
                            
                                        SpacerWidget.spacerWidget(spaceWidth: 12.wt(context)),
                            
                                        Expanded(
                                          child: Container(
                                            alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                            child: Text(
                                              "Mastercard / Visa".tr,
                                              textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                              style: GoogleFonts.tajawal(
                                                fontWeight: FontWeight.w700,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 18.spt(context),
                                                color: ColorUtils.black30,
                                              ),
                                            ),
                                          ),
                                        ),
                            
                            
                                        Container(
                                          height: 30.ht(context),
                                          width: 45.wt(context),
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                          ),
                                          child: FittedBox(
                                            fit: BoxFit.cover,
                                            child: Image.asset(
                                              ImagePathUtils.mastercardIconImagePath,
                                              fit: BoxFit.cover,
                                              alignment: Alignment.center,
                                            ),
                                          ),
                                        ),
                            
                                        SpacerWidget.spacerWidget(spaceWidth: 12.wt(context)),
                            
                            
                                        Container(
                                          height: 18.ht(context),
                                          width: 56.wt(context),
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                          ),
                                          child: FittedBox(
                                            fit: BoxFit.cover,
                                            child: Image.asset(
                                              ImagePathUtils.visaIconImagePath,
                                              fit: BoxFit.cover,
                                              alignment: Alignment.center,
                                            ),
                                          ),
                                        ),
                            
                            
                            
                            
                            
                                      ],
                                    ),
                                  ),
                                ),
                            
                            
                                isVisaOrMastercard.value == true ?
                                Column(
                                  children: [
                            
                                    SpacerWidget.spacerWidget(spaceHeight: 12.ht(context),),
                            
                                    Container(
                                      alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                      child: Text(
                                        "Name on card *".tr,
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
                                      controller: cardNameController.value,
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
                                        hintText: "Enter card name".tr,
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
                            
                                    SpacerWidget.spacerWidget(spaceHeight: 12.ht(context),),
                            
                            
                                    Container(
                                      alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                      child: Text(
                                        "Card Number *".tr,
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
                                      controller: cardNumberController.value,
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
                                        hintText: "0000 0000 0000 0000".tr,
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
                                                "Expiry date * ".tr,
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
                                              controller: expiryDateController.value,
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
                                                hintText: "00/00".tr,
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
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "CVV *".tr,
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
                                              controller: cvvController.value,
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
                                                hintText: "000".tr,
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
                            
                            
                                    SpacerWidget.spacerWidget(spaceHeight: 12.ht(context),),
                            
                            
                                    Container(
                                      height: 25.ht(context),
                                      width: 468.wt(context),
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                      ),
                                      alignment: Alignment.center,
                                      child: TextButton(
                                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                        onPressed: () async {
                                          if(isCheckIn.value == true) {
                                            isCheckIn.value = false;
                                          } else {
                                            isCheckIn.value = true;
                                            timeCounter.value = 60;
                                            otp1.value.clear();
                                            otp2.value.clear();
                                            otp3.value.clear();
                                            otp4.value.clear();
                                            otp5.value.clear();
                                            otp6.value.clear();
                                            await otpTimer();


                                            showAdaptiveDialog(
                                              context: context,
                                              barrierDismissible: true,
                                              builder: (context) {
                                                return Obx(()=>Padding(
                                                  padding: EdgeInsets.symmetric(
                                                    vertical: 330.vpmt(context),
                                                    horizontal: 158.hpmt(context),
                                                  ),
                                                  child: Container(
                                                    width: 428.wt(context),
                                                    height: 396.ht(context),
                                                    decoration: BoxDecoration(
                                                      color: ColorUtils.white255,
                                                      borderRadius: BorderRadius.circular(16.rt(context)),
                                                    ),
                                                    padding: EdgeInsets.symmetric(
                                                      vertical: 30.vpmt(context),
                                                      horizontal: 20.hpmt(context),
                                                    ),
                                                    child: Material(
                                                      color: Colors.transparent,
                                                      shadowColor: Colors.transparent,
                                                      surfaceTintColor: Colors.transparent,
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children: [
                            
                            
                                                          Container(
                                                            width: 428.wt(context),
                                                            alignment: Alignment.center,
                                                            child: Text(
                                                              "Verify Your Identity".tr,
                                                              textAlign: TextAlign.center,
                                                              style: GoogleFonts.tajawal(
                                                                fontWeight: FontWeight.w700,
                                                                fontStyle: FontStyle.normal,
                                                                fontSize: 24.spt(context),
                                                                color: ColorUtils.black33,
                                                                height: (35.ht(context) / 24.spt(context)),
                                                              ),
                                                            ),
                                                          ),
                            
                            
                            
                                                          Container(
                                                            width: 428.wt(context),
                                                            alignment: Alignment.center,
                                                            child: Text(
                                                              "We have sent a 6-digit verification code to your registered phone number. Please enter the code below to complete your payment.".tr,
                                                              textAlign: TextAlign.center,
                                                              style: GoogleFonts.tajawal(
                                                                fontWeight: FontWeight.w500,
                                                                fontStyle: FontStyle.normal,
                                                                fontSize: 18.spt(context),
                                                                color: ColorUtils.black33,
                                                                height: (35.ht(context) / 18.spt(context)),
                                                              ),
                                                            ),
                                                          ),
                            
                            
                            
                            
                            
                                                          SpacerWidget.spacerWidget(spaceHeight: 18.ht(context)),
                            
                            
                            
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [
                            
                                                              TextFormField(
                                                                controller: otp1.value,
                                                                textAlign: TextAlign.center,
                                                                keyboardType: TextInputType.number,
                                                                cursorColor: ColorUtils.blue192,
                                                                cursorHeight: 20.ht(context),
                                                                style: GoogleFonts.tajawal(
                                                                  fontSize: 20.spt(context),
                                                                  fontStyle: FontStyle.normal,
                                                                  color: ColorUtils.black51,
                                                                  fontWeight: FontWeight.w700,
                                                                ),
                                                                onChanged: (pin) {
                                                                  if (pin.isNotEmpty) {
                                                                    FocusScope.of(context).nextFocus();
                                                                  }
                                                                },
                                                                textAlignVertical: TextAlignVertical.center,
                                                                decoration: InputDecoration(
                                                                  filled: true,
                                                                  fillColor: ColorUtils.white255,
                                                                  contentPadding: EdgeInsets.symmetric(
                                                                    horizontal: 12.hpmt(context),
                                                                    vertical: 12.vpmt(context),
                                                                  ),
                                                                  constraints: BoxConstraints(
                                                                    maxWidth: 40.wt(context),
                                                                    maxHeight: 50.ht(context),
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
                                                              SpacerWidget.spacerWidget(spaceWidth: 6.wt(context)),
                                                              TextFormField(
                                                                controller: otp2.value,
                                                                textAlign: TextAlign.center,
                                                                keyboardType: TextInputType.number,
                                                                cursorColor: ColorUtils.blue192,
                                                                cursorHeight: 20.ht(context),
                                                                style: GoogleFonts.tajawal(
                                                                  fontSize: 20.spt(context),
                                                                  fontStyle: FontStyle.normal,
                                                                  color: ColorUtils.black51,
                                                                  fontWeight: FontWeight.w700,
                                                                ),
                                                                onChanged: (pin) {
                                                                  if (pin.isNotEmpty) {
                                                                    FocusScope.of(context).nextFocus();
                                                                  }
                                                                },
                                                                textAlignVertical: TextAlignVertical.center,
                                                                decoration: InputDecoration(
                                                                  filled: true,
                                                                  fillColor: ColorUtils.white255,
                                                                  contentPadding: EdgeInsets.symmetric(
                                                                    horizontal: 12.hpmt(context),
                                                                    vertical: 12.vpmt(context),
                                                                  ),
                                                                  constraints: BoxConstraints(
                                                                    maxWidth: 40.wt(context),
                                                                    maxHeight: 50.ht(context),
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
                                                              SpacerWidget.spacerWidget(spaceWidth: 6.wt(context)),
                                                              TextFormField(
                                                                controller: otp3.value,
                                                                textAlign: TextAlign.center,
                                                                keyboardType: TextInputType.number,
                                                                cursorColor: ColorUtils.blue192,
                                                                cursorHeight: 20.ht(context),
                                                                style: GoogleFonts.tajawal(
                                                                  fontSize: 20.spt(context),
                                                                  fontStyle: FontStyle.normal,
                                                                  color: ColorUtils.black51,
                                                                  fontWeight: FontWeight.w700,
                                                                ),
                                                                onChanged: (pin) {
                                                                  if (pin.isNotEmpty) {
                                                                    FocusScope.of(context).nextFocus();
                                                                  }
                                                                },
                                                                textAlignVertical: TextAlignVertical.center,
                                                                decoration: InputDecoration(
                                                                  filled: true,
                                                                  fillColor: ColorUtils.white255,
                                                                  contentPadding: EdgeInsets.symmetric(
                                                                    horizontal: 12.hpmt(context),
                                                                    vertical: 12.vpmt(context),
                                                                  ),
                                                                  constraints: BoxConstraints(
                                                                    maxWidth: 40.wt(context),
                                                                    maxHeight: 50.ht(context),
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
                                                              SpacerWidget.spacerWidget(spaceWidth: 6.wt(context)),
                                                              TextFormField(
                                                                controller: otp4.value,
                                                                textAlign: TextAlign.center,
                                                                keyboardType: TextInputType.number,
                                                                cursorColor: ColorUtils.blue192,
                                                                cursorHeight: 20.ht(context),
                                                                style: GoogleFonts.tajawal(
                                                                  fontSize: 20.spt(context),
                                                                  fontStyle: FontStyle.normal,
                                                                  color: ColorUtils.black51,
                                                                  fontWeight: FontWeight.w700,
                                                                ),
                                                                onChanged: (pin) {
                                                                  if (pin.isNotEmpty) {
                                                                    FocusScope.of(context).nextFocus();
                                                                  }
                                                                },
                                                                textAlignVertical: TextAlignVertical.center,
                                                                decoration: InputDecoration(
                                                                  filled: true,
                                                                  fillColor: ColorUtils.white255,
                                                                  contentPadding: EdgeInsets.symmetric(
                                                                    horizontal: 12.hpmt(context),
                                                                    vertical: 12.vpmt(context),
                                                                  ),
                                                                  constraints: BoxConstraints(
                                                                    maxWidth: 40.wt(context),
                                                                    maxHeight: 50.ht(context),
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
                                                              SpacerWidget.spacerWidget(spaceWidth: 6.wt(context)),
                                                              TextFormField(
                                                                controller: otp5.value,
                                                                textAlign: TextAlign.center,
                                                                keyboardType: TextInputType.number,
                                                                cursorColor: ColorUtils.blue192,
                                                                cursorHeight: 20.ht(context),
                                                                style: GoogleFonts.tajawal(
                                                                  fontSize: 20.spt(context),
                                                                  fontStyle: FontStyle.normal,
                                                                  color: ColorUtils.black51,
                                                                  fontWeight: FontWeight.w700,
                                                                ),
                                                                onChanged: (pin) {
                                                                  if (pin.isNotEmpty) {
                                                                    FocusScope.of(context).nextFocus();
                                                                  }
                                                                },
                                                                textAlignVertical: TextAlignVertical.center,
                                                                decoration: InputDecoration(
                                                                  filled: true,
                                                                  fillColor: ColorUtils.white255,
                                                                  contentPadding: EdgeInsets.symmetric(
                                                                    horizontal: 12.hpmt(context),
                                                                    vertical: 12.vpmt(context),
                                                                  ),
                                                                  constraints: BoxConstraints(
                                                                    maxWidth: 40.wt(context),
                                                                    maxHeight: 50.ht(context),
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
                                                              SpacerWidget.spacerWidget(spaceWidth: 6.wt(context)),
                                                              TextFormField(
                                                                controller: otp6.value,
                                                                textAlign: TextAlign.center,
                                                                keyboardType: TextInputType.number,
                                                                cursorColor: ColorUtils.blue192,
                                                                cursorHeight: 20.ht(context),
                                                                style: GoogleFonts.tajawal(
                                                                  fontSize: 20.spt(context),
                                                                  fontStyle: FontStyle.normal,
                                                                  color: ColorUtils.black51,
                                                                  fontWeight: FontWeight.w700,
                                                                ),
                                                                onChanged: (pin) {
                                                                  if (pin.isNotEmpty) {
                                                                    FocusScope.of(context).nextFocus();
                                                                  }
                                                                },
                                                                textAlignVertical: TextAlignVertical.center,
                                                                decoration: InputDecoration(
                                                                  filled: true,
                                                                  fillColor: ColorUtils.white255,
                                                                  contentPadding: EdgeInsets.symmetric(
                                                                    horizontal: 12.hpmt(context),
                                                                    vertical: 12.vpmt(context),
                                                                  ),
                                                                  constraints: BoxConstraints(
                                                                    maxWidth: 40.wt(context),
                                                                    maxHeight: 50.ht(context),
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
                            
                            
                                                          SpacerWidget.spacerWidget(spaceHeight: 18.ht(context)),
                            
                            
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
                                                                Get.back();
                                                                showAdaptiveDialog(
                                                                  context: context,
                                                                  barrierDismissible: true,
                                                                  builder: (context) {
                                                                    return Padding(
                                                                      padding: EdgeInsets.symmetric(
                                                                        vertical: 350.vpmt(context),
                                                                        horizontal: 158.hpmt(context),
                                                                      ),
                                                                      child: Container(
                                                                        width: 428.wt(context),
                                                                        height: 335.ht(context),
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
                                                                              height: 64.ht(context),
                                                                              width: 64.wt(context),
                                                                              decoration: BoxDecoration(
                                                                                  color: Colors.transparent
                                                                              ),
                                                                              child: FittedBox(
                                                                                fit: BoxFit.cover,
                                                                                child: Image.asset(
                                                                                  ImagePathUtils.signUpScreenImagePath,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                            ),
                            
                            
                                                                            SpacerWidget.spacerWidget(spaceHeight: 18.ht(context)),
                            
                            
                                                                            Container(
                                                                              width: 428.wt(context),
                                                                              alignment: Alignment.center,
                                                                              child: Text(
                                                                                "Payment successful!".tr,
                                                                                textAlign: TextAlign.center,
                                                                                style: GoogleFonts.tajawal(
                                                                                  fontWeight: FontWeight.w700,
                                                                                  fontStyle: FontStyle.normal,
                                                                                  fontSize: 18.spt(context),
                                                                                  color: ColorUtils.black33,
                                                                                  height: (35.ht(context) / 18.spt(context)),
                                                                                ),
                                                                              ),
                                                                            ),
                            
                                                                            Container(
                                                                              width: 428.wt(context),
                                                                              alignment: Alignment.center,
                                                                              child: Text(
                                                                                "Thank you! Your payment has been confirmed and your order has been successfully submitted.".tr,
                                                                                textAlign: TextAlign.center,
                                                                                style: GoogleFonts.tajawal(
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FontStyle.normal,
                                                                                  fontSize: 18.spt(context),
                                                                                  color: ColorUtils.black33,
                                                                                  height: (35.ht(context) / 18.spt(context)),
                                                                                ),
                                                                              ),
                                                                            ),
                            
                                                                            Container(
                                                                              width: 428.wt(context),
                                                                              alignment: Alignment.center,
                                                                              child: Text(
                                                                                "Order number: #123456".tr,
                                                                                textAlign: TextAlign.center,
                                                                                style: GoogleFonts.tajawal(
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FontStyle.normal,
                                                                                  fontSize: 18.spt(context),
                                                                                  color: ColorUtils.black33,
                                                                                  height: (35.ht(context) / 18.spt(context)),
                                                                                ),
                                                                              ),
                                                                            ),
                            
                            
                                                                            SpacerWidget.spacerWidget(spaceHeight: 18.ht(context)),
                            
                            
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
                                                                                  Get.delete<PaymentScreenWidget>(force: true);
                                                                                  Get.off(()=>OrderTrackScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                                                                                },
                                                                                child: Center(
                                                                                  child: Text(
                                                                                    "Complete payment".tr,
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
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                              },
                                                              child: Center(
                                                                child: Text(
                                                                  "Complete payment".tr,
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
                            
                                                          SpacerWidget.spacerWidget(spaceHeight: 18.ht(context)),
                            
                            
                                                          Container(
                                                            width: 428.wt(context),
                                                            alignment: Alignment.center,
                                                            child: Text(
                                                              "Didn't receive the code?".tr,
                                                              textAlign: TextAlign.center,
                                                              style: GoogleFonts.tajawal(
                                                                fontWeight: FontWeight.w700,
                                                                fontStyle: FontStyle.normal,
                                                                fontSize: 14.spm(context),
                                                                color: ColorUtils.black33,
                                                                height: (25.hm(context) / 14.spm(context)),
                                                              ),
                                                            ),
                                                          ),
                            
                            
                                                          timeCounter.value == 0 ?
                                                          Container(
                                                            height: 20.ht(context),
                                                            width: 428.wt(context),
                                                            alignment: Alignment.center,
                                                            child: TextButton(
                                                              style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                                              onPressed: () async {
                                                                Get.back();
                                                                showAdaptiveDialog(
                                                                  context: context,
                                                                  barrierDismissible: true,
                                                                  builder: (context) {
                                                                    return Padding(
                                                                      padding: EdgeInsets.symmetric(
                                                                        vertical: 350.vpmt(context),
                                                                        horizontal: 158.hpmt(context),
                                                                      ),
                                                                      child: Container(
                                                                        width: 428.wt(context),
                                                                        height: 317.ht(context),
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
                                                                              height: 64.ht(context),
                                                                              width: 64.wt(context),
                                                                              decoration: BoxDecoration(
                                                                                  color: Colors.transparent
                                                                              ),
                                                                              child: FittedBox(
                                                                                fit: BoxFit.cover,
                                                                                child: Image.asset(
                                                                                  ImagePathUtils.errorIconImagePath,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                            ),
                            
                            
                                                                            SpacerWidget.spacerWidget(spaceHeight: 18.ht(context)),
                            
                            
                                                                            Container(
                                                                              width: 428.wt(context),
                                                                              alignment: Alignment.center,
                                                                              child: Text(
                                                                                "Sorry, your payment was not completed!".tr,
                                                                                textAlign: TextAlign.center,
                                                                                style: GoogleFonts.tajawal(
                                                                                  fontWeight: FontWeight.w700,
                                                                                  fontStyle: FontStyle.normal,
                                                                                  fontSize: 18.spt(context),
                                                                                  color: ColorUtils.black33,
                                                                                  height: (35.ht(context) / 18.spt(context)),
                                                                                ),
                                                                              ),
                                                                            ),
                            
                                                                            Container(
                                                                              width: 358.wt(context),
                                                                              alignment: Alignment.center,
                                                                              child: Text(
                                                                                "There was a problem processing your payment. Please check your details and try again.".tr,
                                                                                textAlign: TextAlign.center,
                                                                                style: GoogleFonts.tajawal(
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FontStyle.normal,
                                                                                  fontSize: 18.spt(context),
                                                                                  color: ColorUtils.black33,
                                                                                  height: (35.ht(context) / 18.spt(context)),
                                                                                ),
                                                                              ),
                                                                            ),
                            
                            
                                                                            SpacerWidget.spacerWidget(spaceHeight: 18.ht(context)),
                            
                            
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
                                                                                  Get.delete<PaymentScreenWidget>(force: true);
                                                                                  Get.off(()=>PaymentScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                                                                                },
                                                                                child: Center(
                                                                                  child: Text(
                                                                                    "Try Again".tr,
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
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                              },
                                                              child: Text(
                                                                "Resend Otp".tr,
                                                                textAlign: TextAlign.center,
                                                                style: GoogleFonts.tajawal(
                                                                  fontWeight: FontWeight.w500,
                                                                  fontStyle: FontStyle.normal,
                                                                  fontSize: 14.spt(context),
                                                                  color: ColorUtils.blue192,
                                                                  height: (25.ht(context) / 14.spt(context)),
                                                                ),
                                                              ),
                                                            ),
                                                          ) :
                                                          Container(
                                                            width: 430.wt(context),
                                                            alignment: Alignment.center,
                                                            child: Row(
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                Text(
                                                                  "Resend after".tr,
                                                                  textAlign: TextAlign.center,
                                                                  style: GoogleFonts.tajawal(
                                                                    fontWeight: FontWeight.w500,
                                                                    fontStyle: FontStyle.normal,
                                                                    fontSize: 14.spt(context),
                                                                    color: ColorUtils.black33,
                                                                    height: (25.ht(context) / 14.spt(context)),
                                                                  ),
                                                                ),
                                                                Text(
                                                                  " (${timeCounter.value}s)",
                                                                  textAlign: TextAlign.center,
                                                                  style: GoogleFonts.tajawal(
                                                                    fontWeight: FontWeight.w500,
                                                                    fontStyle: FontStyle.normal,
                                                                    fontSize: 14.spt(context),
                                                                    color: ColorUtils.black33,
                                                                    height: (25.ht(context) / 14.spt(context)),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                            
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ));
                                              },
                                            );
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
                                                text: "Save card details for quick payment later".tr,
                                                style: GoogleFonts.tajawal(
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 14.spt(context),
                                                  color: ColorUtils.black33,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                children: [],
                                              ),
                                            ),
                            
                            
                                          ],
                                        ),
                                      ),
                                    ),
                            
                                    Container(
                                      height: 20.ht(context),
                                      width: 390.wt(context),
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                      ),
                                      child: FittedBox(
                                        fit: BoxFit.fill,
                                        child: Image.asset(
                                          ImagePathUtils.dotBorderIconImagePath,
                                          fit: BoxFit.fill,
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                    ),
                            
                                    SpacerWidget.spacerWidget(spaceHeight: 12.ht(context),),
                            
                            
                                  ],
                                ) :
                                SpacerWidget.spacerWidget(),
                            
                            
                                SpacerWidget.spacerWidget(spaceHeight: 32.ht(context),),
                            
                            
                            
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
                            
                                      SpacerWidget.spacerWidget(spaceHeight: 12.ht(context)),
                            
                            
                                      Container(
                                        height: 1.ht(context),
                                        width: 468.wt(context),
                                        decoration: BoxDecoration(
                                          color: ColorUtils.gray136,
                                        ),
                                      ),
                            
                            
                            
                                      SpacerWidget.spacerWidget(spaceHeight: 12.ht(context)),
                            
                            
                                      Container(
                                        height: 37.ht(context),
                                        width: 468.wt(context),
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                        ),
                                        child: TextButton(
                                          style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                          onPressed: () async {
                                            if( isProductListShow.value == false) {
                                              isProductListShow.value = true;
                                              isVisaOrMastercard.value = false;
                                              isCash.value = false;
                                            } else {
                                              isProductListShow.value = false;
                                              isVisaOrMastercard.value = false;
                                              isCash.value = false;
                                            }
                                          },
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                            
                                              Container(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  isProductListShow.value == true ? "See Order details".tr : "Order details".tr,
                                                  textAlign: TextAlign.start,
                                                  style: GoogleFonts.tajawal(
                                                    fontWeight: FontWeight.w700,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 14.spt(context),
                                                    color: ColorUtils.blue192,
                                                  ),
                                                ),
                                              ),
                            
                                              SpacerWidget.spacerWidget(spaceWidth: 12.wt(context)),
                            
                            
                                              Icon(Icons.keyboard_arrow_down_outlined,size: 20.st(context),color: ColorUtils.blue192,),
                            
                            
                            
                            
                            
                                            ],
                                          ),
                                        ),
                                      ),
                            
                                      SpacerWidget.spacerWidget(spaceHeight: 20.ht(context)),
                            
                            
                                      isProductListShow.value == true ?
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
                            
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Container(
                                                              alignment: Alignment.centerLeft,
                                                              child: Text(
                                                                "${cartList[index].notes}".tr,
                                                                textAlign: TextAlign.start,
                                                                style: GoogleFonts.tajawal(
                                                                  fontWeight: FontWeight.w500,
                                                                  fontStyle: FontStyle.normal,
                                                                  fontSize: 14.spt(context),
                                                                  color: ColorUtils.gray163,
                                                                ),
                                                              ),
                                                            ),
                            
                                                            Container(
                                                              alignment: Alignment.centerLeft,
                                                              child: Text(
                                                                "${cartList[index].quantity}".tr,
                                                                textAlign: TextAlign.start,
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
                            
                                                      ],
                                                    ),
                                                  ),
                            
                                                ],
                                              ),
                                            ));
                                          },
                                        ),
                                      ) :
                                      SpacerWidget.spacerWidget(),
                            
                            
                            
                            
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
                                      Get.off(()=>OrderTrackScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                                    },
                                    child: Center(
                                      child: Text(
                                        "Complete payment".tr,
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
                            
                            
                                SpacerWidget.spacerWidget(spaceHeight: 20.ht(context)),
                                
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                                        Get.delete<PaymentScreenWidget>(force: true);
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
                                        "Payment".tr,
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
                              height: 56.hm(context),
                              width: 358.wm(context),
                              decoration: BoxDecoration(
                                border: isCash.value == false  ?
                                Border.all(color: ColorUtils.white217,width: 1) :
                                Border.all(color: ColorUtils.blue192,width: 1),
                                borderRadius: BorderRadius.circular(10.rm(context)),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 12.vpmm(context),horizontal: 12.hpmm(context)),
                              child: TextButton(
                                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                onPressed: () async {
                                  if(isCash.value == true) {
                                    isProductListShow.value = false;
                                    isVisaOrMastercard.value = false;
                                    isCash.value = false;
                                  } else {
                                    isProductListShow.value = false;
                                    isVisaOrMastercard.value = false;
                                    isCash.value = true;
                                  }
                                },
                                child: Row(
                                  children: [


                                    Container(
                                      height: 30.hm(context),
                                      width: 30.wm(context),
                                      decoration: BoxDecoration(
                                        border:  isCash.value  == false  ?
                                        Border.all(color: ColorUtils.white217,width: 1) :
                                        Border.all(color: ColorUtils.blue192,width: 1),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: Container(
                                          height: 16.hm(context),
                                          width: 16.wm(context),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color:  isCash.value == false ?
                                              Colors.transparent : ColorUtils.blue192
                                          ),
                                        ),
                                      ),
                                    ),

                                    SpacerWidget.spacerWidget(spaceWidth: 12.wm(context)),

                                    Expanded(
                                      child: Container(
                                        alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                        child: Text(
                                          "Cash".tr,
                                          textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                          style: GoogleFonts.tajawal(
                                            fontWeight: FontWeight.w700,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 18.spm(context),
                                            color: ColorUtils.black30,
                                          ),
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),

                            SpacerWidget.spacerWidget(spaceHeight: 16.hm(context),),


                            isCash.value == true ?
                            Column(
                              children: [

                                SpacerWidget.spacerWidget(spaceHeight: 12.hm(context),),
                                Container(
                                  alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                  child: Text(
                                    "Name*".tr,
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
                                  controller: nameController.value,
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
                                    hintText: "Enter your name".tr,
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


                                Container(
                                  alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                  child: Text(
                                    "Phone Number *".tr,
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
                                  controller: phoneNumberController.value,
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
                                    hintText: "+88017XXXXXXXX".tr,
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


                                Container(
                                  alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                  child: Text(
                                    "Governorate *".tr,
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
                                    hintText: "Muscat".tr,
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
                                            "State".tr,
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
                                            hintText: "Al Khoud".tr,
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
                                            "City".tr,
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
                                            hintText: "Al Khoud".tr,
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


                                SpacerWidget.spacerWidget(spaceHeight: 12.hm(context),),


                                Container(
                                  height: 20.hm(context),
                                  width: 390.wm(context),
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                  ),
                                  child: FittedBox(
                                    fit: BoxFit.fill,
                                    child: Image.asset(
                                      ImagePathUtils.dotBorderIconImagePath,
                                      fit: BoxFit.fill,
                                      alignment: Alignment.center,
                                    ),
                                  ),
                                ),

                                SpacerWidget.spacerWidget(spaceHeight: 12.hm(context),),


                              ],
                            ) :
                            SpacerWidget.spacerWidget(),


                            Container(
                              height: 56.hm(context),
                              width: 358.wm(context),
                              decoration: BoxDecoration(
                                border: isVisaOrMastercard.value == false  ?
                                Border.all(color: ColorUtils.white217,width: 1) :
                                Border.all(color: ColorUtils.blue192,width: 1),
                                borderRadius: BorderRadius.circular(10.rm(context)),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 12.vpmm(context),horizontal: 12.hpmm(context)),
                              child: TextButton(
                                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                onPressed: () async {
                                  if(isVisaOrMastercard.value == true) {
                                    isProductListShow.value = false;
                                    isVisaOrMastercard.value = false;
                                    isCash.value = false;
                                  } else {
                                    isProductListShow.value = false;
                                    isVisaOrMastercard.value = true;
                                    isCash.value = false;
                                  }
                                },
                                child: Row(
                                  children: [


                                    Container(
                                      height: 30.hm(context),
                                      width: 30.wm(context),
                                      decoration: BoxDecoration(
                                        border: isVisaOrMastercard.value == false  ?
                                        Border.all(color: ColorUtils.white217,width: 1) :
                                        Border.all(color: ColorUtils.blue192,width: 1),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: Container(
                                          height: 16.hm(context),
                                          width: 16.wm(context),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: isVisaOrMastercard.value == false ?
                                              Colors.transparent : ColorUtils.blue192
                                          ),
                                        ),
                                      ),
                                    ),

                                    SpacerWidget.spacerWidget(spaceWidth: 12.wm(context)),

                                    Expanded(
                                      child: Container(
                                        alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                        child: Text(
                                          "Mastercard / Visa".tr,
                                          textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                          style: GoogleFonts.tajawal(
                                            fontWeight: FontWeight.w700,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 18.spm(context),
                                            color: ColorUtils.black30,
                                          ),
                                        ),
                                      ),
                                    ),


                                    Container(
                                      height: 30.hm(context),
                                      width: 45.wm(context),
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                      ),
                                      child: FittedBox(
                                        fit: BoxFit.cover,
                                        child: Image.asset(
                                          ImagePathUtils.mastercardIconImagePath,
                                          fit: BoxFit.cover,
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                    ),

                                    SpacerWidget.spacerWidget(spaceWidth: 12.wm(context)),


                                    Container(
                                      height: 18.hm(context),
                                      width: 56.wm(context),
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                      ),
                                      child: FittedBox(
                                        fit: BoxFit.cover,
                                        child: Image.asset(
                                          ImagePathUtils.visaIconImagePath,
                                          fit: BoxFit.cover,
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                    ),





                                  ],
                                ),
                              ),
                            ),


                            isVisaOrMastercard.value == true ?
                            Column(
                              children: [

                                SpacerWidget.spacerWidget(spaceHeight: 12.hm(context),),

                                Container(
                                  alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                  child: Text(
                                    "Name on card *".tr,
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
                                  controller: cardNameController.value,
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
                                    hintText: "Enter card name".tr,
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


                                Container(
                                  alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                  child: Text(
                                    "Card Number *".tr,
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
                                  controller: cardNumberController.value,
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
                                    hintText: "0000 0000 0000 0000".tr,
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
                                            "Expiry date * ".tr,
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
                                          controller: expiryDateController.value,
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
                                            hintText: "00/00".tr,
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
                                            "CVV *".tr,
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
                                          controller: cvvController.value,
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
                                            hintText: "000".tr,
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


                                SpacerWidget.spacerWidget(spaceHeight: 12.hm(context),),


                                Container(
                                  height: 25.hm(context),
                                  width: 358.wm(context),
                                  decoration: BoxDecoration(
                                      color: Colors.transparent
                                  ),
                                  alignment: Alignment.center,
                                  child: TextButton(
                                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                    onPressed: () async {
                                      if(isCheckIn.value == true) {
                                        isCheckIn.value = false;
                                      } else {
                                        isCheckIn.value = true;
                                        timeCounter.value = 60;
                                        otp1.value.clear();
                                        otp2.value.clear();
                                        otp3.value.clear();
                                        otp4.value.clear();
                                        otp5.value.clear();
                                        otp6.value.clear();
                                        await otpTimer();
                                        showAdaptiveDialog(
                                          context: context,
                                          barrierDismissible: true,
                                          builder: (context) {
                                            return Obx(()=>Padding(
                                              padding: EdgeInsets.symmetric(
                                                vertical: 200.vpmm(context),
                                                horizontal: 16.hpmm(context),
                                              ),
                                              child: Container(
                                                width: 358.wm(context),
                                                height: 438.hm(context),
                                                decoration: BoxDecoration(
                                                  color: ColorUtils.white255,
                                                  borderRadius: BorderRadius.circular(16.rm(context)),
                                                ),
                                                padding: EdgeInsets.symmetric(
                                                  vertical: 30.vpmm(context),
                                                  horizontal: 20.hpmm(context),
                                                ),
                                                child: Material(
                                                  color: Colors.transparent,
                                                  shadowColor: Colors.transparent,
                                                  surfaceTintColor: Colors.transparent,
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [


                                                      Container(
                                                        width: 358.wm(context),
                                                        alignment: Alignment.center,
                                                        child: Text(
                                                          "Verify Your Identity".tr,
                                                          textAlign: TextAlign.center,
                                                          style: GoogleFonts.tajawal(
                                                            fontWeight: FontWeight.w700,
                                                            fontStyle: FontStyle.normal,
                                                            fontSize: 24.spm(context),
                                                            color: ColorUtils.black33,
                                                            height: (35.hm(context) / 24.spm(context)),
                                                          ),
                                                        ),
                                                      ),



                                                      Container(
                                                        width: 358.wm(context),
                                                        alignment: Alignment.center,
                                                        child: Text(
                                                          "We have sent a 6-digit verification code to your registered phone number. Please enter the code below to complete your payment.".tr,
                                                          textAlign: TextAlign.center,
                                                          style: GoogleFonts.tajawal(
                                                            fontWeight: FontWeight.w500,
                                                            fontStyle: FontStyle.normal,
                                                            fontSize: 18.spm(context),
                                                            color: ColorUtils.black33,
                                                            height: (35.hm(context) / 18.spm(context)),
                                                          ),
                                                        ),
                                                      ),





                                                      SpacerWidget.spacerWidget(spaceHeight: 18.hm(context)),



                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [

                                                          TextFormField(
                                                            controller: otp1.value,
                                                            textAlign: TextAlign.center,
                                                            keyboardType: TextInputType.number,
                                                            cursorColor: ColorUtils.blue192,
                                                            cursorHeight: 20.hm(context),
                                                            style: GoogleFonts.tajawal(
                                                              fontSize: 20.spm(context),
                                                              fontStyle: FontStyle.normal,
                                                              color: ColorUtils.black51,
                                                              fontWeight: FontWeight.w700,
                                                            ),
                                                            onChanged: (pin) {
                                                              if (pin.isNotEmpty) {
                                                                FocusScope.of(context).nextFocus();
                                                              }
                                                            },
                                                            textAlignVertical: TextAlignVertical.center,
                                                            decoration: InputDecoration(
                                                              filled: true,
                                                              fillColor: ColorUtils.white255,
                                                              contentPadding: EdgeInsets.symmetric(
                                                                horizontal: 12.hpmm(context),
                                                                vertical: 12.vpmm(context),
                                                              ),
                                                              constraints: BoxConstraints(
                                                                maxWidth: 40.wm(context),
                                                                maxHeight: 50.hm(context),
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
                                                          SpacerWidget.spacerWidget(spaceWidth: 6.wm(context)),
                                                          TextFormField(
                                                            controller: otp2.value,
                                                            textAlign: TextAlign.center,
                                                            keyboardType: TextInputType.number,
                                                            cursorColor: ColorUtils.blue192,
                                                            cursorHeight: 20.hm(context),
                                                            style: GoogleFonts.tajawal(
                                                              fontSize: 20.spm(context),
                                                              fontStyle: FontStyle.normal,
                                                              color: ColorUtils.black51,
                                                              fontWeight: FontWeight.w700,
                                                            ),
                                                            onChanged: (pin) {
                                                              if (pin.isNotEmpty) {
                                                                FocusScope.of(context).nextFocus();
                                                              }
                                                            },
                                                            textAlignVertical: TextAlignVertical.center,
                                                            decoration: InputDecoration(
                                                              filled: true,
                                                              fillColor: ColorUtils.white255,
                                                              contentPadding: EdgeInsets.symmetric(
                                                                horizontal: 12.hpmm(context),
                                                                vertical: 12.vpmm(context),
                                                              ),
                                                              constraints: BoxConstraints(
                                                                maxWidth: 40.wm(context),
                                                                maxHeight: 50.hm(context),
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
                                                          SpacerWidget.spacerWidget(spaceWidth: 6.wm(context)),
                                                          TextFormField(
                                                            controller: otp3.value,
                                                            textAlign: TextAlign.center,
                                                            keyboardType: TextInputType.number,
                                                            cursorColor: ColorUtils.blue192,
                                                            cursorHeight: 20.hm(context),
                                                            style: GoogleFonts.tajawal(
                                                              fontSize: 20.spm(context),
                                                              fontStyle: FontStyle.normal,
                                                              color: ColorUtils.black51,
                                                              fontWeight: FontWeight.w700,
                                                            ),
                                                            onChanged: (pin) {
                                                              if (pin.isNotEmpty) {
                                                                FocusScope.of(context).nextFocus();
                                                              }
                                                            },
                                                            textAlignVertical: TextAlignVertical.center,
                                                            decoration: InputDecoration(
                                                              filled: true,
                                                              fillColor: ColorUtils.white255,
                                                              contentPadding: EdgeInsets.symmetric(
                                                                horizontal: 12.hpmm(context),
                                                                vertical: 12.vpmm(context),
                                                              ),
                                                              constraints: BoxConstraints(
                                                                maxWidth: 40.wm(context),
                                                                maxHeight: 50.hm(context),
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
                                                          SpacerWidget.spacerWidget(spaceWidth: 6.wm(context)),
                                                          TextFormField(
                                                            controller: otp4.value,
                                                            textAlign: TextAlign.center,
                                                            keyboardType: TextInputType.number,
                                                            cursorColor: ColorUtils.blue192,
                                                            cursorHeight: 20.hm(context),
                                                            style: GoogleFonts.tajawal(
                                                              fontSize: 20.spm(context),
                                                              fontStyle: FontStyle.normal,
                                                              color: ColorUtils.black51,
                                                              fontWeight: FontWeight.w700,
                                                            ),
                                                            onChanged: (pin) {
                                                              if (pin.isNotEmpty) {
                                                                FocusScope.of(context).nextFocus();
                                                              }
                                                            },
                                                            textAlignVertical: TextAlignVertical.center,
                                                            decoration: InputDecoration(
                                                              filled: true,
                                                              fillColor: ColorUtils.white255,
                                                              contentPadding: EdgeInsets.symmetric(
                                                                horizontal: 12.hpmm(context),
                                                                vertical: 12.vpmm(context),
                                                              ),
                                                              constraints: BoxConstraints(
                                                                maxWidth: 40.wm(context),
                                                                maxHeight: 50.hm(context),
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
                                                          SpacerWidget.spacerWidget(spaceWidth: 6.wm(context)),
                                                          TextFormField(
                                                            controller: otp5.value,
                                                            textAlign: TextAlign.center,
                                                            keyboardType: TextInputType.number,
                                                            cursorColor: ColorUtils.blue192,
                                                            cursorHeight: 20.hm(context),
                                                            style: GoogleFonts.tajawal(
                                                              fontSize: 20.spm(context),
                                                              fontStyle: FontStyle.normal,
                                                              color: ColorUtils.black51,
                                                              fontWeight: FontWeight.w700,
                                                            ),
                                                            onChanged: (pin) {
                                                              if (pin.isNotEmpty) {
                                                                FocusScope.of(context).nextFocus();
                                                              }
                                                            },
                                                            textAlignVertical: TextAlignVertical.center,
                                                            decoration: InputDecoration(
                                                              filled: true,
                                                              fillColor: ColorUtils.white255,
                                                              contentPadding: EdgeInsets.symmetric(
                                                                horizontal: 12.hpmm(context),
                                                                vertical: 12.vpmm(context),
                                                              ),
                                                              constraints: BoxConstraints(
                                                                maxWidth: 40.wm(context),
                                                                maxHeight: 50.hm(context),
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
                                                          SpacerWidget.spacerWidget(spaceWidth: 6.wm(context)),
                                                          TextFormField(
                                                            controller: otp6.value,
                                                            textAlign: TextAlign.center,
                                                            keyboardType: TextInputType.number,
                                                            cursorColor: ColorUtils.blue192,
                                                            cursorHeight: 20.hm(context),
                                                            style: GoogleFonts.tajawal(
                                                              fontSize: 20.spm(context),
                                                              fontStyle: FontStyle.normal,
                                                              color: ColorUtils.black51,
                                                              fontWeight: FontWeight.w700,
                                                            ),
                                                            onChanged: (pin) {
                                                              if (pin.isNotEmpty) {
                                                                FocusScope.of(context).unfocus();
                                                              }
                                                            },
                                                            textAlignVertical: TextAlignVertical.center,
                                                            decoration: InputDecoration(
                                                              filled: true,
                                                              fillColor: ColorUtils.white255,
                                                              contentPadding: EdgeInsets.symmetric(
                                                                horizontal: 12.hpmm(context),
                                                                vertical: 12.vpmm(context),
                                                              ),
                                                              constraints: BoxConstraints(
                                                                maxWidth: 40.wm(context),
                                                                maxHeight: 50.hm(context),
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


                                                      SpacerWidget.spacerWidget(spaceHeight: 18.hm(context)),


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
                                                            Get.back();
                                                            showAdaptiveDialog(
                                                              context: context,
                                                              barrierDismissible: true,
                                                              builder: (context) {
                                                                return Padding(
                                                                  padding: EdgeInsets.symmetric(
                                                                    vertical: 210.vpmm(context),
                                                                    horizontal: 16.hpmm(context),
                                                                  ),
                                                                  child: Container(
                                                                    width: 358.wm(context),
                                                                    height: 283.hm(context),
                                                                    decoration: BoxDecoration(
                                                                      color: ColorUtils.white255,
                                                                      borderRadius: BorderRadius.circular(16.rm(context)),
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
                                                                          height: 64.hm(context),
                                                                          width: 64.wm(context),
                                                                          decoration: BoxDecoration(
                                                                              color: Colors.transparent
                                                                          ),
                                                                          child: FittedBox(
                                                                            fit: BoxFit.cover,
                                                                            child: Image.asset(
                                                                              ImagePathUtils.signUpScreenImagePath,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                        ),


                                                                        SpacerWidget.spacerWidget(spaceHeight: 18.hm(context)),


                                                                        Container(
                                                                          width: 358.wm(context),
                                                                          alignment: Alignment.center,
                                                                          child: Text(
                                                                            "Payment successful!",
                                                                            textAlign: TextAlign.center,
                                                                            style: GoogleFonts.tajawal(
                                                                              fontWeight: FontWeight.w700,
                                                                              fontStyle: FontStyle.normal,
                                                                              fontSize: 18.spm(context),
                                                                              color: ColorUtils.black33,
                                                                              height: (35.hm(context) / 18.spm(context)),
                                                                            ),
                                                                          ),
                                                                        ),

                                                                        Container(
                                                                          width: 358.wm(context),
                                                                          alignment: Alignment.center,
                                                                          child: Text(
                                                                            "Thank you! Your payment has been confirmed and your order has been successfully submitted.",
                                                                            textAlign: TextAlign.center,
                                                                            style: GoogleFonts.tajawal(
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FontStyle.normal,
                                                                              fontSize: 18.spm(context),
                                                                              color: ColorUtils.black33,
                                                                              height: (35.hm(context) / 18.spm(context)),
                                                                            ),
                                                                          ),
                                                                        ),

                                                                        Container(
                                                                          width: 358.wm(context),
                                                                          alignment: Alignment.center,
                                                                          child: Text(
                                                                            "Order number: #123456".tr,
                                                                            textAlign: TextAlign.center,
                                                                            style: GoogleFonts.tajawal(
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FontStyle.normal,
                                                                              fontSize: 18.spm(context),
                                                                              color: ColorUtils.black33,
                                                                              height: (35.hm(context) / 18.spm(context)),
                                                                            ),
                                                                          ),
                                                                        ),


                                                                        SpacerWidget.spacerWidget(spaceHeight: 18.hm(context)),


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
                                                                              Get.delete<PaymentScreenWidget>(force: true);
                                                                              Get.off(()=>OrderTrackScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                                                                            },
                                                                            child: Center(
                                                                              child: Text(
                                                                                "Complete payment".tr,
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
                                                                );
                                                              },
                                                            );
                                                          },
                                                          child: Center(
                                                            child: Text(
                                                              "Complete payment".tr,
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

                                                      SpacerWidget.spacerWidget(spaceHeight: 18.hm(context)),


                                                      Container(
                                                        width: 358.wm(context),
                                                        alignment: Alignment.center,
                                                        child: Text(
                                                          "Didn't receive the code?".tr,
                                                          textAlign: TextAlign.center,
                                                          style: GoogleFonts.tajawal(
                                                            fontWeight: FontWeight.w700,
                                                            fontStyle: FontStyle.normal,
                                                            fontSize: 14.spm(context),
                                                            color: ColorUtils.black33,
                                                            height: (25.hm(context) / 14.spm(context)),
                                                          ),
                                                        ),
                                                      ),


                                                      timeCounter.value == 0 ?
                                                      Container(
                                                        height: 20.hm(context),
                                                        width: 358.wm(context),
                                                        alignment: Alignment.center,
                                                        child: TextButton(
                                                          style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                                          onPressed: () async {
                                                            Get.back();
                                                            showAdaptiveDialog(
                                                              context: context,
                                                              barrierDismissible: true,
                                                              builder: (context) {
                                                                return Padding(
                                                                  padding: EdgeInsets.symmetric(
                                                                    vertical: 210.vpmm(context),
                                                                    horizontal: 16.hpmm(context),
                                                                  ),
                                                                  child: Container(
                                                                    width: 358.wm(context),
                                                                    height: 283.hm(context),
                                                                    decoration: BoxDecoration(
                                                                      color: ColorUtils.white255,
                                                                      borderRadius: BorderRadius.circular(16.rm(context)),
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
                                                                          height: 64.hm(context),
                                                                          width: 64.wm(context),
                                                                          decoration: BoxDecoration(
                                                                              color: Colors.transparent
                                                                          ),
                                                                          child: FittedBox(
                                                                            fit: BoxFit.cover,
                                                                            child: Image.asset(
                                                                              ImagePathUtils.errorIconImagePath,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                        ),


                                                                        SpacerWidget.spacerWidget(spaceHeight: 18.hm(context)),


                                                                        Container(
                                                                          width: 358.wm(context),
                                                                          alignment: Alignment.center,
                                                                          child: Text(
                                                                            "Sorry, your payment was not completed!".tr,
                                                                            textAlign: TextAlign.center,
                                                                            style: GoogleFonts.tajawal(
                                                                              fontWeight: FontWeight.w700,
                                                                              fontStyle: FontStyle.normal,
                                                                              fontSize: 18.spm(context),
                                                                              color: ColorUtils.black33,
                                                                              height: (35.hm(context) / 18.spm(context)),
                                                                            ),
                                                                          ),
                                                                        ),

                                                                        Container(
                                                                          width: 358.wm(context),
                                                                          alignment: Alignment.center,
                                                                          child: Text(
                                                                            "There was a problem processing your payment. Please check your details and try again.".tr,
                                                                            textAlign: TextAlign.center,
                                                                            style: GoogleFonts.tajawal(
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FontStyle.normal,
                                                                              fontSize: 18.spm(context),
                                                                              color: ColorUtils.black33,
                                                                              height: (35.hm(context) / 18.spm(context)),
                                                                            ),
                                                                          ),
                                                                        ),


                                                                        SpacerWidget.spacerWidget(spaceHeight: 18.hm(context)),


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
                                                                              Get.delete<PaymentScreenWidget>(force: true);
                                                                              Get.off(()=>PaymentScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                                                                            },
                                                                            child: Center(
                                                                              child: Text(
                                                                                "Try Again".tr,
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
                                                                );
                                                              },
                                                            );
                                                          },
                                                          child: Text(
                                                            "Resend Otp".tr,
                                                            textAlign: TextAlign.center,
                                                            style: GoogleFonts.tajawal(
                                                              fontWeight: FontWeight.w500,
                                                              fontStyle: FontStyle.normal,
                                                              fontSize: 14.spm(context),
                                                              color: ColorUtils.blue192,
                                                              height: (25.hm(context) / 14.spm(context)),
                                                            ),
                                                          ),
                                                        ),
                                                      ) : 
                                                      Container(
                                                        width: 358.wm(context),
                                                        alignment: Alignment.center,
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            Text(
                                                              "Resend after".tr,
                                                              textAlign: TextAlign.center,
                                                              style: GoogleFonts.tajawal(
                                                                fontWeight: FontWeight.w500,
                                                                fontStyle: FontStyle.normal,
                                                                fontSize: 14.spm(context),
                                                                color: ColorUtils.black33,
                                                                height: (25.hm(context) / 14.spm(context)),
                                                              ),
                                                            ),
                                                            Text(
                                                              "(${timeCounter.value}s)",
                                                              textAlign: TextAlign.center,
                                                              style: GoogleFonts.tajawal(
                                                                fontWeight: FontWeight.w500,
                                                                fontStyle: FontStyle.normal,
                                                                fontSize: 14.spm(context),
                                                                color: ColorUtils.black33,
                                                                height: (25.hm(context) / 14.spm(context)),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ));
                                          },
                                        );
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
                                            text: "Save card details for quick payment later".tr,
                                            style: GoogleFonts.tajawal(
                                              fontStyle: FontStyle.normal,
                                              fontSize: 14.spm(context),
                                              color: ColorUtils.black33,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            children: [],
                                          ),
                                        ),


                                      ],
                                    ),
                                  ),
                                ),

                                Container(
                                  height: 20.hm(context),
                                  width: 390.wm(context),
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                  ),
                                  child: FittedBox(
                                    fit: BoxFit.fill,
                                    child: Image.asset(
                                      ImagePathUtils.dotBorderIconImagePath,
                                      fit: BoxFit.fill,
                                      alignment: Alignment.center,
                                    ),
                                  ),
                                ),

                                SpacerWidget.spacerWidget(spaceHeight: 12.hm(context),),


                              ],
                            ) :
                            SpacerWidget.spacerWidget(),


                            SpacerWidget.spacerWidget(spaceHeight: 32.hm(context),),



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

                                  SpacerWidget.spacerWidget(spaceHeight: 12.hm(context)),


                                  Container(
                                    height: 1.hm(context),
                                    width: 390.wm(context),
                                    decoration: BoxDecoration(
                                      color: ColorUtils.gray136,
                                    ),
                                  ),



                                  SpacerWidget.spacerWidget(spaceHeight: 12.hm(context)),


                                  Container(
                                    height: 37.hm(context),
                                    width: 390.wm(context),
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                    ),
                                    child: TextButton(
                                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                      onPressed: () async {
                                        if( isProductListShow.value == false) {
                                          isProductListShow.value = true;
                                          isVisaOrMastercard.value = false;
                                          isCash.value = false;
                                        } else {
                                          isProductListShow.value = false;
                                          isVisaOrMastercard.value = false;
                                          isCash.value = false;
                                        }
                                      },
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [

                                          Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              isProductListShow.value == true ? "See Order details".tr : "Order details".tr,
                                              textAlign: TextAlign.start,
                                              style: GoogleFonts.tajawal(
                                                fontWeight: FontWeight.w700,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 14.spm(context),
                                                color: ColorUtils.blue192,
                                              ),
                                            ),
                                          ),

                                          SpacerWidget.spacerWidget(spaceWidth: 12.wm(context)),


                                          Icon(Icons.keyboard_arrow_down_outlined,size: 20.sm(context),color: ColorUtils.blue192,),





                                        ],
                                      ),
                                    ),
                                  ),

                                  SpacerWidget.spacerWidget(spaceHeight: 20.hm(context)),


                                  isProductListShow.value == true ?
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

                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
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

                                                        Container(
                                                          alignment: Alignment.centerLeft,
                                                          child: Text(
                                                            "${cartList[index].quantity}".tr,
                                                            textAlign: TextAlign.start,
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

                                                  ],
                                                ),
                                              ),

                                            ],
                                          ),
                                        ));
                                      },
                                    ),
                                  ) :
                                  SpacerWidget.spacerWidget(),




                                ],
                              ),
                            ),


                            SpacerWidget.spacerWidget(spaceHeight: 20.hm(context)),

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
                      Get.off(()=>OrderTrackScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                    },
                    child: Center(
                      child: Text(
                        "Complete payment".tr,
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