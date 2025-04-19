import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rahatak_food_delivery_app/screen/add_new_address_screen.dart';
import 'package:rahatak_food_delivery_app/utils/utils.dart';

import '../screen/screen.dart';

class OrderAddressScreenWidget extends GetxController {


  Widget orderAddressScreenWidget({required BuildContext context}) {
    if(MediaQuery.sizeOf(context).height > 1000) {
      return Container(
        height: 1133.ht(context),
        width: 744.wt(context),
        decoration: BoxDecoration(
          color: ColorUtils.white255,
        ),
      );
    } else {
      return SafeArea(
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
                          children: [
        
        
                            SpacerWidget.spacerWidget(spaceHeight: 11.hm(context),),
        
                            Row(
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
                                      Get.off(()=>CartScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
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
                                      "Specify the address",
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


                            SpacerWidget.spacerWidget(spaceHeight: 26.hm(context),),


                            Container(
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
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [

                                        Container(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "My Home",
                                            textAlign: TextAlign.start,
                                            style: GoogleFonts.tajawal(
                                              fontWeight: FontWeight.w700,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 18.spm(context),
                                              color: ColorUtils.black51,
                                            ),
                                          ),
                                        ),


                                        SpacerWidget.spacerWidget(spaceHeight: 6.hm(context)),

                                        Container(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Muscat, Al Khoud",
                                            textAlign: TextAlign.start,
                                            style: GoogleFonts.tajawal(
                                              fontWeight: FontWeight.w500,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 12.spm(context),
                                              color: ColorUtils.gray136,
                                            ),
                                          ),
                                        ),

                                        SpacerWidget.spacerWidget(spaceHeight: 6.hm(context)),

                                        Container(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "+968 95ْْXXXXXX",
                                            textAlign: TextAlign.start,
                                            style: GoogleFonts.tajawal(
                                              fontWeight: FontWeight.w500,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 12.spm(context),
                                              color: ColorUtils.gray136,
                                            ),
                                          ),
                                        ),

                                      ],
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
                                        Get.off(()=>EditNewAddressScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
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

                            SpacerWidget.spacerWidget(spaceHeight: 16.hm(context),),

                            Container(
                              width: 390.wm(context),
                              height: 56.hm(context),
                              padding: EdgeInsets.symmetric(vertical: 10.vpmm(context),horizontal: 10.hpmm(context)),
                              decoration: BoxDecoration(
                                border: Border.all(width: 0.5,color: ColorUtils.gray190),
                                borderRadius: BorderRadius.circular(10.rm(context)),
                              ),
                              child: TextButton(
                                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                onPressed: () async {
                                  Get.off(()=>PaymentScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [


                                    Container(
                                      height: 24.hm(context),
                                      width: 24.wm(context),
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                      ),
                                      child: FittedBox(
                                        fit: BoxFit.cover,
                                        child: Image.asset(
                                          ImagePathUtils.findLocationIconImagePath,
                                          fit: BoxFit.cover,
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                    ),


                                    SpacerWidget.spacerWidget(spaceWidth: 10.wm(context)),


                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Use my current location",
                                          textAlign: TextAlign.start,
                                          style: GoogleFonts.tajawal(
                                            fontWeight: FontWeight.w500,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 16.spm(context),
                                            color: ColorUtils.black255,
                                          ),
                                        ),
                                      ),
                                    ),

                                    SpacerWidget.spacerWidget(spaceWidth: 10.wm(context)),


                                    Container(
                                      height: 24.hm(context),
                                      width: 24.wm(context),
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                      ),
                                      child: FittedBox(
                                        fit: BoxFit.cover,
                                        child: Image.asset(
                                          ImagePathUtils.arrowBackIconImagePath,
                                          fit: BoxFit.cover,
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                    ),




                                  ],
                                ),
                              ),
                            ),


                            SpacerWidget.spacerWidget(spaceHeight: 16.hm(context),),

                            Container(
                              width: 390.wm(context),
                              height: 56.hm(context),
                              padding: EdgeInsets.symmetric(vertical: 10.vpmm(context),horizontal: 10.hpmm(context)),
                              decoration: BoxDecoration(
                                border: Border.all(width: 0.5,color: ColorUtils.gray190),
                                borderRadius: BorderRadius.circular(10.rm(context)),
                              ),
                              child: TextButton(
                                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                onPressed: () {
                                  Get.off(()=>AddNewAddressScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [


                                    Container(
                                      height: 24.hm(context),
                                      width: 24.wm(context),
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                      ),
                                      child: FittedBox(
                                        fit: BoxFit.cover,
                                        child: Image.asset(
                                          ImagePathUtils.addIconImagePath,
                                          fit: BoxFit.cover,
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                    ),


                                    SpacerWidget.spacerWidget(spaceWidth: 10.wm(context)),


                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Add a new address",
                                          textAlign: TextAlign.start,
                                          style: GoogleFonts.tajawal(
                                            fontWeight: FontWeight.w500,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 16.spm(context),
                                            color: ColorUtils.black255,
                                          ),
                                        ),
                                      ),
                                    ),

                                    SpacerWidget.spacerWidget(spaceWidth: 10.wm(context)),


                                    Container(
                                      height: 24.hm(context),
                                      width: 24.wm(context),
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                      ),
                                      child: FittedBox(
                                        fit: BoxFit.cover,
                                        child: Image.asset(
                                          ImagePathUtils.arrowBackIconImagePath,
                                          fit: BoxFit.cover,
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                    ),




                                  ],
                                ),
                              ),
                            ),


        
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
                      Get.off(()=>PaymentScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                    },
                    child: Center(
                      child: Text(
                        "Save Address",
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
      );
    }
  }


}