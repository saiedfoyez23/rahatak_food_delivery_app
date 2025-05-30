import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahatak_food_delivery_app/widget/widget.dart';

class PaymentSuccessScreen extends StatelessWidget {
  PaymentSuccessScreen({super.key});
  
  PaymentSuccessScreenWidget paymentSuccessScreenWidget = Get.put(PaymentSuccessScreenWidget());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: paymentSuccessScreenWidget.paymentSuccessScreenWidget(context: context),
    );
  }
}
