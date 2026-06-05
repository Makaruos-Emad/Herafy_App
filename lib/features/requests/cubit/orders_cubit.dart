import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herafy/core/api/api_service.dart';
import 'package:herafy/features/requests/model/requests_model.dart';
import 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(OrdersInitial());

  final api = ApiService();

  void getClientOrders({required String clientId, required int state}) async {
    emit(OrdersLoading());

    try {
      final orders = await api.getClientOrders(
        token:
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjlkMDc1YzIxLTkxNDItNGQyMC1hM2Q4LWQ5NDljZWMxYTFmMSIsIlRva2VuSWQiOiJhNzdlYWM1Mi0xNWNlLTQzZjktODAzYi00Mjg1YTFkZjI2YjMiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9tb2JpbGVwaG9uZSI6IisyMDEyMDU2MzcyNjIiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJDbGllbnQiLCJleHAiOjE3ODMyNjMwMjQsImlzcyI6Imh0dHBzOi8vaGVyYWZ5LnJ1bmFzcC5uZXQvIiwiYXVkIjoiaHR0cHM6Ly9oZXJhZnkucnVuYXNwLm5ldC8ifQ.rtQrr_ACTwv1fN8pO2ofQr8dcNCKE0ayPZZxzCRf5n4",
        clientId: clientId,
        state: state,
      );

      final result = splitOrders(orders);

      emit(
        OrdersSuccessSplit(active: result.active, finished: result.finished),
      );
    } catch (e) {
      emit(OrdersError(e.toString()));
    }
  }
}

class OrdersSplitResult {
  final List<RequestsModel> active;
  final List<RequestsModel> finished;

  OrdersSplitResult({required this.active, required this.finished});
}

OrdersSplitResult splitOrders(List<RequestsModel> orders) {
  const finishedStatuses = ["ملغي", "مكتمل", "مرفوض"];

  final active = orders
      .where((o) => !finishedStatuses.contains(o.status))
      .toList();

  final finished = orders
      .where((o) => finishedStatuses.contains(o.status))
      .toList();

  return OrdersSplitResult(active: active, finished: finished);
}
