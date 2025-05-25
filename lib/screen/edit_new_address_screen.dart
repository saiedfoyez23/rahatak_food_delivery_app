import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahatak_food_delivery_app/screen/screen.dart';
import 'package:rahatak_food_delivery_app/widget/widget.dart';

class EditNewAddressScreen extends StatelessWidget {
  EditNewAddressScreen({super.key,required this.addressId});
  final String addressId;

  @override
  Widget build(BuildContext context) {
    EditNewAddressScreenWidget editNewAddressScreenWidget = Get.put(EditNewAddressScreenWidget(context: context,addressId: addressId));
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (canPop,onPopInvoked) {
        Get.off(()=>OrderAddressScreen(),duration: Duration(milliseconds: 300),transition: Transition.fadeIn,preventDuplicates: false);
      },
      child: Scaffold(
        body: editNewAddressScreenWidget.editNewAddressScreenWidget(context: context),
      ),
    );
  }
}
