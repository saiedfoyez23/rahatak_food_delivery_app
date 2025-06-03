import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:rahatak_food_delivery_app/controller/controller.dart';

import '../model/model.dart';

class ProfileController {

  static Future<void> getUserProfileResponse({
    required Function onSuccess,
    required Function onFail,
    required Function onExceptionFail,
  }) async {
    try {

      final String accessToken = await LoginController.checkLocalLoginResponse().then((value) {
        return value?.data?.accessToken;
      });

      var response = await dio.Dio().get(
        "${AppApiUrlController.appApiUrlController()}/users/profile",
        options: dio.Options(
          headers: <String,String>{
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${accessToken}',
          },
        ),
      );
      if(response.statusCode == 200 || response.statusCode == 201) {
        await AppLocalStorageController.setSharedPreferencesString(key: "Profile", stringValue: jsonEncode(response.data));
        onSuccess(response.data["message"]);
      } else {
        onFail(response.data["message"]);
      }
    } on dio.DioException catch (e) {
      onExceptionFail(e.response?.data["message"]);
    }
  }

  static Future<ProfileResponseModel?> checkLocalProfileResponse() async {
    ProfileResponseModel? profileResponseModel;
    await AppLocalStorageController.getSharedPreferencesString(key: "Profile").then((value) {
      if(value == null) {
        profileResponseModel = ProfileResponseModel();
      } else {
        profileResponseModel =  ProfileResponseModel.fromJson(jsonDecode(value));
      }
    });
    return profileResponseModel;
  }

  static Future<void> getUserImageUpdateResponse({
    required String name,
    required File image,
    required Function onSuccess,
    required Function onFail,
    required Function onExceptionFail
  }) async {
    try {

      final String accessToken = await LoginController.checkLocalLoginResponse().then((value) {
        return value?.data?.accessToken;
      });

      String? mimeTypeImage = image.path == "" ? "" : CustomMimeType.getMimeType(image.path);
      print(image.path);


      dio.FormData formData = dio.FormData.fromMap({
        "image": image.path != "" ? await dio.MultipartFile.fromFile(image.path,filename: image.path.split('/').last,contentType: dio.DioMediaType(mimeTypeImage.split('/').first,mimeTypeImage.split('/').last)) : "",
      });




      var response = await dio.Dio().put(
        "${AppApiUrlController.appApiUrlController()}/users/image",
        data: formData,
        options: dio.Options(headers: <String, String>{
          'Content-Type': 'multipart/form-data',
          'Authorization': 'Bearer ${accessToken}'
        }),
      );
      print(jsonEncode(response.data));
      if (response.statusCode == 200 || response.statusCode == 201) {
        onSuccess(response.data["message"]);
      } else {
        onFail(response.data["message"]);
      }
    } on dio.DioException catch (e) {
      print(e.response?.data);
      onExceptionFail(e.response?.data["message"]);
    }
  }


  static Future<void> getUserDataUpdateResponse({
    required String contact,
    required String name,
    required Function onSuccess,
    required Function onFail,
    required Function onExceptionFail
  }) async {
    try {

      final String accessToken = await LoginController.checkLocalLoginResponse().then((value) {
        return value?.data?.accessToken;
      });

      Map<String,dynamic> data = {
        "contact": contact,
        "name": name
      };
      print(jsonEncode(data));


      var response = await dio.Dio().put(
        "${AppApiUrlController.appApiUrlController()}/users",
        data: jsonEncode(data),
        options: dio.Options(headers: <String, String>{
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${accessToken}'
        }),
      );
      print(jsonEncode(response.data));
      if (response.statusCode == 200 || response.statusCode == 201) {
        onSuccess(response.data["message"]);
      } else {
        onFail(response.data["message"]);
      }
    } on dio.DioException catch (e) {
      print(e.response?.data);
      onExceptionFail(e.response?.data["message"]);
    }
  }



  static Future<void> getUserAddressDataUpdateResponse({
    required String city,
    required String governorate,
    required String state,
    required String contact,
    required String name,
    required Function onSuccess,
    required Function onFail,
    required Function onExceptionFail
  }) async {
    try {

      final String accessToken = await LoginController.checkLocalLoginResponse().then((value) {
        return value?.data?.accessToken;
      });


      Map<String,dynamic> data = {
        "city": city,
        "contact": contact,
        "governorate": governorate,
        "name": name,
        "state": state
      };
      print(jsonEncode(data));

      var response = await dio.Dio().put(
        "${AppApiUrlController.appApiUrlController()}/users",
        data: jsonEncode(data),
        options: dio.Options(headers: <String, String>{
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${accessToken}'
        }),
      );
      print(jsonEncode(response.data));
      if (response.statusCode == 200 || response.statusCode == 201) {
        onSuccess(response.data["message"]);
      } else {
        onFail(response.data["message"]);
      }
    } on dio.DioException catch (e) {
      print(e.response?.data);
      onExceptionFail(e.response?.data["message"]);
    }
  }







}