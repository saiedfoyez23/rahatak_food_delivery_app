import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../utils/utils.dart';
import '../widget/widget.dart';

class LogoutScreen extends StatelessWidget {
  LogoutScreen({super.key});

  LogoutScreenWidget logoutScreenWidget = Get.put(LogoutScreenWidget());

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (canPop,onPopInvoked) {
        SystemNavigator.pop();
      },
      child: Scaffold(
        body: logoutScreenWidget.logoutScreenWidget(context: context),
        bottomNavigationBar: BottomNavigationBarWidget().bottomNavigationBarWidget(
          context: context,
          isHomeFocus: false,
          isSearchFocus: false,
          isTrackOrderFocus: false,
          isCartFocus: false,
          isProfileFocus: true,
        ),
      ),
    );
  }
}
