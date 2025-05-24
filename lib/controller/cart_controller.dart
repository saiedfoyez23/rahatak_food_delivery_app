import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:rahatak_food_delivery_app/controller/controller.dart';
import 'package:rahatak_food_delivery_app/model/cart_response_model.dart';

class CartController {

  static Future<void> getCartResponse({
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
        "${AppApiUrlController.appApiUrlController()}/carts",
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



  static Future<CartResponseModel> getCartProductResponse({
    required Function onSuccess,
    required Function onFail,
    required Function onExceptionFail,
  }) async {
    try {

      final String accessToken = await LoginController.checkLocalLoginResponse().then((value) {
        return value?.data?.accessToken;
      });

      var response = await Dio().get(
        "${AppApiUrlController.appApiUrlController()}/carts",
        options: Options(
          headers: <String,String>{
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${accessToken}',
          },
        ),
      );
      if(response.statusCode == 200 || response.statusCode == 201) {
        await AppLocalStorageController.setSharedPreferencesString(key: "Carts", stringValue: jsonEncode(response.data));
        onSuccess(response.data["message"]);
        return CartResponseModel.fromJson(response.data);
      } else {
        onFail(response.data["message"]);
        return CartResponseModel();
      }
    } on DioException catch (e) {
      onExceptionFail(e.response?.data["message"]);
      return CartResponseModel();
    }
  }


  static Future<CartResponseModel?> checkLocalCartResponse() async {
    CartResponseModel? cartResponseModel;
    await AppLocalStorageController.getSharedPreferencesString(key: "Carts").then((value) {
      if(value == null) {
        cartResponseModel = CartResponseModel();
      } else {
        cartResponseModel = CartResponseModel.fromJson(jsonDecode(value));
      }
    });
    return cartResponseModel;
  }

  static Future<void> getCartProductIncreaseResponse({
    required String productId,
    required Function onSuccess,
    required Function onFail,
    required Function onExceptionFail,
  }) async {
    try {

      final String accessToken = await LoginController.checkLocalLoginResponse().then((value) {
        return value?.data?.accessToken;
      });

      var response = await Dio().patch(
        "${AppApiUrlController.appApiUrlController()}/carts/increase/${productId}",
        options: Options(
          headers: <String,String>{
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${accessToken}',
          },
        ),
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


  static Future<void> getCartProductDecreaseResponse({
    required String productId,
    required Function onSuccess,
    required Function onFail,
    required Function onExceptionFail,
  }) async {
    try {

      final String accessToken = await LoginController.checkLocalLoginResponse().then((value) {
        return value?.data?.accessToken;
      });

      var response = await Dio().patch(
        "${AppApiUrlController.appApiUrlController()}/carts/decrease/${productId}",
        options: Options(
          headers: <String,String>{
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${accessToken}',
          },
        ),
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


  static Future<void> getCartProductDeleteResponse({
    required String productId,
    required Function onSuccess,
    required Function onFail,
    required Function onExceptionFail,
  }) async {
    try {

      final String accessToken = await LoginController.checkLocalLoginResponse().then((value) {
        return value?.data?.accessToken;
      });

      var response = await Dio().delete(
        "${AppApiUrlController.appApiUrlController()}/carts/${productId}",
        options: Options(
          headers: <String,String>{
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${accessToken}',
          },
        ),
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