import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahatak_food_delivery_app/screen/screen.dart';

import '../utils/utils.dart';
import '../widget/widget.dart';

class SearchResultScreen extends StatelessWidget {
  SearchResultScreen({super.key,required this.categoryId});
  final String categoryId;



  @override
  Widget build(BuildContext context) {
    SearchResultScreenWidget searchResultScreenWidget = Get.put(SearchResultScreenWidget(context: context,categoryId: categoryId));
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (canPop,onPopInvoked) async {
        Get.off(()=>SearchScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
      },
      child: Scaffold(
        body: searchResultScreenWidget.searchResultScreenWidget(context: context),
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
