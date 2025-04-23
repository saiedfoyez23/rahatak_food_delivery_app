import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahatak_food_delivery_app/screen/screen.dart';

import '../widget/widget.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  TermsAndConditionsScreen({super.key});


  TermsAndConditionsScreenWidget termsAndConditionsScreenWidget = Get.put(TermsAndConditionsScreenWidget());

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (canPop,onPopInvoked) {
        Get.off(()=>ProfileScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
      },
      child: Scaffold(
        body: termsAndConditionsScreenWidget.termsAndConditionsScreenWidget(context: context),
      ),
    );
  }
}
