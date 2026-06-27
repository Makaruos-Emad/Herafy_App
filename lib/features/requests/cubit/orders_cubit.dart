import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herafy/features/requests/data/requests_api_service.dart';
import 'package:herafy/features/requests/model/requests_model.dart';
import 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(OrdersInitial());

  final api = RequestsApiService();

  void getClientOrders({required String clientId, required int state}) async {
    emit(OrdersLoading());

    try {
      final orders = await api.getClientOrders(
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

  final active =
      orders.where((o) => !finishedStatuses.contains(o.status)).toList();

  final finished =
      orders.where((o) => finishedStatuses.contains(o.status)).toList();

  return OrdersSplitResult(active: active, finished: finished);
}
