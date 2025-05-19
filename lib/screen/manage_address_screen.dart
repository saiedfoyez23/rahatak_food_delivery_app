import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahatak_food_delivery_app/screen/screen.dart';

import '../widget/widget.dart';

class ManageAddressScreen extends StatelessWidget {
  ManageAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ManageAddressScreenWidget manageAddressScreenWidget = Get.put(ManageAddressScreenWidget(context: context));
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (canPop,onPopInvoked) {
        Get.off(()=>ProfileScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
      },
      child: Scaffold(
        body: manageAddressScreenWidget.manageAddressScreenWidget(context: context),
      ),
    );
  }
}
