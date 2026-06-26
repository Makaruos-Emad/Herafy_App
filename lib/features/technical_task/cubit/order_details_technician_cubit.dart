import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herafy/core/api/api_service.dart';
import 'package:herafy/features/technical_task/cubit/order_details_technician_state.dart';

class OrderDetailsTechnicianCubit extends Cubit<OrderDetailsTechnicianState> {
  OrderDetailsTechnicianCubit() : super(OrderDetailsTechnicianInitial());

  final api = ApiService();

  void getOrderDetails({required int orderId}) async {
    emit(OrderDetailsTechnicianLoading());

    try {
      final order = await api.getOrderDetailsTechnician(
        token:
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6ImVmMGExMjU2LTM4OTctNGY5Ni1iOWNjLTFkODk4ODk2NWVlMSIsIlRva2VuSWQiOiJkZDc0NjE0OS01YzFmLTQxNTgtYTRjNS1mYzZhYTc0OGFlZTUiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9tb2JpbGVwaG9uZSI6IisyMDEwMjQ4NDk2OTkiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJUZWNobmljaWFuIiwiZXhwIjoxNzgzMzE3MTc0LCJpc3MiOiJodHRwczovL2hlcmFmeS5ydW5hc3AubmV0LyIsImF1ZCI6Imh0dHBzOi8vaGVyYWZ5LnJ1bmFzcC5uZXQvIn0.WlMr98kNdVMbxNDvY9_BRvE61T93dZ0j2QdFNR1wGyQ",
        orderId: orderId,
      );

      emit(OrderDetailsTechnicianSuccess(order));
    } catch (e) {
      emit(OrderDetailsTechnicianError(e.toString()));
    }
  }
}
