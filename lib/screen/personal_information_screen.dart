import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahatak_food_delivery_app/screen/screen.dart';
import 'package:rahatak_food_delivery_app/widget/widget.dart';

class PersonalInformationScreen extends StatelessWidget {
  PersonalInformationScreen({super.key});


  @override
  Widget build(BuildContext context) {
    PersonalInformationScreenWidget personalInformationScreenWidget = Get.put(PersonalInformationScreenWidget(context: context));
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (canPop,onPopInvoked) {
        Get.off(()=>ProfileScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
      },
      child: Scaffold(
        body: personalInformationScreenWidget.personalInformationScreenWidget(context: context),
      ),
    );
  }
}
