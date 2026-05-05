import 'dart:io';

import 'package:dio/dio.dart';

class ApiService {
  late Dio dio;

  ApiService() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://herafy.runasp.net/api/",
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );
  }

  Future<Response> getProfile(String token) async {
    return await dio.get(
      "Client/Profile",
      options: Options(headers: {"Authorization": "Bearer $token"}),
    );
  }

  Future<Response> updateProfile({
    required String token,
    required String name,
    required String governorate,
    required String city,
    required File image,
  }) async {
    FormData formData = FormData.fromMap({
      "FullName": name,
      "Government": governorate,
      "City": city,
      "ImageUrl": await MultipartFile.fromFile(image.path),
    });

    return await dio.patch(
      "Client/Update",
      data: formData,
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "multipart/form-data",
        },
      ),
    );
  }
}
