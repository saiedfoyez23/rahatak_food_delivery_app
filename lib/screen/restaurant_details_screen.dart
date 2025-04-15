import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahatak_food_delivery_app/widget/widget.dart';

class RestaurantDetailsScreen extends StatelessWidget {
  RestaurantDetailsScreen({super.key});
  
  RestaurantDetailsScreenWidget restaurantDetailsScreenWidget = Get.put(RestaurantDetailsScreenWidget());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: restaurantDetailsScreenWidget.restaurantDetailsScreenWidget(context: context),
    );
  }
}
