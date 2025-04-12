import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahatak_food_delivery_app/utils/utils.dart';

class ProfileScreenWidget extends GetxController {


  Widget profileScreenWidget({required BuildContext context}) {
    if(MediaQuery.sizeOf(context).height > 1133) {
      return Container(
        height: 1133.ht(context),
        width: 744.wt(context),
        decoration: BoxDecoration(
          color: ColorUtils.white248,
        ),
        child: Center(
          child: Text("Profile"),
        ),
      );
    } else {
      return Container(
        height: 844.hm(context),
        width: 390.wm(context),
        decoration: BoxDecoration(
          color: ColorUtils.white248,
        ),
        child: Center(
          child: Text("Profile"),
        ),
      );
    }
  }


}