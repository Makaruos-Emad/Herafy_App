import 'package:herafy/core/api/api_client.dart';
import 'package:herafy/features/technical_task/model/order_details_technician_model.dart';

class TechnicalTaskApiService extends ApiClient{
    Future<OrderDetailsTechnicianModel> getOrderDetailsTechnician({
    required int orderId,
  }) async {
    final response = await dio.get(
      "Order/GetDetailsOrderTechnician",
      queryParameters: {"orderId": orderId},
      options: await authorizedOptions(),
    );

    return OrderDetailsTechnicianModel.fromJson(response.data);
  }

}