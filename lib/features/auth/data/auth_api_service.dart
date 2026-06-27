import 'dart:io';

import 'package:dio/dio.dart';
import 'package:herafy/core/api/api_client.dart';

class AuthApiService extends ApiClient {
  Future<Response> getTokenFormPhoneNumber({
    required String phoneNumber,
    required int userType,
  }) async {
    return await dio.post(
      'Auth/LoginClientAndTechnician',
      data: {"phoneNumber": "+2$phoneNumber", "userType": userType},
    );
  }

  Future<Response> addClient({
    required String fullName,
    required File profileImage,
    required String city,
    required String government,
    required double latitude,
    required double longitude,
  }) async {
    final formData = FormData.fromMap({
      'FullName': fullName,
      'ProfileImageURL': await MultipartFile.fromFile(profileImage.path),
      'City': city,
      'Government': government,
      'Latitude': latitude,
      'Longitude': longitude,
    });

    return await dio.post(
      "Client/AddClient",
      data: formData,
      options: await authorizedOptions(
        headers: {
          "Content-Type": "multipart/form-data",
        },
      ),
    );
  }
}
