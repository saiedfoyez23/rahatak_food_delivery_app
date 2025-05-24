import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahatak_food_delivery_app/screen/screen.dart';
import 'package:rahatak_food_delivery_app/widget/widget.dart';

class PaymentScreen extends StatelessWidget {
  PaymentScreen({super.key,required this.addressString,required this.data});
  final String addressString;
  final Map<String,dynamic> data;
  PaymentScreenWidget paymentScreenWidget = Get.put(PaymentScreenWidget());

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (canPop,onPopInvoked) {
        Get.delete<PaymentScreenWidget>(force: true);
        Get.off(()=>OrderAddressScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
      },
      child: Scaffold(
        body: paymentScreenWidget.paymentScreenWidget(context: context, addressId: addressString, data: data,),
      ),
    );
  }
}
