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



}