import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahatak_food_delivery_app/widget/widget.dart';

class PaymentFailedScreen extends StatelessWidget {
  PaymentFailedScreen({super.key});
  
  PaymentFailedScreenWidget paymentFailedScreenWidget = Get.put(PaymentFailedScreenWidget());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: paymentFailedScreenWidget.paymentFailedScreenWidget(context: context),
    );
  }
}
