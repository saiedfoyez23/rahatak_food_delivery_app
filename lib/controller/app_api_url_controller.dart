import 'package:flutter/foundation.dart';

class AppApiUrlController {

  static String appApiUrlController() {
    if(kDebugMode) {
      //return "http://192.168.10.43:5010/api/v1";
      return "http://172.252.13.83:5001/api/v1";
    } else {
      //return "http://192.168.10.43:5010/api/v1";
      return "http://172.252.13.83:5001/api/v1";
    }
  }


}