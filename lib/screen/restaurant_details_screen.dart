import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahatak_food_delivery_app/screen/screen.dart';
import 'package:rahatak_food_delivery_app/widget/widget.dart';

class RestaurantDetailsScreen extends StatelessWidget {
  RestaurantDetailsScreen({super.key,required this.storeId});
  final String storeId;

  @override
  Widget build(BuildContext context) {
    RestaurantDetailsScreenWidget restaurantDetailsScreenWidget = Get.put(RestaurantDetailsScreenWidget(context: context,storeId: storeId));
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (canPop,onPopInvoked) {
        Get.off(()=>HomeScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
      },
      child: Scaffold(
        body: restaurantDetailsScreenWidget.restaurantDetailsScreenWidget(context: context),
      ),
    );
  }
}
