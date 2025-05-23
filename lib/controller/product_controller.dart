import 'dart:convert';
import 'package:rahatak_food_delivery_app/controller/controller.dart';
import 'package:dio/dio.dart' as dio;

import '../model/model.dart';

class ProductController {

  static Future<void> getCategoriesResponse({
    required Function onSuccess,
    required Function onFail,
    required Function onExceptionFail,
  }) async {
    try {

      final String accessToken = await LoginController.checkLocalLoginResponse().then((value) {
        return value?.data?.accessToken;
      });

      var response = await dio.Dio().get(
        "${AppApiUrlController.appApiUrlController()}/categories",
        options: dio.Options(
          headers: <String,String>{
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${accessToken}',
          },
        ),
      );
      if(response.statusCode == 200 || response.statusCode == 201) {
        await AppLocalStorageController.setSharedPreferencesString(key: "Categories", stringValue: jsonEncode(response.data));
        onSuccess(response.data["message"]);
      } else {
        onFail(response.data["message"]);
      }
    } on dio.DioException catch (e) {
      onExceptionFail(e.response?.data["message"]);
    }
  }

  static Future<CategoriesResponseModel?> checkLocalCategoriesResponse() async {
    CategoriesResponseModel? categoriesResponseModel;
    await AppLocalStorageController.getSharedPreferencesString(key: "Categories").then((value) {
      if(value == null) {
        categoriesResponseModel = CategoriesResponseModel();
      } else {
        categoriesResponseModel = CategoriesResponseModel.fromJson(jsonDecode(value));
      }
    });
    return categoriesResponseModel;
  }


  static Future<ProductsResponseModel> getProductByCategoryResponse({
    required String categoryId,
    required Function onSuccess,
    required Function onFail,
    required Function onExceptionFail,
  }) async {
    try {

      final String accessToken = await LoginController.checkLocalLoginResponse().then((value) {
        return value?.data?.accessToken;
      });

      var response = await dio.Dio().get(
        "${AppApiUrlController.appApiUrlController()}/products?category=${categoryId}",
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
        return ProductsResponseModel.fromJson(response.data);
      } else {
        onFail(response.data["message"]);
        return ProductsResponseModel();
      }
    } on dio.DioException catch (e) {
      onExceptionFail(e.response?.data["message"]);
      return ProductsResponseModel();
    }
  }


  static Future<ProductsResponseModel> getProductResponse({
    required Function onSuccess,
    required Function onFail,
    required Function onExceptionFail,
  }) async {
    try {

      final String accessToken = await LoginController.checkLocalLoginResponse().then((value) {
        return value?.data?.accessToken;
      });

      var response = await dio.Dio().get(
        "${AppApiUrlController.appApiUrlController()}/products",
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
        return ProductsResponseModel.fromJson(response.data);
      } else {
        onFail(response.data["message"]);
        return ProductsResponseModel();
      }
    } on dio.DioException catch (e) {
      onExceptionFail(e.response?.data["message"]);
      return ProductsResponseModel();
    }
  }


  static Future<SingleProductResponseModel> getProductDetailsResponse({
    required String productId,
    required Function onSuccess,
    required Function onFail,
    required Function onExceptionFail,
  }) async {
    try {

      final String accessToken = await LoginController.checkLocalLoginResponse().then((value) {
        return value?.data?.accessToken;
      });

      var response = await dio.Dio().get(
        "${AppApiUrlController.appApiUrlController()}/products/${productId}",
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
        return SingleProductResponseModel.fromJson(response.data);
      } else {
        onFail(response.data["message"]);
        return SingleProductResponseModel();
      }
    } on dio.DioException catch (e) {
      onExceptionFail(e.response?.data["message"]);
      return SingleProductResponseModel();
    }
  }


}