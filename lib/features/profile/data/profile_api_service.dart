import 'dart:io';

import 'package:dio/dio.dart';
import 'package:herafy/core/api/api_client.dart';

class ProfileApiService extends ApiClient {
  Future<Response> getClientProfile() async {
    return await dio.get(
      "Client/Profile",
      options: await authorizedOptions(),
    );
  }

  Future<Response> updateProfile({
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
      options: await authorizedOptions(
        headers: {
          "Content-Type": "multipart/form-data",
        },
      ),
    );
  }

  Future<Response> getTechnicianProfile() async {
    return await dio.get(
      "Technicain/Profile",
      options: await authorizedOptions(),
    );
  }

  Future<Response> updateTechnicalProfile({
    required String fullName,
    required String bio,
    required int experienceYears,
    required double inspectedPrice,
    required String governorate,
    required String city,
    required File image,
  }) async {
    FormData formData = FormData.fromMap({
      "FullName": fullName,
      "ImageUrl": await MultipartFile.fromFile(image.path),
      "Bio": bio,
      "ExperienceYears": experienceYears,
      "InspectedPrice": inspectedPrice,
      "City": city,
      "Government": governorate,
    });

    return await dio.patch(
      "Technicain/Update",
      data: formData,
      options: await authorizedOptions(
        headers: {
          "Content-Type": "multipart/form-data",
        },
      ),
    );
  }

  Future<void> updateAvailability(bool isAvailable) async {
    await dio.patch(
      'Technicain/Availability',
      queryParameters: {'isAvailable': isAvailable},
      options: await authorizedOptions(),
    );
  }
}
