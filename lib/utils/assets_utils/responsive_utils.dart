import 'package:flutter/material.dart';

import '../utils.dart';

class ResponsiveUtils {

  static double getHeightMobile({required BuildContext context,required num height}) {
    if(MediaQuery.of(context).orientation.name == "portrait" && MediaQuery.sizeOf(context).height == 844) {
      return (844 * (MediaQuery.sizeOf(context).height / DesignUtils.designHeightMobile(context: context)));
    } else if(MediaQuery.of(context).orientation.name == "landscape" && MediaQuery.sizeOf(context).height == 844) {
      return (390 * (MediaQuery.sizeOf(context).height / DesignUtils.designHeightMobile(context: context)));
    }  else {
      return (height * (MediaQuery.sizeOf(context).height / DesignUtils.designHeightMobile(context: context)));
    }
  }


  static double getHeightTab({required BuildContext context,required num height}) {
    if(MediaQuery.of(context).orientation.name == "portrait" && MediaQuery.sizeOf(context).height == 1133) {
      return (1133 * (MediaQuery.sizeOf(context).height / DesignUtils.designHeightTab(context: context)));
    } else if(MediaQuery.of(context).orientation.name == "landscape" && MediaQuery.sizeOf(context).height == 1133) {
      return (1133 * (MediaQuery.sizeOf(context).height / DesignUtils.designHeightTab(context: context)));
    }  else {
      return (height * (MediaQuery.sizeOf(context).height / DesignUtils.designHeightTab(context: context)));
    }
  }

  static double getWidthMobile({required BuildContext context,required num width}) {
    if(MediaQuery.of(context).orientation.name == "portrait" && width == 390) {
      return (390 * (MediaQuery.sizeOf(context).width / DesignUtils.designWidthMobile(context: context)));
    } else if(MediaQuery.of(context).orientation.name == "landscape" && width == 390) {
      return (844 * (MediaQuery.sizeOf(context).width / DesignUtils.designWidthMobile(context: context)));
    } else {
      return (width * (MediaQuery.sizeOf(context).width / DesignUtils.designWidthMobile(context: context)));
    }
  }


  static double getWidthTab({required BuildContext context,required num width}) {
    if(MediaQuery.of(context).orientation.name == "portrait" && width == 744) {
      return (744 * (MediaQuery.sizeOf(context).width / DesignUtils.designWidthTab(context: context)));
    } else if(MediaQuery.of(context).orientation.name == "landscape" && width == 744) {
      return (1133 * (MediaQuery.sizeOf(context).width / DesignUtils.designWidthTab(context: context)));
    } else {
      return (width * (MediaQuery.sizeOf(context).width / DesignUtils.designWidthTab(context: context)));
    }
  }



  static double getLeftMarginPaddingMobile({required BuildContext context,required num width}) {
    if(MediaQuery.of(context).orientation.name == "portrait" && width == 390) {
      return (390 * (MediaQuery.sizeOf(context).width / DesignUtils.designWidthMobile(context: context)));
    } else if(MediaQuery.of(context).orientation.name == "landscape" && width == 390) {
      return (844 * (MediaQuery.sizeOf(context).width / DesignUtils.designWidthMobile(context: context)));
    } else {
      return (width * (MediaQuery.sizeOf(context).width / DesignUtils.designWidthMobile(context: context)));
    }
  }

  static double getLeftMarginPaddingTab({required BuildContext context,required num width}) {
    if(MediaQuery.of(context).orientation.name == "portrait" && width == 744) {
      return (744 * (MediaQuery.sizeOf(context).width / DesignUtils.designWidthTab(context: context)));
    } else if(MediaQuery.of(context).orientation.name == "landscape" && width == 744) {
      return (1133 * (MediaQuery.sizeOf(context).width / DesignUtils.designWidthTab(context: context)));
    } else {
      return (width * (MediaQuery.sizeOf(context).width / DesignUtils.designWidthTab(context: context)));
    }
  }

  static double getRightMarginPaddingMobile({required BuildContext context,required num width}) {
    if(MediaQuery.of(context).orientation.name == "portrait" && width == 390) {
      return (390 * (MediaQuery.sizeOf(context).width / DesignUtils.designWidthMobile(context: context)));
    } else if(MediaQuery.of(context).orientation.name == "landscape" && width == 390) {
      return (844 * (MediaQuery.sizeOf(context).width / DesignUtils.designWidthMobile(context: context)));
    } else {
      return (width * (MediaQuery.sizeOf(context).width / DesignUtils.designWidthMobile(context: context)));
    }
  }


  static double getRightMarginPaddingTab({required BuildContext context,required num width}) {
    if(MediaQuery.of(context).orientation.name == "portrait" && width == 744) {
      return (744 * (MediaQuery.sizeOf(context).width / DesignUtils.designWidthTab(context: context)));
    } else if(MediaQuery.of(context).orientation.name == "landscape" && width == 744) {
      return (1133 * (MediaQuery.sizeOf(context).width / DesignUtils.designWidthTab(context: context)));
    } else {
      return (width * (MediaQuery.sizeOf(context).width / DesignUtils.designWidthTab(context: context)));
    }
  }

  static double getTopMarginPaddingMobile({required BuildContext context,required num height}) {
    if(MediaQuery.of(context).orientation.name == "portrait" && height == 844) {
      return (844 * (MediaQuery.sizeOf(context).height / DesignUtils.designHeightMobile(context: context)));
    } else if(MediaQuery.of(context).orientation.name == "landscape" && height == 844) {
      return (390 * (MediaQuery.sizeOf(context).height / DesignUtils.designHeightMobile(context: context)));
    } else {
      return (height * (MediaQuery.sizeOf(context).height / DesignUtils.designHeightMobile(context: context)));
    }
  }

  static double getTopMarginPaddingTab({required BuildContext context,required num height}) {
    if(MediaQuery.of(context).orientation.name == "portrait" && height == 1133) {
      return (1133 * (MediaQuery.sizeOf(context).height / DesignUtils.designHeightTab(context: context)));
    } else if(MediaQuery.of(context).orientation.name == "landscape" && height == 1133) {
      return (744 * (MediaQuery.sizeOf(context).height / DesignUtils.designHeightTab(context: context)));
    } else {
      return (height * (MediaQuery.sizeOf(context).height / DesignUtils.designHeightTab(context: context)));
    }
  }

  static double getBottomMarginPaddingMobile({required BuildContext context,required num height}) {
    if(MediaQuery.of(context).orientation.name == "portrait" && height == 844) {
      return (844 * (MediaQuery.sizeOf(context).height / DesignUtils.designHeightMobile(context: context)));
    } else if(MediaQuery.of(context).orientation.name == "landscape" && height == 844) {
      return (390 * (MediaQuery.sizeOf(context).height / DesignUtils.designHeightMobile(context: context)));
    } else {
      return (height * (MediaQuery.sizeOf(context).height / DesignUtils.designHeightMobile(context: context)));
    }
  }

  static double getBottomMarginPaddingTab({required BuildContext context,required num height}) {
    if(MediaQuery.of(context).orientation.name == "portrait" && height == 1133) {
      return (1133 * (MediaQuery.sizeOf(context).height / DesignUtils.designHeightTab(context: context)));
    } else if(MediaQuery.of(context).orientation.name == "landscape" && height == 1133) {
      return (744 * (MediaQuery.sizeOf(context).height / DesignUtils.designHeightTab(context: context)));
    } else {
      return (height * (MediaQuery.sizeOf(context).height / DesignUtils.designHeightTab(context: context)));
    }
  }


  static double getHorizontalMarginPaddingMobile({required BuildContext context,required num width}) {
    if(MediaQuery.of(context).orientation.name == "portrait" && width == 390) {
      return (390 * (MediaQuery.sizeOf(context).width / DesignUtils.designWidthMobile(context: context)));
    } else if(MediaQuery.of(context).orientation.name == "landscape" && width == 390) {
      return (844 * (MediaQuery.sizeOf(context).width / DesignUtils.designWidthMobile(context: context)));
    } else {
      return (width * (MediaQuery.sizeOf(context).width / DesignUtils.designWidthMobile(context: context)));
    }
  }

  static double getHorizontalMarginPaddingTab({required BuildContext context,required num width}) {
    if(MediaQuery.of(context).orientation.name == "portrait" && width == 744) {
      return (744 * (MediaQuery.sizeOf(context).width / DesignUtils.designWidthTab(context: context)));
    } else if(MediaQuery.of(context).orientation.name == "landscape" && width == 744) {
      return (1133 * (MediaQuery.sizeOf(context).width / DesignUtils.designWidthTab(context: context)));
    } else {
      return (width * (MediaQuery.sizeOf(context).width / DesignUtils.designWidthTab(context: context)));
    }
  }

  static double getVerticalMarginPaddingMobile({required BuildContext context,required num height}) {
    if(MediaQuery.of(context).orientation.name == "portrait" && height == 844) {
      return (844 * (MediaQuery.sizeOf(context).height / DesignUtils.designHeightMobile(context: context)));
    } else if(MediaQuery.of(context).orientation.name == "landscape" && height == 844) {
      return (390 * (MediaQuery.sizeOf(context).height / DesignUtils.designHeightMobile(context: context)));
    } else {
      return (height * (MediaQuery.sizeOf(context).height / DesignUtils.designHeightMobile(context: context)));
    }
  }


  static double getVerticalMarginPaddingTab({required BuildContext context,required num height}) {
    if(MediaQuery.of(context).orientation.name == "portrait" && height == 1133) {
      return (1133 * (MediaQuery.sizeOf(context).height / DesignUtils.designHeightTab(context: context)));
    } else if(MediaQuery.of(context).orientation.name == "landscape" && height == 1133) {
      return (744 * (MediaQuery.sizeOf(context).height / DesignUtils.designHeightTab(context: context)));
    } else {
      return (height * (MediaQuery.sizeOf(context).height / DesignUtils.designHeightTab(context: context)));
    }
  }


  static double getFontWidthMobile({required BuildContext context,required num fontSize}) {
    if(MediaQuery.of(context).orientation.name == "portrait" && fontSize == 390) {
      return (390 * (MediaQuery.sizeOf(context).width / DesignUtils.designWidthMobile(context: context)));
    } else if(MediaQuery.of(context).orientation.name == "landscape" && fontSize == 390) {
      return (844 * (MediaQuery.sizeOf(context).width / DesignUtils.designWidthMobile(context: context)));
    } else {
      return (fontSize * (MediaQuery.sizeOf(context).width / DesignUtils.designWidthMobile(context: context)));
    }
  }

  static double getFontWidthTab({required BuildContext context,required num fontSize}) {
    if(MediaQuery.of(context).orientation.name == "portrait" && fontSize == 744) {
      return (744 * (MediaQuery.sizeOf(context).width / DesignUtils.designWidthTab(context: context)));
    } else if(MediaQuery.of(context).orientation.name == "landscape" && fontSize == 744) {
      return (1133 * (MediaQuery.sizeOf(context).width / DesignUtils.designWidthTab(context: context)));
    } else {
      return (fontSize * (MediaQuery.sizeOf(context).width / DesignUtils.designWidthTab(context: context)));
    }
  }

  static double getFontHeightTab({required BuildContext context,required num fontSize}) {
    if(MediaQuery.of(context).orientation.name == "portrait" && fontSize == 1133) {
      return (1133 * (MediaQuery.sizeOf(context).height / DesignUtils.designHeightTab(context: context)));
    } else if(MediaQuery.of(context).orientation.name == "landscape" && fontSize == 1133) {
      return (744 * (MediaQuery.sizeOf(context).height / DesignUtils.designHeightTab(context: context)));
    } else {
      return (fontSize * (MediaQuery.sizeOf(context).height / DesignUtils.designHeightTab(context: context)));
    }
  }


  static double getFontHeightMobile({required BuildContext context,required num fontSize}) {
    if(MediaQuery.of(context).orientation.name == "portrait" && fontSize == 844) {
      return (844 * (MediaQuery.sizeOf(context).height / DesignUtils.designHeightMobile(context: context)));
    } else if(MediaQuery.of(context).orientation.name == "landscape" && fontSize == 844) {
      return (390 * (MediaQuery.sizeOf(context).height / DesignUtils.designHeightMobile(context: context)));
    } else {
      return (fontSize * (MediaQuery.sizeOf(context).height / DesignUtils.designHeightMobile(context: context)));
    }
  }


  static double getRadiusWidthMobile({required BuildContext context,required num radius}) {
    if(MediaQuery.of(context).orientation.name == "portrait" && radius == 390) {
      return (390 * (MediaQuery.sizeOf(context).width / DesignUtils.designWidthMobile(context: context)));
    } else if(MediaQuery.of(context).orientation.name == "landscape" && radius == 390) {
      return (844 * (MediaQuery.sizeOf(context).width / DesignUtils.designWidthMobile(context: context)));
    } else {
      return (radius * (MediaQuery.sizeOf(context).width / DesignUtils.designWidthMobile(context: context)));
    }
  }

  static double getRadiusWidthTab({required BuildContext context,required num radius}) {
    if(MediaQuery.of(context).orientation.name == "portrait" && radius == 744) {
      return (744 * (MediaQuery.sizeOf(context).width / DesignUtils.designWidthTab(context: context)));
    } else if(MediaQuery.of(context).orientation.name == "landscape" && radius == 744) {
      return (1133 * (MediaQuery.sizeOf(context).width / DesignUtils.designWidthTab(context: context)));
    } else {
      return (radius * (MediaQuery.sizeOf(context).width / DesignUtils.designWidthTab(context: context)));
    }
  }

  static double getRadiusHeightMobile({required BuildContext context,required num radius}) {
    if(MediaQuery.of(context).orientation.name == "portrait" && radius == 844) {
      return (844 * (MediaQuery.sizeOf(context).height / DesignUtils.designHeightMobile(context: context)));
    } else if(MediaQuery.of(context).orientation.name == "landscape" && radius == 844) {
      return (390 * (MediaQuery.sizeOf(context).height / DesignUtils.designHeightMobile(context: context)));
    } else {
      return (radius * (MediaQuery.sizeOf(context).height / DesignUtils.designHeightMobile(context: context)));
    }
  }

  static double getRadiusHeightTab({required BuildContext context,required num radius}) {
    if(MediaQuery.of(context).orientation.name == "portrait" && radius == 1133) {
      return (1133 * (MediaQuery.sizeOf(context).height / DesignUtils.designHeightTab(context: context)));
    } else if(MediaQuery.of(context).orientation.name == "landscape" && radius == 1133) {
      return (744 * (MediaQuery.sizeOf(context).height / DesignUtils.designHeightTab(context: context)));
    } else {
      return (radius * (MediaQuery.sizeOf(context).height / DesignUtils.designHeightTab(context: context)));
    }
  }


  static double getIconSizeWidthMobile({required BuildContext context,required num iconSize}) {
    if(MediaQuery.of(context).orientation.name == "portrait" && iconSize == 390) {
      return (390 * (MediaQuery.sizeOf(context).width / DesignUtils.designWidthMobile(context: context)));
    } else if(MediaQuery.of(context).orientation.name == "landscape" && iconSize == 390) {
      return (844 * (MediaQuery.sizeOf(context).width / DesignUtils.designWidthMobile(context: context)));
    }else {
      return (iconSize * (MediaQuery.sizeOf(context).width / DesignUtils.designWidthMobile(context: context)));
    }
  }


  static double getIconSizeWidthTab({required BuildContext context,required num iconSize}) {
    if(MediaQuery.of(context).orientation.name == "portrait" && iconSize == 744) {
      return (744 * (MediaQuery.sizeOf(context).width / DesignUtils.designWidthTab(context: context)));
    } else if(MediaQuery.of(context).orientation.name == "landscape" && iconSize == 744) {
      return (1133 * (MediaQuery.sizeOf(context).width / DesignUtils.designWidthTab(context: context)));
    }else {
      return (iconSize * (MediaQuery.sizeOf(context).width / DesignUtils.designWidthTab(context: context)));
    }
  }

  static double getIconSizeHeightMobile({required BuildContext context,required num iconSize}) {
    if(MediaQuery.of(context).orientation.name == "portrait" && iconSize == 844) {
      return (844 * (MediaQuery.sizeOf(context).height / DesignUtils.designHeightMobile(context: context)));
    } else if(MediaQuery.of(context).orientation.name == "landscape" && iconSize == 844) {
      return (390 * (MediaQuery.sizeOf(context).height / DesignUtils.designHeightMobile(context: context)));
    } else {
      return (iconSize * (MediaQuery.sizeOf(context).height / DesignUtils.designHeightMobile(context: context)));
    }
  }

  static double getIconSizeHeightTab({required BuildContext context,required num iconSize}) {
    if(MediaQuery.of(context).orientation.name == "portrait" && iconSize == 1133) {
      return (1133 * (MediaQuery.sizeOf(context).height / DesignUtils.designHeightTab(context: context)));
    } else if(MediaQuery.of(context).orientation.name == "landscape" && iconSize == 1133) {
      return (744 * (MediaQuery.sizeOf(context).height / DesignUtils.designHeightTab(context: context)));
    } else {
      return (iconSize * (MediaQuery.sizeOf(context).height / DesignUtils.designHeightTab(context: context)));
    }
  }

  static double getFontSizeMobile({required BuildContext context,required num fontSize}) {
    if(getFontHeightMobile(context: context, fontSize: fontSize) < getFontWidthMobile(context: context, fontSize: fontSize)) {
      return getFontHeightMobile(context: context, fontSize: fontSize);
    }else {
      return getFontWidthMobile(context: context, fontSize: fontSize);
    }
  }

  static double getFontSizeTab({required BuildContext context,required num fontSize}) {
    if(getFontHeightTab(context: context, fontSize: fontSize) < getFontWidthTab(context: context, fontSize: fontSize)) {
      return getFontHeightTab(context: context, fontSize: fontSize);
    }else {
      return getFontWidthTab(context: context, fontSize: fontSize);
    }
  }


  static double getRadiusMobile({required BuildContext context,required num borderRadius}) {
    if(getRadiusHeightMobile(context: context, radius: borderRadius) < getRadiusWidthMobile(context: context, radius: borderRadius)) {
      return getRadiusHeightMobile(context: context, radius: borderRadius);
    }else {
      return getRadiusWidthMobile(context: context, radius: borderRadius);
    }
  }


  static double getRadiusTab({required BuildContext context,required num borderRadius}) {
    if(getRadiusHeightTab(context: context, radius: borderRadius) < getRadiusWidthTab(context: context, radius: borderRadius)) {
      return getRadiusHeightTab(context: context, radius: borderRadius);
    }else {
      return getRadiusWidthTab(context: context, radius: borderRadius);
    }
  }


  static double getIconSizeMobile({required BuildContext context,required num iconSize}) {
    if(getIconSizeHeightMobile(context: context, iconSize: iconSize) < getIconSizeWidthMobile(context: context, iconSize: iconSize)) {
      return getIconSizeHeightMobile(context: context, iconSize: iconSize);
    }else {
      return getIconSizeWidthMobile(context: context, iconSize: iconSize);
    }
  }

  static double getIconSizeTab({required BuildContext context,required num iconSize}) {
    if(getIconSizeHeightTab(context: context, iconSize: iconSize) < getIconSizeWidthTab(context: context, iconSize: iconSize)) {
      return getIconSizeHeightTab(context: context, iconSize: iconSize);
    }else {
      return getIconSizeWidthTab(context: context, iconSize: iconSize);
    }
  }

}