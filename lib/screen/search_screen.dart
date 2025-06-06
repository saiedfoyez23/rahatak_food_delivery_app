import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/utils.dart';
import '../widget/widget.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SearchScreenWidget searchScreenWidget = Get.put(SearchScreenWidget(context: context));
    return Scaffold(
      body: searchScreenWidget.searchScreenWidget(context: context),
      bottomNavigationBar: BottomNavigationBarWidget().bottomNavigationBarWidget(
        context: context,
        isHomeFocus: false,
        isSearchFocus: true,
        isTrackOrderFocus: false,
        isCartFocus: false,
        isProfileFocus: false,
      ),
    );
  }
}
