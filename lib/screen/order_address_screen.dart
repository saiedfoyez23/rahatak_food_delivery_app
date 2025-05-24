import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahatak_food_delivery_app/screen/screen.dart';
import 'package:rahatak_food_delivery_app/widget/widget.dart';

class OrderAddressScreen extends StatelessWidget {
  OrderAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OrderAddressScreenWidget orderAddressScreenWidget = Get.put(OrderAddressScreenWidget(context: context));
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (canPop,onPopInvoked) {
        Get.off(()=>CartScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
      },
      child: Scaffold(
        body: orderAddressScreenWidget.orderAddressScreenWidget(context: context),
      ),
    );
  }
}
