import 'package:flutter/material.dart';

class DesignUtils {

  static num designHeightMobile({required BuildContext context}) {
    if(MediaQuery.of(context).orientation.name == "portrait") {
      return 844;
    }else {
      return 390;
    }
  }


  static num designWidthMobile({required BuildContext context}) {
    if(MediaQuery.of(context).orientation.name == "portrait") {
      return 390;
    }else {
      return 844;
    }
  }

  static num designHeightTab({required BuildContext context}) {
    if(MediaQuery.of(context).orientation.name == "portrait") {
      return 1133;
    }else {
      return 744;
    }
  }


  static num designWidthTab({required BuildContext context}) {
    if(MediaQuery.of(context).orientation.name == "portrait") {
      return 744;
    }else {
      return 1133;
    }
  }
}