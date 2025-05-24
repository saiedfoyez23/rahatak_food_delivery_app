import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:rahatak_food_delivery_app/controller/controller.dart';
class OrderController {


  static Future<void> getOrderResponse({
    required Map<String,dynamic> data,
    required Function onSuccess,
    required Function onFail,
    required Function onExceptionFail,
  }) async {
    try {

      final String accessToken = await LoginController.checkLocalLoginResponse().then((value) {
        return value?.data?.accessToken;
      });

      var response = await Dio().post(
        "${AppApiUrlController.appApiUrlController()}/orders",
        options: Options(
          headers: <String,String>{
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${accessToken}',
          },
        ),
        data: jsonEncode(data),
      );
      if(response.statusCode == 200 || response.statusCode == 201) {
        onSuccess(response.data["message"]);
      } else {
        onFail(response.data["message"]);
      }
    } on DioException catch (e) {
      print(e);
      onExceptionFail(e.response?.data["message"]);
    }
  }



}