import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:rahatak_food_delivery_app/controller/controller.dart';
import 'package:rahatak_food_delivery_app/model/registration_response_model.dart';

class SignUpController {

  static Future<void> getCreateAccountResponse({
    required Map<String,dynamic> data,
    required Function onSuccess,
    required Function onFail,
    required Function onExceptionFail,
  }) async {
    try {

      var response = await Dio().post(
        "${AppApiUrlController.appApiUrlController()}/auth/user-sign-up",
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
        await AppLocalStorageController.setSharedPreferencesString(key: "Sign_up_response", stringValue: jsonEncode(response.data));
        onSuccess(response.data["message"]);
      } else {
        onFail(response.data["message"]);
      }
    } on DioException catch (e) {
      onExceptionFail(e.response?.data["message"]);
    }
  }


  static Future<RegistrationResponseModel?> checkLocalCreateAccountResponse() async {
    RegistrationResponseModel? registrationResponseModel;
    await AppLocalStorageController.getSharedPreferencesString(key: "Sign_up_response").then((value) {
      if(value == null) {
        registrationResponseModel = RegistrationResponseModel();
      } else {
        registrationResponseModel = RegistrationResponseModel.fromJson(jsonDecode(value));
      }
    });
    return registrationResponseModel;
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




}