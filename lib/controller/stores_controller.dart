import 'package:dio/dio.dart' as dio;
import 'package:rahatak_food_delivery_app/controller/controller.dart';
import 'package:rahatak_food_delivery_app/model/model.dart';


class StoresController {

  static Future<StoresResponseModel> getStoresResponse({
    required Function onSuccess,
    required Function onFail,
    required Function onExceptionFail,
  }) async {
    try {

      final String accessToken = await LoginController.checkLocalLoginResponse().then((value) {
        return value?.data?.accessToken;
      });

      var response = await dio.Dio().get(
        "${AppApiUrlController.appApiUrlController()}/stores",
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
        return StoresResponseModel.fromJson(response.data);
      } else {
        onFail(response.data["message"]);
        return StoresResponseModel();
      }
    } on dio.DioException catch (e) {
      onExceptionFail(e.response?.data["message"]);
      return StoresResponseModel();
    }
  }

  static Future<SingleStoreDetailsResponseModel> getSingleStoresResponse({
    required String storeId,
    required Function onSuccess,
    required Function onFail,
    required Function onExceptionFail,
  }) async {
    try {

      final String accessToken = await LoginController.checkLocalLoginResponse().then((value) {
        return value?.data?.accessToken;
      });

      var response = await dio.Dio().get(
        "${AppApiUrlController.appApiUrlController()}/stores/${storeId}",
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
        return SingleStoreDetailsResponseModel.fromJson(response.data);
      } else {
        onFail(response.data["message"]);
        return SingleStoreDetailsResponseModel();
      }
    } on dio.DioException catch (e) {
      onExceptionFail(e.response?.data["message"]);
      return SingleStoreDetailsResponseModel();
    }
  }


  static Future<StoresResponseModel> getSearchStoresResponse({
    required String search,
    required Function onSuccess,
    required Function onFail,
    required Function onExceptionFail,
  }) async {
    try {

      final String accessToken = await LoginController.checkLocalLoginResponse().then((value) {
        return value?.data?.accessToken;
      });

      var response = await dio.Dio().get(
        "${AppApiUrlController.appApiUrlController()}/stores?searchTerm=${search}",
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
        return StoresResponseModel.fromJson(response.data);
      } else {
        onFail(response.data["message"]);
        return StoresResponseModel();
      }
    } on dio.DioException catch (e) {
      onExceptionFail(e.response?.data["message"]);
      return StoresResponseModel();
    }
  }



}