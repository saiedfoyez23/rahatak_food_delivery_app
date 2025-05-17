import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../utils/utils.dart';
import '../widget/widget.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileScreenWidget profileScreenWidget = Get.put(ProfileScreenWidget(context: context));
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (canPop,onPopInvoked) {
        SystemNavigator.pop();
      },
      child: Scaffold(
        body: profileScreenWidget.profileScreenWidget(context: context),
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