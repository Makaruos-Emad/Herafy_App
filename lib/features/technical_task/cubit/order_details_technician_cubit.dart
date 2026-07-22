import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herafy/features/technical_task/cubit/order_details_technician_state.dart';
import 'package:herafy/features/technical_task/data/technical_task_api_service.dart';

class OrderDetailsTechnicianCubit extends Cubit<OrderDetailsTechnicianState> {
  OrderDetailsTechnicianCubit() : super(OrderDetailsTechnicianInitial());

  final api =TechnicalTaskApiService();

  void getOrderDetails({required int orderId}) async {
    emit(OrderDetailsTechnicianLoading());

    try {
      final order = await api.getOrderDetailsTechnician(
        orderId: orderId,
      );

      emit(OrderDetailsTechnicianSuccess(order));
    } catch (e) {
      emit(OrderDetailsTechnicianError(e.toString()));
    }
  }
}
