import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rahatak_food_delivery_app/utils/utils.dart';

import '../screen/screen.dart';

class PaymentSuccessScreenWidget extends GetxController {

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(Duration(seconds: 5),() async {
      Get.delete<PaymentSuccessScreenWidget>(force: true);
      Get.off(()=>OrderTrackScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
    });
  }


  Widget paymentSuccessScreenWidget({required BuildContext context}) {
    return Container(
      height: 844.hm(context),
      width: 390.wm(context),
      decoration: BoxDecoration(
        color: ColorUtils.white248,
      ),
      child: CustomScrollView(
        slivers: [


          SliverToBoxAdapter(
            child: Container(
              height: 844.hm(context),
              width: 390.wm(context),
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              padding: EdgeInsets.symmetric(horizontal: 36.hpmm(context)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Container(
                    height: 100.hm(context),
                    width: 100.wm(context),
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

                  SpacerWidget.spacerWidget(spaceHeight: 12.hm(context)),


                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Payment Success".tr,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.tajawal(
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        fontSize: 18.spm(context),
                        color: ColorUtils.green142,
                        height: (35.hm(context) / 18.spm(context)),
                      ),
                    ),
                  ),


                ],
              ),
            ),
          )


        ],
      ),
    );
  }


}