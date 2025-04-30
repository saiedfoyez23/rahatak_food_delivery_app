import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rahatak_food_delivery_app/utils/utils.dart';

import '../screen/screen.dart';

class PaymentMethodsScreenWidget extends GetxController {

  Rx<TextEditingController> cardNameController = TextEditingController().obs;
  Rx<TextEditingController> cardNumberController = TextEditingController().obs;
  Rx<TextEditingController> expiryDateController = TextEditingController().obs;
  Rx<TextEditingController> cvvController = TextEditingController().obs;
  RxBool isCheckIn = false.obs;
  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<TextEditingController> phoneNumberController = TextEditingController().obs;
  Rx<TextEditingController> governorateController = TextEditingController().obs;
  Rx<TextEditingController> stateController = TextEditingController().obs;
  Rx<TextEditingController> cityController = TextEditingController().obs;

  Widget paymentMethodsScreenWidget({required BuildContext context}) {
    if(MediaQuery.sizeOf(context).height > 1000) {
      return  SafeArea(
        child: Container(
          height: 1133.ht(context),
          width: 744.wt(context),
          decoration: BoxDecoration(
            color: ColorUtils.white248,
          ),
          child: CustomScrollView(
            slivers: [

              SliverToBoxAdapter(
                child: Column(
                  children: [


                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 37.hpmt(context)),
                      child: Column(
                        children: [

                          SpacerWidget.spacerWidget(spaceHeight: 11.ht(context)),

                          Directionality(
                            textDirection: TextDirection.ltr,
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
                                      "Payment Methods".tr,
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


                        ],
                      ),
                    ),


                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 138.hpmt(context)),
                      child: Column(
                        children: [


                          SpacerWidget.spacerWidget(spaceHeight: 35.ht(context)),

                          Container(
                            height: 56.ht(context),
                            padding: EdgeInsets.symmetric(vertical: 10.vpmt(context),horizontal: 10.hpmt(context)),
                            decoration: BoxDecoration(
                              border: Border.all(width: 0.5,color: ColorUtils.gray190),
                              borderRadius: BorderRadius.circular(10.rt(context)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [


                                Expanded(
                                  child: Container(
                                    alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                    child: Text(
                                      "Cash on Delivery".tr,
                                      textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                      style: GoogleFonts.tajawal(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 18.spt(context),
                                        color: ColorUtils.black30,
                                      ),
                                    ),
                                  ),
                                ),


                                Container(
                                  height: 24.ht(context),
                                  width: 24.wt(context),
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
                                              vertical: 280.vpmt(context),
                                              horizontal: 158.hpmt(context),
                                            ),
                                            child: Container(
                                              width: 468.wt(context),
                                              height: 500.ht(context),
                                              decoration: BoxDecoration(
                                                color: ColorUtils.white255,
                                                borderRadius: BorderRadius.circular( 16.rt(context)),
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                vertical: 30.vpmt(context),
                                                horizontal: 20.hpmt(context),
                                              ),
                                              child: Material(
                                                color: Colors.transparent,
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                                          fontSize: 16.spt(context),
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

                                                        Expanded(
                                                          child: Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [

                                                              Container(
                                                                alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                                                child: Text(
                                                                  "State".tr,
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
                                                        ),


                                                        SpacerWidget.spacerWidget(spaceWidth: 8.wt(context)),


                                                        Expanded(
                                                          child: Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [

                                                              Container(
                                                                alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                                                child: Text(
                                                                  "City".tr,
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
                                                        ),






                                                      ],
                                                    ),


                                                    SpacerWidget.spacerWidget(spaceHeight: 20.ht(context),),


                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [


                                                        Container(
                                                          height: 52.ht(context),
                                                          width: 188.wt(context),
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
                                                                "Save".tr,
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
                                                          width: 188.wt(context),
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
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: FittedBox(
                                      fit: BoxFit.cover,
                                      child: Image.asset(
                                        ImagePathUtils.editIconImagePath,
                                        fit: BoxFit.cover,
                                        alignment: Alignment.center,
                                      ),
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ),

                          SpacerWidget.spacerWidget(spaceHeight: 16.ht(context)),

                          Container(
                            height: 56.ht(context),
                            padding: EdgeInsets.symmetric(vertical: 10.vpmt(context),horizontal: 10.hpmt(context)),
                            decoration: BoxDecoration(
                              border: Border.all(width: 0.5,color: ColorUtils.gray190),
                              borderRadius: BorderRadius.circular(10.rt(context)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [


                                Expanded(
                                  child: Container(
                                    alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                    child: Text(
                                      "Mastercard / Visa".tr,
                                      textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                      style: GoogleFonts.tajawal(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 18.spt(context),
                                        color: ColorUtils.black30,
                                      ),
                                    ),
                                  ),
                                ),


                                Container(
                                  height: 24.ht(context),
                                  width: 24.wt(context),
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
                                          return Obx(()=>Padding(
                                            padding: EdgeInsets.symmetric(
                                              vertical: 300.vpmt(context),
                                              horizontal: 158.hpmt(context),
                                            ),
                                            child: Container(
                                              width: 468.wt(context),
                                              height: 500.ht(context),
                                              decoration: BoxDecoration(
                                                color: ColorUtils.white255,
                                                borderRadius: BorderRadius.circular( 16.rt(context)),
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                vertical: 30.vpmt(context),
                                                horizontal: 20.hpmt(context),
                                              ),
                                              child: Material(
                                                color: Colors.transparent,
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
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

                                                        Expanded(
                                                          child: Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [

                                                              Container(
                                                                alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                                                child: Text(
                                                                  "Expiry date * ".tr,
                                                                  textAlign:  Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
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
                                                        ),


                                                        SpacerWidget.spacerWidget(spaceWidth: 8.wt(context)),


                                                        Expanded(
                                                          child: Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [

                                                              Container(
                                                                alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                                                child: Text(
                                                                  "CVV *".tr,
                                                                  textAlign:  Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
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
                                                          ),)


                                                      ],
                                                    ),


                                                    SpacerWidget.spacerWidget(spaceHeight: 12.ht(context),),


                                                    Container(
                                                      height: 25.ht(context),
                                                      width: 468.wt(context),
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


                                                    SpacerWidget.spacerWidget(spaceHeight: 20.ht(context),),


                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [


                                                        Container(
                                                          height: 52.ht(context),
                                                          width: 188.wt(context),
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
                                                                "Save".tr,
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
                                                          height: 52.ht(context),
                                                          width: 188.wt(context),
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
                                            ),
                                          ));
                                        },
                                      );
                                    },
                                    child: FittedBox(
                                      fit: BoxFit.cover,
                                      child: Image.asset(
                                        ImagePathUtils.editIconImagePath,
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
                    )



                  ],
                ),
              )


            ],
          ),
        ),
      );
    } else {
      return SafeArea(
        child: Container(
          height: 844.hm(context),
          width: 390.wm(context),
          decoration: BoxDecoration(
              color: ColorUtils.white248
          ),
          child: CustomScrollView(
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
                                  "Payment Methods".tr,
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


                      SpacerWidget.spacerWidget(spaceHeight: 35.hm(context)),

                      Container(
                        height: 56.hm(context),
                        padding: EdgeInsets.symmetric(vertical: 10.vpmm(context),horizontal: 10.hpmm(context)),
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.5,color: ColorUtils.gray190),
                          borderRadius: BorderRadius.circular(10.rm(context)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [


                            Expanded(
                              child: Container(
                                alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                child: Text(
                                  "Cash on Delivery".tr,
                                  textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                  style: GoogleFonts.tajawal(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 18.spm(context),
                                    color: ColorUtils.black30,
                                  ),
                                ),
                              ),
                            ),


                            Container(
                              height: 24.hm(context),
                              width: 24.wm(context),
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
                                          vertical: 140.vpmm(context),
                                          horizontal: 16.hpmm(context),
                                        ),
                                        child: Container(
                                          width: 358.wm(context),
                                          height: 510.hm(context),
                                          decoration: BoxDecoration(
                                            color: ColorUtils.white255,
                                            borderRadius: BorderRadius.circular( 16.rm(context)),
                                          ),
                                          padding: EdgeInsets.symmetric(
                                            vertical: 30.vpmm(context),
                                            horizontal: 20.hpmm(context),
                                          ),
                                          child: Material(
                                            color: Colors.transparent,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
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

                                                    Expanded(
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [

                                                          Container(
                                                            alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                                            child: Text(
                                                              "State".tr,
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
                                                    ),


                                                    SpacerWidget.spacerWidget(spaceWidth: 8.wm(context)),


                                                    Expanded(
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [

                                                          Container(
                                                            alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                                            child: Text(
                                                              "City".tr,
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
                                                    ),






                                                  ],
                                                ),


                                                SpacerWidget.spacerWidget(spaceHeight: 20.hm(context),),


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
                                                            "Save".tr,
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
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: FittedBox(
                                  fit: BoxFit.cover,
                                  child: Image.asset(
                                    ImagePathUtils.editIconImagePath,
                                    fit: BoxFit.cover,
                                    alignment: Alignment.center,
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),

                      SpacerWidget.spacerWidget(spaceHeight: 16.hm(context)),

                      Container(
                        height: 56.hm(context),
                        padding: EdgeInsets.symmetric(vertical: 10.vpmm(context),horizontal: 10.hpmm(context)),
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.5,color: ColorUtils.gray190),
                          borderRadius: BorderRadius.circular(10.rm(context)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [


                            Expanded(
                              child: Container(
                                alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                child: Text(
                                  "Mastercard / Visa".tr,
                                  textAlign: Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
                                  style: GoogleFonts.tajawal(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 18.spm(context),
                                    color: ColorUtils.black30,
                                  ),
                                ),
                              ),
                            ),


                            Container(
                              height: 24.hm(context),
                              width: 24.wm(context),
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
                                      return Obx(()=>Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 170.vpmm(context),
                                          horizontal: 16.hpmm(context),
                                        ),
                                        child: Container(
                                          width: 358.wm(context),
                                          height: 500.hm(context),
                                          decoration: BoxDecoration(
                                            color: ColorUtils.white255,
                                            borderRadius: BorderRadius.circular( 16.rm(context)),
                                          ),
                                          padding: EdgeInsets.symmetric(
                                            vertical: 30.vpmm(context),
                                            horizontal: 20.hpmm(context),
                                          ),
                                          child: Material(
                                            color: Colors.transparent,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
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

                                                    Expanded(
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [

                                                          Container(
                                                            alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                                            child: Text(
                                                              "Expiry date * ".tr,
                                                              textAlign:  Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
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
                                                    ),


                                                    SpacerWidget.spacerWidget(spaceWidth: 8.wm(context)),


                                                    Expanded(
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [

                                                          Container(
                                                            alignment: Get.locale.toString() == "en" ? Alignment.centerLeft : Alignment.centerRight,
                                                            child: Text(
                                                              "CVV *".tr,
                                                              textAlign:  Get.locale.toString() == "en" ? TextAlign.start : TextAlign.end,
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
                                                      ),)


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


                                                SpacerWidget.spacerWidget(spaceHeight: 20.hm(context),),


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
                                                            "Save".tr,
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
                                        ),
                                      ));
                                    },
                                  );
                                },
                                child: FittedBox(
                                  fit: BoxFit.cover,
                                  child: Image.asset(
                                    ImagePathUtils.editIconImagePath,
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
                ),
              )


            ],
          ),
        ),
      );
    }
  }



}