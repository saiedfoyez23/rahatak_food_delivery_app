import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rahatak_food_delivery_app/utils/utils.dart';

class CustomSnackBar {

  void successCustomSnackBar({required BuildContext context, required message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "${message}",
          textAlign: TextAlign.center,
          style: GoogleFonts.openSans(
            fontSize: MediaQuery.of(context).size.height > 1000 ? 18.spt(context) : 18.spm(context),
            fontStyle: FontStyle.normal,
            color: ColorUtils.white255,
            fontWeight: FontWeight.w500,
          ),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: ColorUtils.green142,// Makes it floating
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height > 1000 ? 967.bpmt(context) : 677.bpmm(context), // Adjust position
          left: MediaQuery.of(context).size.height > 1000 ? 16.lpmt(context) : 16.lpmm(context),
          right: MediaQuery.of(context).size.height > 1000 ? 16.rpmt(context) : 16.rpmm(context),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height > 1000 ? 50.rt(context) : 50.rm(context)), // Rounded corners
        ),
        duration: Duration(seconds: 1),
        dismissDirection: DismissDirection.startToEnd,// Auto-dismiss after 3 seconds
      ),
    );
  }

  void errorCustomSnackBar({required BuildContext context, required message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "${message}",
          textAlign: TextAlign.center,
          style: GoogleFonts.openSans(
            fontSize: MediaQuery.of(context).size.height > 1000 ? 18.spt(context) : 18.spm(context),
            fontStyle: FontStyle.normal,
            color: ColorUtils.white255,
            fontWeight: FontWeight.w500,
          ),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: ColorUtils.red198,// Makes it floating
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height > 1000 ? 967.bpmt(context) : 677.bpmm(context), // Adjust position
          left: MediaQuery.of(context).size.height > 1000 ? 16.lpmt(context) : 16.lpmm(context),
          right: MediaQuery.of(context).size.height > 1000 ? 16.rpmt(context) : 16.rpmm(context),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height > 1000 ? 50.rt(context) : 50.rm(context)), // Rounded corners
        ),
        duration: Duration(seconds: 1),
        dismissDirection: DismissDirection.startToEnd,// Auto-dismiss after 3 seconds
      ),
    );
  }


  void normalCustomSnackBar({required BuildContext context, required message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "${message}",
          textAlign: TextAlign.center,
          style: GoogleFonts.openSans(
            fontSize: MediaQuery.of(context).size.height > 1000 ? 18.spt(context) : 18.spm(context),
            fontStyle: FontStyle.normal,
            color: ColorUtils.white255,
            fontWeight: FontWeight.w500,
          ),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: ColorUtils.black51,// Makes it floating
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height > 1000 ? 967.bpmt(context) : 677.bpmm(context), // Adjust position
          left: MediaQuery.of(context).size.height > 1000 ? 16.lpmt(context) : 16.lpmm(context),
          right: MediaQuery.of(context).size.height > 1000 ? 16.rpmt(context) : 16.rpmm(context),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height > 1000 ? 50.rt(context) : 50.rm(context)), // Rounded corners
        ),
        duration: Duration(seconds: 1),
        dismissDirection: DismissDirection.startToEnd,// Auto-dismiss after 3 seconds
      ),
    );
  }

}