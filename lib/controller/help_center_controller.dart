import 'dart:convert';
import 'dart:io';
import 'package:rahatak_food_delivery_app/controller/controller.dart';
import 'package:dio/dio.dart' as dio;

class HelpCenterController {

  static Future<void> getHelpCenterResponse({
    required String name,
    required String email,
    required String message,
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

      Map<String,dynamic> data = {
        "name": name,
        "email": email,
        "message": message,
      };

      print(jsonEncode(data));



      dio.FormData formData = dio.FormData.fromMap({
        "data": jsonEncode(data),
        "image": image.path != "" ? await dio.MultipartFile.fromFile(image.path,filename: image.path.split('/').last,contentType: dio.DioMediaType(mimeTypeImage.split('/').first,mimeTypeImage.split('/').last)) : "",
      });




      var response = await dio.Dio().post(
        "${AppApiUrlController.appApiUrlController()}/supports",
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



}