import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahatak_food_delivery_app/screen/screen.dart';

import '../widget/widget.dart';

class RatingAndReviewScreen extends StatelessWidget {
  RatingAndReviewScreen({super.key});
  
  RatingAndReviewScreenWidget ratingAndReviewScreenWidget = Get.put(RatingAndReviewScreenWidget());

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (canPop,onPopInvoked) {
        Get.off(()=>ProfileScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
      },
      child: Scaffold(
        body: ratingAndReviewScreenWidget.ratingAndReviewScreenWidget(context: context),
      ),
    );
  }
}
