import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:rahatak_food_delivery_app/controller/controller.dart';

class ForgotPasswordController {

  static Future<void> getForgotPasswordResponse({
    required Map<String,dynamic> data,
    required Function onSuccess,
    required Function onFail,
    required Function onExceptionFail,
  }) async {
    try {
      var response = await Dio().post(
        "${AppApiUrlController.appApiUrlController()}/auth/send-otp",
        options: Options(
          headers: <String,String>{
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
        data: jsonEncode(data),
      );
      print(jsonEncode(response.data));
      if(response.statusCode == 200 || response.statusCode == 201) {
        onSuccess(response.data["message"]);
      } else {
        onFail(response.data["message"]);
      }
    } on DioException catch (e) {
      onExceptionFail(e.response?.data["message"]);
    }
  }



  static Future<void> getResendOtpResponse({
    required Map<String,dynamic> data,
    required Function onSuccess,
    required Function onFail,
    required Function onExceptionFail,
  }) async {
    try {

      var response = await Dio().post(
        "${AppApiUrlController.appApiUrlController()}/auth/send-otp",
        options: Options(
          headers: <String,String>{
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
        data: jsonEncode(data),
      );
      print(jsonEncode(response.data));
      if(response.statusCode == 200 || response.statusCode == 201) {
        onSuccess(response.data["message"]);
      } else {
        onFail(response.data["message"]);
      }
    } on DioException catch (e) {
      onExceptionFail(e.response?.data["message"]);
    }
  }

  static Future<void> getVerifyOtpResponse({
    required Map<String,dynamic> data,
    required Function onSuccess,
    required Function onFail,
    required Function onExceptionFail,
  }) async {
    try {

      var response = await Dio().post(
        "${AppApiUrlController.appApiUrlController()}/auth/verify-otp",
        options: Options(
          headers: <String,String>{
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
        data: jsonEncode(data),
      );
      print(jsonEncode(response.data));
      if(response.statusCode == 200 || response.statusCode == 201) {
        onSuccess(response.data["message"]);
      } else {
        onFail(response.data["message"]);
      }
    } on DioException catch (e) {
      onExceptionFail(e.response?.data["message"]);
    }
  }


  static Future<void> getResetPasswordResponse({
    required Map<String,dynamic> data,
    required Function onSuccess,
    required Function onFail,
    required Function onExceptionFail,
  }) async {
    try {

      var response = await Dio().post(
        "${AppApiUrlController.appApiUrlController()}/auth/reset-forgotten-password",
        options: Options(
          headers: <String,String>{
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
        data: jsonEncode(data),
      );
      print(jsonEncode(response.data));
      if(response.statusCode == 200 || response.statusCode == 201) {
        onSuccess(response.data["message"]);
      } else {
        onFail(response.data["message"]);
      }
    } on DioException catch (e) {
      onExceptionFail(e.response?.data["message"]);
    }
  }


  static Future<void> getChangePasswordResponse({
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
        "${AppApiUrlController.appApiUrlController()}/auth/change-password",
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
      onExceptionFail(e.response?.data["message"]);
    }
  }

}