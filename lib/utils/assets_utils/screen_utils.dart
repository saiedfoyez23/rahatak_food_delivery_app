import 'package:flutter/material.dart';

import '../utils.dart';

extension ScreenUtils on num {
  double hm(BuildContext context) {
    return ResponsiveUtils.getHeightMobile(context: context, height: this);
  }
  double ht(BuildContext context) {
    return ResponsiveUtils.getHeightTab(context: context, height: this);
  }
  double wm(BuildContext context) {
    return ResponsiveUtils.getWidthMobile(context: context, width: this);
  }
  double wt(BuildContext context) {
    return ResponsiveUtils.getWidthTab(context: context, width: this);
  }
  double lpmm(BuildContext context) {
    return ResponsiveUtils.getLeftMarginPaddingMobile(context: context, width: this);
  }
  double lpmt(BuildContext context) {
    return ResponsiveUtils.getLeftMarginPaddingTab(context: context, width: this);
  }
  double rpmm(BuildContext context) {
    return ResponsiveUtils.getRightMarginPaddingMobile(context: context, width: this);
  }
  double rpmt(BuildContext context) {
    return ResponsiveUtils.getRightMarginPaddingTab(context: context, width: this);
  }
  double tpmm(BuildContext context) {
    return ResponsiveUtils.getTopMarginPaddingMobile(context: context, height: this);
  }
  double tpmt(BuildContext context) {
    return ResponsiveUtils.getTopMarginPaddingTab(context: context, height: this);
  }
  double bpmm(BuildContext context) {
    return ResponsiveUtils.getBottomMarginPaddingMobile(context: context, height: this);
  }
  double bpmt(BuildContext context) {
    return ResponsiveUtils.getBottomMarginPaddingTab(context: context, height: this);
  }
  double vpmm(BuildContext context) {
    return ResponsiveUtils.getVerticalMarginPaddingMobile(context: context, height: this);
  }
  double vpmt(BuildContext context) {
    return ResponsiveUtils.getVerticalMarginPaddingTab(context: context, height: this);
  }
  double hpmm(BuildContext context) {
    return ResponsiveUtils.getHorizontalMarginPaddingMobile(context: context, width: this);
  }
  double hpmt(BuildContext context) {
    return ResponsiveUtils.getHorizontalMarginPaddingTab(context: context, width: this);
  }
  double spm(BuildContext context) {
    return ResponsiveUtils.getFontSizeMobile(context: context, fontSize: this);
  }
  double spt(BuildContext context) {
    return ResponsiveUtils.getFontSizeTab(context: context, fontSize: this);
  }
  double rm(BuildContext context) {
    return ResponsiveUtils.getRadiusMobile(context: context, borderRadius: this);
  }
  double rt(BuildContext context) {
    return ResponsiveUtils.getRadiusTab(context: context, borderRadius: this);
  }
  double sm(BuildContext context) {
    return ResponsiveUtils.getIconSizeMobile(context: context, iconSize: this);
  }
  double st(BuildContext context) {
    return ResponsiveUtils.getIconSizeTab(context: context, iconSize: this);
  }
}