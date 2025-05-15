import 'package:flutter/foundation.dart';

class AppApiUrlController {

  static String appApiUrlController() {
    if(kDebugMode) {
      return "http://192.168.10.160:5010/api/v1";
    } else {
      return "http://192.168.10.160:5010/api/v1";
    }
  }


}