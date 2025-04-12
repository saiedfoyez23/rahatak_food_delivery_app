import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/utils.dart';
import '../widget/widget.dart';

class OrderTrackScreen extends StatelessWidget {
  OrderTrackScreen({super.key});

  OrderTrackScreenWidget orderTrackScreenWidget = Get.put(OrderTrackScreenWidget());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: orderTrackScreenWidget.orderTrackScreenWidget(context: context),
      bottomNavigationBar: BottomNavigationBarWidget().bottomNavigationBarWidget(
        context: context,
        isHomeFocus: false,
        isSearchFocus: false,
        isTrackOrderFocus: true,
        isCartFocus: false,
        isProfileFocus: false,
      ),
    );
  }
}
