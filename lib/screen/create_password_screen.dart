import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahatak_food_delivery_app/screen/screen.dart';
import 'package:rahatak_food_delivery_app/widget/widget.dart';

class CreatePasswordScreen extends StatelessWidget {
  CreatePasswordScreen({super.key});
  
  CreatePasswordScreenWidget createPasswordScreenWidget = Get.put(CreatePasswordScreenWidget());
  
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (canPop,onPopInvoked) {
        Get.off(()=>ForgotPasswordScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
      },
      child: Scaffold(
        body: createPasswordScreenWidget.createPasswordScreenWidget(context: context),
      ),
    );
  }
}
