import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:rahatak_food_delivery_app/controller/controller.dart';
import '../model/model.dart';

class LoginController {

  static Future<void> getUserLoginResponse({
    required Map<String,dynamic> data,
    required Function onSuccess,
    required Function onFail,
    required Function onExceptionFail,
  }) async {
    try {
      var response = await Dio().post(
        "${AppApiUrlController.appApiUrlController()}/auth/login",
        options: Options(
            headers: <String,String>{
              'Accept': 'application/json',
              'Content-Type': 'application/json',
            }
        ),
        data: jsonEncode(data),
      );
      if(response.statusCode == 200 || response.statusCode == 201) {
        await AppLocalStorageController.setSharedPreferencesString(key: "Login", stringValue: jsonEncode(response.data));
        onSuccess(response.data["message"]);
      } else {
        onFail(response.data["message"]);
      }
    } on DioException catch (e) {
      onExceptionFail(e.response?.data["message"]);
    }
  }


  static Future<LoginResponseModel?> checkLocalLoginResponse() async {
    LoginResponseModel? loginResponseModel;
    await AppLocalStorageController.getSharedPreferencesString(key: "Login").then((value) {
      if(value == null) {
        loginResponseModel = LoginResponseModel();
      } else {
        loginResponseModel = LoginResponseModel.fromJson(jsonDecode(value));
      }
    });
    return loginResponseModel;
  }



}