import 'dart:io';

import 'package:dio/dio.dart';
import 'package:herafy/core/api/api_client.dart';

class LoginTechApi extends ApiClient {
  Future<Response> addTechnical({
    required String fullName,
    required File profileImage,
    required String city,
    required String government,
    required double latitude,
    required double longitude,
    required int serviceCategoryId,
    required int experienceYears,
    required double inspectedPrice,
    required String bio,
  }) async {
    final formData = FormData.fromMap({
      'FullName': fullName,
      'Image': await MultipartFile.fromFile(profileImage.path),
      'City': city,
      'Government': government,
      'Latitude': latitude,
      'Longitude': longitude,
      'ServiceCategoryId': serviceCategoryId,
      'ExperienceYears': experienceYears,
      'InspectedPrice': inspectedPrice,
      'Bio': bio,
    });

    return await dio.post(
      "Technicain/AddTechnician",
      data: formData,
      options: await authorizedOptions(
        headers: {"Content-Type": "multipart/form-data"},
      ),
    );
  }

  Future<Response> addDocuments({
    required File faceImage,
    required File backImage,
  })async{
    final formData = FormData.fromMap({
      'FaceImage': await MultipartFile.fromFile(faceImage.path),
      'BackImage': await MultipartFile.fromFile(backImage.path),
    });
    return await dio.post(
      "Technicain/AddDocuments",
      data: formData,
      options: await authorizedOptions(
        headers: {"Content-Type": "multipart/form-data"},
      ),
    );
  }

}
