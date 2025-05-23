import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahatak_food_delivery_app/screen/screen.dart';
import 'package:rahatak_food_delivery_app/widget/widget.dart';

import '../utils/utils.dart';

class FilterSearchScreen extends StatelessWidget {
  FilterSearchScreen({super.key});


  @override
  Widget build(BuildContext context) {
    FilterSearchScreenWidget filterSearchScreenWidget = Get.put(FilterSearchScreenWidget(context: context));
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (canPop,onPopInvoked) async {
        Get.off(()=>SearchScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
      },
      child: Scaffold(
        body: filterSearchScreenWidget.filterSearchScreenWidget(context: context),
        bottomNavigationBar: BottomNavigationBarWidget().bottomNavigationBarWidget(
          context: context,
          isHomeFocus: false,
          isSearchFocus: true,
          isTrackOrderFocus: false,
          isCartFocus: false,
          isProfileFocus: false,
        ),
      ),
    );
  }
}
