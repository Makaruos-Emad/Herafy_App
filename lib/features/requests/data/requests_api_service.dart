import 'package:herafy/core/api/api_client.dart';
import 'package:herafy/features/requests/model/order_details_model.dart';
import 'package:herafy/features/requests/model/requests_model.dart';

class RequestsApiService extends ApiClient {
  Future<List<RequestsModel>> getClientOrders({
    required String clientId,
    required int state,
  }) async {
    final response = await dio.get(
      "Order/GetClientOrders",
      queryParameters: {"clientId": clientId, "state": state},
      options: await authorizedOptions(),
    );

    return (response.data as List)
        .map((e) => RequestsModel.fromJson(e))
        .toList();
  }

  Future<OrderDetailsModel> getOrderDetails({
    required int orderId,
  }) async {
    final response = await dio.get(
      "Order/GetDetailsOrderClient",
      queryParameters: {"orderId": orderId},
      options: await authorizedOptions(),
    );

    return OrderDetailsModel.fromJson(response.data);
  }

  Future<void> createComplaint({
    required int orderId,
    required String title,
    required String description,
  }) async {
    await dio.post(
      "Complaints/CreateComplaint",
      data: {"orderId": orderId, "title": title, "description": description},
      options: await authorizedOptions(),
    );
  }
}
