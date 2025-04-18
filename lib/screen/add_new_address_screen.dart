import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahatak_food_delivery_app/screen/screen.dart';
import 'package:rahatak_food_delivery_app/widget/widget.dart';

class AddNewAddressScreen extends StatelessWidget {
  AddNewAddressScreen({super.key});
  
  AddNewAddressScreenWidget addNewAddressScreenWidget = Get.put(AddNewAddressScreenWidget());
  
  
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (canPop,onPopInvoked) {
        Get.off(()=>OrderAddressScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
      },
      child: Scaffold(
        body: addNewAddressScreenWidget.addNewAddressScreenWidget(context: context),
      ),
    );
  }
}
