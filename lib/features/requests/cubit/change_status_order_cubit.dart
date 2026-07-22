import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herafy/core/api/api_service.dart';
import 'package:herafy/features/requests/cubit/change_status_order_state.dart';

class ChangeStatusOrderCubit extends Cubit<ChangeStatusOrderState> {
  ChangeStatusOrderCubit() : super(ChangeStatusOrderInitial());

  final api = RequestsApiService();

  Future<void> changeStatusOrder({
    required int orderId,
    required int status,
  }) async {
    emit(ChangeStatusOrderLoading());

    try {
      await api.changeStatusOrder(orderId: orderId, status: status);

      emit(ChangeStatusOrderSuccess());
    } catch (e) {
      emit(ChangeStatusOrderError(e.toString()));
      print("Error changing order status: $e");
    }
  }
}
