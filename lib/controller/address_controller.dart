import 'dart:convert';

import 'package:rahatak_food_delivery_app/controller/controller.dart';
import 'package:dio/dio.dart' as dio;
import 'package:rahatak_food_delivery_app/model/model.dart';

class AddressController {


  static Future<void> getAddressResponse({
    required Function onSuccess,
    required Function onFail,
    required Function onExceptionFail,
  }) async {
    try {

      final String accessToken = await LoginController.checkLocalLoginResponse().then((value) {
        return value?.data?.accessToken;
      });

      var response = await dio.Dio().get(
        "${AppApiUrlController.appApiUrlController()}/addresses",
        options: dio.Options(
          headers: <String,String>{
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${accessToken}',
          },
        ),
      );
      if(response.statusCode == 200 || response.statusCode == 201) {
        await AppLocalStorageController.setSharedPreferencesString(key: "addresses", stringValue: jsonEncode(response.data));
        onSuccess(response.data["message"]);
      } else {
        onFail(response.data["message"]);
      }
    } on dio.DioException catch (e) {
      onExceptionFail(e.response?.data["message"]);
    }
  }

  static Future<AddressesResponseModel?> checkLocalAddressesResponse() async {
    AddressesResponseModel? addressesResponseModel;
    await AppLocalStorageController.getSharedPreferencesString(key: "addresses").then((value) {
      if(value == null) {
        addressesResponseModel = AddressesResponseModel();
      } else {
        addressesResponseModel = AddressesResponseModel.fromJson(jsonDecode(value));
      }
    });
    return addressesResponseModel;
  }


  static Future<void> getCreateAddressResponse({
    required Map<String,dynamic> data,
    required Function onSuccess,
    required Function onFail,
    required Function onExceptionFail,
  }) async {
    try {

      final String accessToken = await LoginController.checkLocalLoginResponse().then((value) {
        return value?.data?.accessToken;
      });

      var response = await dio.Dio().post(
        "${AppApiUrlController.appApiUrlController()}/addresses",
        options: dio.Options(
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
    } on dio.DioException catch (e) {
      print(e.response?.data);
      onExceptionFail(e.response?.data["message"]);
    }
  }


  static Future<void> getSingleAddressResponse({
    required String addressId,
    required Function onSuccess,
    required Function onFail,
    required Function onExceptionFail,
  }) async {
    try {

      final String accessToken = await LoginController.checkLocalLoginResponse().then((value) {
        return value?.data?.accessToken;
      });

      var response = await dio.Dio().get(
        "${AppApiUrlController.appApiUrlController()}/addresses/${addressId}",
        options: dio.Options(
          headers: <String,String>{
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${accessToken}',
          },
        ),
      );
      if(response.statusCode == 200 || response.statusCode == 201) {
        await AppLocalStorageController.setSharedPreferencesString(key: "single_addresses", stringValue: jsonEncode(response.data));
        onSuccess(response.data["message"]);
      } else {
        onFail(response.data["message"]);
      }
    } on dio.DioException catch (e) {
      onExceptionFail(e.response?.data["message"]);
    }
  }

  static Future<SingleAddressResponseModel?> checkLocalSingleAddressesResponse() async {
    SingleAddressResponseModel? singleAddressResponseModel;
    await AppLocalStorageController.getSharedPreferencesString(key: "single_addresses").then((value) {
      if(value == null) {
        singleAddressResponseModel = SingleAddressResponseModel();
      } else {
        singleAddressResponseModel = SingleAddressResponseModel.fromJson(jsonDecode(value));
      }
    });
    return singleAddressResponseModel;
  }



  static Future<void> getEditAddressResponse({
    required String addressId,
    required Map<String,dynamic> data,
    required Function onSuccess,
    required Function onFail,
    required Function onExceptionFail,
  }) async {
    try {

      final String accessToken = await LoginController.checkLocalLoginResponse().then((value) {
        return value?.data?.accessToken;
      });

      var response = await dio.Dio().put(
        "${AppApiUrlController.appApiUrlController()}/addresses/${addressId}",
        options: dio.Options(
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
    } on dio.DioException catch (e) {
      onExceptionFail(e.response?.data["message"]);
    }
  }


  static Future<void> getDeleteAddressResponse({
    required String addressId,
    required Function onSuccess,
    required Function onFail,
    required Function onExceptionFail,
  }) async {
    try {

      final String accessToken = await LoginController.checkLocalLoginResponse().then((value) {
        return value?.data?.accessToken;
      });

      var response = await dio.Dio().delete(
        "${AppApiUrlController.appApiUrlController()}/addresses/${addressId}",
        options: dio.Options(
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
    } on dio.DioException catch (e) {
      onExceptionFail(e.response?.data["message"]);
    }
  }




}