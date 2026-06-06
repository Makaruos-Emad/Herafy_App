import 'dart:io';

import 'package:dio/dio.dart';
import 'package:herafy/features/requests/model/order_details_model.dart';
import 'package:herafy/features/requests/model/requests_model.dart';

class ApiService {
  late Dio dio;
  final String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjlkMDc1YzIxLTkxNDItNGQyMC1hM2Q4LWQ5NDljZWMxYTFmMSIsIlRva2VuSWQiOiJhNzdlYWM1Mi0xNWNlLTQzZjktODAzYi00Mjg1YTFkZjI2YjMiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9tb2JpbGVwaG9uZSI6IisyMDEyMDU2MzcyNjIiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJDbGllbnQiLCJleHAiOjE3ODMyNjMwMjQsImlzcyI6Imh0dHBzOi8vaGVyYWZ5LnJ1bmFzcC5uZXQvIiwiYXVkIjoiaHR0cHM6Ly9oZXJhZnkucnVuYXNwLm5ldC8ifQ.rtQrr_ACTwv1fN8pO2ofQr8dcNCKE0ayPZZxzCRf5n4";
  ApiService() {
    dio = Dio(BaseOptions(baseUrl: "https://herafy.runasp.net/api/"));
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
              "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjcwOTRiZjM3LTQ3YzgtNDgxMS05NGQ1LWZjM2NjNGUyMjNkYSIsIlRva2VuSWQiOiJiMTEyZTkwOC02ZDFjLTQyMjYtOGViYy1jZjI0MDExYTVkNDAiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9tb2JpbGVwaG9uZSI6IjAxMTU0NjA0MjU3IiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiQWRtaW4iLCJleHAiOjE3ODA1NzIwNjUsImlzcyI6Imh0dHBzOi8vaGVyYWZ5LnJ1bmFzcC5uZXQvIiwiYXVkIjoiaHR0cHM6Ly9oZXJhZnkucnVuYXNwLm5ldC8ifQ.J0I28ejeyK5Y8C1Fbf9o09n_mthYFUrt_rmWSUxINBA",
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
}
