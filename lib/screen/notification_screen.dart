import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahatak_food_delivery_app/screen/screen.dart';
import 'package:rahatak_food_delivery_app/widget/widget.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});
  
  NotificationScreenWidget notificationScreenWidget = Get.put(NotificationScreenWidget());
  
  
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (canPop,onPopInvoked) {
        Get.off(()=>HomeScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
      },
      child: Scaffold(
        body: notificationScreenWidget.notificationScreenWidget(context: context),
      ),
    );
  }
}
