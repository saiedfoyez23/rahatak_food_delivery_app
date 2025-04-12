import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/utils.dart';
import '../widget/widget.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  CartScreenWidget cartScreenWidget = Get.put(CartScreenWidget());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: cartScreenWidget.cartScreenWidget(context: context),
      bottomNavigationBar: BottomNavigationBarWidget().bottomNavigationBarWidget(
        context: context,
        isHomeFocus: false,
        isSearchFocus: false,
        isTrackOrderFocus: false,
        isCartFocus: true,
        isProfileFocus: false,
      ),
    );
  }
}