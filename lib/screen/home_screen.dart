import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rahatak_food_delivery_app/utils/utils.dart';
import 'package:rahatak_food_delivery_app/widget/widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  HomeScreenWidget homeScreenWidget = Get.put(HomeScreenWidget());


  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (canPop,onPopInvoked) {
        SystemNavigator.pop();
      },
      child: Scaffold(
        body: homeScreenWidget.homeScreenWidget(context: context),
        bottomNavigationBar: BottomNavigationBarWidget().bottomNavigationBarWidget(
            context: context,
            isHomeFocus: true,
            isSearchFocus: false,
            isTrackOrderFocus: false,
            isCartFocus: false,
            isProfileFocus: false,
        ),
      ),
    );
  }
}
