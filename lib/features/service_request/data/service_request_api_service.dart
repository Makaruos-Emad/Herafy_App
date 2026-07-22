import 'package:dio/dio.dart';
import 'package:herafy/core/api/api_client.dart';

class ServiceRequestApiService extends ApiClient {
  Future<Response> getTechnicians({
    required int sorting,
    required int serviceId,
  }) async {
    return await dio.get(
      "Technicain/GetAllTechnicians",
      queryParameters: {"Sorting": sorting, "ServiceId": serviceId},
      options: await authorizedOptions(),
    );
  }

  Future<Response> getTechnicianDetails({required String id}) async {
    return await dio.get(
      "Technicain/GetTechnicianDetails",
      queryParameters: {"id": id},
      options: await authorizedOptions(),
    );
  }

  Future<Response> getTechniciansReviews({required String id}) async {
    return await dio.get(
      "Review/GetTechnicianReviews",
      queryParameters: {"TechnicianId": id},
      options: await authorizedOptions(),
    );
  }

  Future<Response> getPreviousWork({required String id}) async {
    return await dio.get(
      "Order/GetTechnicianOrders",
      queryParameters: {"techId": id, "state": 4},
      options:Options(
        headers: {
          "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjcwOTRiZjM3LTQ3YzgtNDgxMS05NGQ1LWZjM2NjNGUyMjNkYSIsIlRva2VuSWQiOiIyMWNlN2RkYy01ZWFjLTRkZjktODcxYi0zYTFkZjkwNzljZTUiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9tb2JpbGVwaG9uZSI6IjAxMTU0NjA0MjU3IiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiQWRtaW4iLCJleHAiOjE3ODczMzM0NTcsImlzcyI6Imh0dHBzOi8vaGVyYWZ5LnJ1bmFzcC5uZXQvIiwiYXVkIjoiaHR0cHM6Ly9oZXJhZnkucnVuYXNwLm5ldC8ifQ.THZMmbmuvuFCegi5R2TiU-gsbbxOJy3XPwtP5qIWWIQ"
        }
      ) ,
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
        "scheduledTime": scheduledTime,
        "inspectedPrice": inspectedPrice,
      },
      options: await authorizedOptions(),
    );
  }
}
