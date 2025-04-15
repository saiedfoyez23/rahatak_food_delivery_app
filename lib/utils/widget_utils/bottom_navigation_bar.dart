import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rahatak_food_delivery_app/screen/screen.dart';
import 'package:rahatak_food_delivery_app/utils/utils.dart';

class BottomNavigationBarWidget {

  Widget bottomNavigationBarWidget({
    required BuildContext context,
    required bool isHomeFocus,
    required bool isSearchFocus,
    required bool isTrackOrderFocus,
    required bool isCartFocus,
    required bool isProfileFocus,
  }) {
    if(MediaQuery.of(context).size.height > 1133) {
      return  Directionality(
        textDirection: TextDirection.ltr,
        child: Container(
          height: 84.ht(context),
          width: 744.wt(context),
          decoration: BoxDecoration(
            color: ColorUtils.white255,
          ),
          padding: EdgeInsets.symmetric(horizontal: 15.hpmt(context)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                height: 60.ht(context),
                width: 72.wt(context),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: TextButton(
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  onPressed: () async {
                    Get.off(()=>HomeScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [


                      Container(
                        height: 24.ht(context),
                        width: 24.wt(context),
                        decoration: BoxDecoration(
                            color: Colors.transparent
                        ),
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Image.asset(
                            isHomeFocus == true ? ImagePathUtils.homeIconFocusImagePath : ImagePathUtils.homeIconUnfocusImagePath,
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                          ),
                        ),
                      ),


                      SpacerWidget.spacerWidget(spaceHeight: 2.ht(context)),

                      Text(
                        "Home",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 12.spt(context),
                          color: isHomeFocus == true ? ColorUtils.blue210 : ColorUtils.black33,
                        ),
                      ),



                    ],
                  ),
                ),
              ),

              SpacerWidget.spacerWidget(spaceWidth: 14.wt(context)),

              Container(
                height: 60.ht(context),
                width: 72.wt(context),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: TextButton(
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  onPressed: () async {
                    Get.off(()=>SearchScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [


                      Container(
                        height: 24.ht(context),
                        width: 24.wt(context),
                        decoration: BoxDecoration(
                            color: Colors.transparent
                        ),
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Image.asset(
                            isSearchFocus == true ? ImagePathUtils.searchIconFocusImagePath : ImagePathUtils.searchIconUnfocusImagePath,
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                          ),
                        ),
                      ),


                      SpacerWidget.spacerWidget(spaceHeight: 2.ht(context)),

                      Text(
                        "Search",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 12.spt(context),
                          color: isSearchFocus == true ? ColorUtils.blue210 : ColorUtils.black33,
                        ),
                      ),



                    ],
                  ),
                ),
              ),

              SpacerWidget.spacerWidget(spaceWidth: 14.wt(context)),

              Container(
                height: 60.ht(context),
                width: 72.wt(context),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: TextButton(
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  onPressed: () async {
                    Get.off(()=>OrderTrackScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [


                      Container(
                        height: 24.ht(context),
                        width: 24.wt(context),
                        decoration: BoxDecoration(
                            color: Colors.transparent
                        ),
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Image.asset(
                            isTrackOrderFocus == true ? ImagePathUtils.orderTrackIconFocusImagePath : ImagePathUtils.orderTrackIconUnfocusImagePath,
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                          ),
                        ),
                      ),


                      SpacerWidget.spacerWidget(spaceHeight: 2.ht(context)),

                      Text(
                        "Track Order",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 12.spt(context),
                          color: isTrackOrderFocus == true ? ColorUtils.blue210 : ColorUtils.black33,
                        ),
                      ),



                    ],
                  ),
                ),
              ),

              SpacerWidget.spacerWidget(spaceWidth: 14.wt(context)),

              Container(
                height: 60.ht(context),
                width: 72.wt(context),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: TextButton(
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  onPressed: () async {
                    Get.off(()=>CartScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [


                      Container(
                        height: 24.ht(context),
                        width: 24.wt(context),
                        decoration: BoxDecoration(
                            color: Colors.transparent
                        ),
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Image.asset(
                            isCartFocus == true ? ImagePathUtils.cartIconFocusImagePath : ImagePathUtils.cartIconUnfocusImagePath,
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                          ),
                        ),
                      ),


                      SpacerWidget.spacerWidget(spaceHeight: 2.ht(context)),

                      Text(
                        "Cart",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 12.spt(context),
                          color: isTrackOrderFocus == true ? ColorUtils.blue210 : ColorUtils.black33,
                        ),
                      ),



                    ],
                  ),
                ),
              ),

              SpacerWidget.spacerWidget(spaceWidth: 14.wt(context)),

              Container(
                height: 60.ht(context),
                width: 72.wt(context),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: TextButton(
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  onPressed: () async {
                    Get.off(()=>ProfileScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [


                      Container(
                        height: 24.ht(context),
                        width: 24.wt(context),
                        decoration: BoxDecoration(
                            color: Colors.transparent
                        ),
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Image.asset(
                            isProfileFocus == true ? ImagePathUtils.profileFocusIconImagePath : ImagePathUtils.profileUnfocusIconImagePath,
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                          ),
                        ),
                      ),


                      SpacerWidget.spacerWidget(spaceHeight: 2.ht(context)),

                      Text(
                        "My Account",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 12.spt(context),
                          color: isProfileFocus == true ? ColorUtils.blue210 : ColorUtils.black33,
                        ),
                      ),



                    ],
                  ),
                ),
              ),



            ],
          ),
        ),
      );
    } else {
      return  Directionality(
        textDirection: TextDirection.ltr,
        child: Container(
          height: 84.hm(context),
          width: 390.wm(context),
          decoration: BoxDecoration(
            color: ColorUtils.white255,
          ),
          padding: EdgeInsets.symmetric(horizontal: 15.hpmm(context)),
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Container(
                height: 60.hm(context),
                width: 72.wm(context),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: TextButton(
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  onPressed: () async {
                    Get.off(()=>HomeScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [


                      Container(
                        height: 24.hm(context),
                        width: 24.wm(context),
                        decoration: BoxDecoration(
                            color: Colors.transparent
                        ),
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Image.asset(
                            isHomeFocus == true ? ImagePathUtils.homeIconFocusImagePath : ImagePathUtils.homeIconUnfocusImagePath,
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                          ),
                        ),
                      ),


                      SpacerWidget.spacerWidget(spaceHeight: 2.hm(context)),

                      Text(
                        "Home",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 12.spm(context),
                          color: isHomeFocus == true ? ColorUtils.blue210 : ColorUtils.black33,
                        ),
                      ),



                    ],
                  ),
                ),
              ),


              Container(
                height: 60.hm(context),
                width: 72.wm(context),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: TextButton(
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  onPressed: () async {
                    Get.off(()=>SearchScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [


                      Container(
                        height: 24.hm(context),
                        width: 24.wm(context),
                        decoration: BoxDecoration(
                            color: Colors.transparent
                        ),
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Image.asset(
                            isSearchFocus == true ? ImagePathUtils.searchIconFocusImagePath : ImagePathUtils.searchIconUnfocusImagePath,
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                          ),
                        ),
                      ),


                      SpacerWidget.spacerWidget(spaceHeight: 2.hm(context)),

                      Text(
                        "Search",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 12.spm(context),
                          color: isSearchFocus == true ? ColorUtils.blue210 : ColorUtils.black33,
                        ),
                      ),



                    ],
                  ),
                ),
              ),


              Container(
                height: 60.hm(context),
                width: 72.wm(context),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: TextButton(
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  onPressed: () async {
                    Get.off(()=>OrderTrackScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [


                      Container(
                        height: 24.hm(context),
                        width: 24.wm(context),
                        decoration: BoxDecoration(
                            color: Colors.transparent
                        ),
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Image.asset(
                            isTrackOrderFocus == true ? ImagePathUtils.orderTrackIconFocusImagePath : ImagePathUtils.orderTrackIconUnfocusImagePath,
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                          ),
                        ),
                      ),


                      SpacerWidget.spacerWidget(spaceHeight: 2.hm(context)),

                      Text(
                        "Track Order",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 12.spm(context),
                          color: isTrackOrderFocus == true ? ColorUtils.blue210 : ColorUtils.black33,
                        ),
                      ),



                    ],
                  ),
                ),
              ),


              Container(
                height: 60.hm(context),
                width: 72.wm(context),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: TextButton(
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  onPressed: () async {
                    Get.off(()=>CartScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [


                      Container(
                        height: 24.hm(context),
                        width: 24.wm(context),
                        decoration: BoxDecoration(
                            color: Colors.transparent
                        ),
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Image.asset(
                            isCartFocus == true ? ImagePathUtils.cartIconFocusImagePath : ImagePathUtils.cartIconUnfocusImagePath,
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                          ),
                        ),
                      ),


                      SpacerWidget.spacerWidget(spaceHeight: 2.hm(context)),

                      Text(
                        "Cart",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 12.spm(context),
                          color: isCartFocus == true ? ColorUtils.blue210 : ColorUtils.black33,
                        ),
                      ),



                    ],
                  ),
                ),
              ),


              Container(
                height: 60.hm(context),
                width: 72.wm(context),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: TextButton(
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  onPressed: () async {
                    Get.off(()=>ProfileScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [


                      Container(
                        height: 24.hm(context),
                        width: 24.wm(context),
                        decoration: BoxDecoration(
                            color: Colors.transparent
                        ),
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Image.asset(
                            isProfileFocus == true ? ImagePathUtils.profileFocusIconImagePath : ImagePathUtils.profileUnfocusIconImagePath,
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                          ),
                        ),
                      ),


                      SpacerWidget.spacerWidget(spaceHeight: 2.hm(context)),

                      Text(
                        "Profile",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 12.spm(context),
                          color: isProfileFocus == true ? ColorUtils.blue210 : ColorUtils.black33,
                        ),
                      ),



                    ],
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