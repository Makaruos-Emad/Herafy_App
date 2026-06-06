import 'dart:io';

import 'package:dio/dio.dart';
import 'package:herafy/features/requests/model/order_details_model.dart';
import 'package:herafy/features/requests/model/requests_model.dart';

class ApiService {
  late Dio dio;
  final String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjlkMDc1YzIxLTkxNDItNGQyMC1hM2Q4LWQ5NDljZWMxYTFmMSIsIlRva2VuSWQiOiJhNzdlYWM1Mi0xNWNlLTQzZjktODAzYi00Mjg1YTFkZjI2YjMiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9tb2JpbGVwaG9uZSI6IisyMDEyMDU2MzcyNjIiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJDbGllbnQiLCJleHAiOjE3ODMyNjMwMjQsImlzcyI6Imh0dHBzOi8vaGVyYWZ5LnJ1bmFzcC5uZXQvIiwiYXVkIjoiaHR0cHM6Ly9oZXJhZnkucnVuYXNwLm5ldC8ifQ.rtQrr_ACTwv1fN8pO2ofQr8dcNCKE0ayPZZxzCRf5n4";
  final String technicianToken =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6ImVmMGExMjU2LTM4OTctNGY5Ni1iOWNjLTFkODk4ODk2NWVlMSIsIlRva2VuSWQiOiJkZDc0NjE0OS01YzFmLTQxNTgtYTRjNS1mYzZhYTc0OGFlZTUiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9tb2JpbGVwaG9uZSI6IisyMDEwMjQ4NDk2OTkiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJUZWNobmljaWFuIiwiZXhwIjoxNzgzMzE3MTc0LCJpc3MiOiJodHRwczovL2hlcmFmeS5ydW5hc3AubmV0LyIsImF1ZCI6Imh0dHBzOi8vaGVyYWZ5LnJ1bmFzcC5uZXQvIn0.WlMr98kNdVMbxNDvY9_BRvE61T93dZ0j2QdFNR1wGyQ';
  ApiService() {
    dio = Dio(BaseOptions(baseUrl: "https://herafy.runasp.net/api/"));
  }

  Future<Response> getClientProfile() async {
    return await dio.get(
      "Client/Profile",
      options: Options(headers: {"Authorization": "Bearer $token"}),
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
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "multipart/form-data",
        },
      ),
    );
  }

  Future<Response> getTechnicians({
    required int sorting,
    required int serviceId,
  }) async {
    return await dio.get(
      "Technicain/GetAllTechnicians",
      queryParameters: {"Sorting": sorting, "ServiceId": serviceId},
      options: Options(headers: {"Authorization": "Bearer $token"}),
    );
  }

  Future<Response> getTechnicianDetails({required String id}) async {
    return await dio.get(
      "Technicain/GetTechnicianDetails",
      queryParameters: {"id": id},
      options: Options(headers: {"Authorization": "Bearer $token"}),
    );
  }

  Future<Response> getTechniciansReviews({required String id}) async {
    return await dio.get(
      "Review/GetTechnicianReviews",
      queryParameters: {"TechnicianId": id},
      options: Options(headers: {"Authorization": "Bearer $token"}),
    );
  }

  Future<Response> getPreviousWork({required String id}) async {
    return await dio.get(
      "Order/GetTechnicianOrders",
      queryParameters: {"techId": id, "state": 4},
      options: Options(
        headers: {
          "Authorization":
              "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjcwOTRiZjM3LTQ3YzgtNDgxMS05NGQ1LWZjM2NjNGUyMjNkYSIsIlRva2VuSWQiOiJlMTg3NWQ2NC0zNTE4LTRjNDUtYjQ0Zi1hMjU0NjA3NzM4ZTQiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9tb2JpbGVwaG9uZSI6IjAxMTU0NjA0MjU3IiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiQWRtaW4iLCJleHAiOjE3ODMyODQwNTEsImlzcyI6Imh0dHBzOi8vaGVyYWZ5LnJ1bmFzcC5uZXQvIiwiYXVkIjoiaHR0cHM6Ly9oZXJhZnkucnVuYXNwLm5ldC8ifQ.F3f7PSuhDOzD63jeQZ9oItZOBuV_iObU9us5JnK1pMc",
        },
      ),
    );
  }

  Future<Response> createOrder({
    required String clientId,
    required String technicianId,
    required int serviceId,
    required String city,
    required String government,
    required String placeDetails,
    required String problemDetails,
    required DateTime scheduledDate,
    required String scheduledTime,
    required double inspectedPrice,
  }) async {
    return await dio.post(
      "Order/CreateOrder",
      data: {
        "clientId": clientId,
        "technicianId": technicianId,
        "serviceId": serviceId,
        "city": city,
        "government": government,
        "placeDetails": placeDetails,
        "problemDetails": problemDetails,
        "scheduledDate": scheduledDate.toIso8601String(),
        "scheduledTime": scheduledTime, // مثال: 08:00:00
        "inspectedPrice": inspectedPrice,
      },
      options: Options(headers: {"Authorization": "Bearer $token"}),
    );
  }

  Future<List<RequestsModel>> getClientOrders({
    required String token,
    required String clientId,
    required int state,
  }) async {
    final response = await dio.get(
      "Order/GetClientOrders",
      queryParameters: {"clientId": clientId, "state": state},
      options: Options(headers: {"Authorization": "Bearer $token"}),
    );

    return (response.data as List)
        .map((e) => RequestsModel.fromJson(e))
        .toList();
  }

  Future<OrderDetailsModel> getOrderDetails({
    required String token,
    required int orderId,
  }) async {
    final response = await dio.get(
      "Order/GetDetailsOrderClient",
      queryParameters: {"orderId": orderId},
      options: Options(headers: {"Authorization": "Bearer $token"}),
    );

    return OrderDetailsModel.fromJson(response.data);
  }

  Future<void> createComplaint({
    required String token,
    required int orderId,
    required String title,
    required String description,
  }) async {
    await dio.post(
      "Complaints/CreateComplaint",
      data: {"orderId": orderId, "title": title, "description": description},
      options: Options(headers: {"Authorization": "Bearer $token"}),
    );
  }

  Future<Response> getTechnicianProfile() async {
    return await dio.get(
      "Technicain/Profile",
      options: Options(headers: {"Authorization": "Bearer $technicianToken"}),
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
      options: Options(
        headers: {
          "Authorization": "Bearer $technicianToken",
          "Content-Type": "multipart/form-data",
        },
      ),
    );
  }

  Future<void> updateAvailability(bool isAvailable) async {
    await dio.patch(
      'Technicain/Availability',
      queryParameters: {'isAvailable': isAvailable},
      options: Options(headers: {"Authorization": "Bearer $technicianToken"}),
    );
  }
}
