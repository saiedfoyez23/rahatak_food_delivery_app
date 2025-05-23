import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahatak_food_delivery_app/screen/screen.dart';
import 'package:rahatak_food_delivery_app/widget/widget.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({super.key,required this.productId});
  final String productId;

  @override
  Widget build(BuildContext context) {
    ProductDetailsScreenWidget productDetailsScreenWidget = Get.put(ProductDetailsScreenWidget(context: context,productId: productId));
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (canPop,onPopInvoked) {
        Get.off(()=>HomeScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
      },
      child: Scaffold(
        body: productDetailsScreenWidget.productDetailsScreenWidget(context: context),
      ),
    );
  }
}
