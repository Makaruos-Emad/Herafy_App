import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herafy/core/api/api_service.dart';
import 'package:herafy/features/requests/cubit/change_status_order_state.dart';
import 'change_status_order_state.dart';

class ChangeStatusOrderCubit extends Cubit<ChangeStatusOrderState> {
  ChangeStatusOrderCubit() : super(ChangeStatusOrderInitial());

  final api = ApiService();

  Future<void> changeStatusOrder({
    required int orderId,
    required int status,
  }) async {
  void changeStatusOrder({required int orderId, required int status}) async {
    emit(ChangeStatusOrderLoading());

    try {
      await api.changeStatusOrder(
        token:
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6ImVmMGExMjU2LTM4OTctNGY5Ni1iOWNjLTFkODk4ODk2NWVlMSIsIlRva2VuSWQiOiJkZDc0NjE0OS01YzFmLTQxNTgtYTRjNS1mYzZhYTc0OGFlZTUiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9tb2JpbGVwaG9uZSI6IisyMDEwMjQ4NDk2OTkiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJUZWNobmljaWFuIiwiZXhwIjoxNzgzMzE3MTc0LCJpc3MiOiJodHRwczovL2hlcmFmeS5ydW5hc3AubmV0LyIsImF1ZCI6Imh0dHBzOi8vaGVyYWZ5LnJ1bmFzcC5uZXQvIn0.WlMr98kNdVMbxNDvY9_BRvE61T93dZ0j2QdFNR1wGyQ",
        orderId: orderId,
        status: status,
        orderId: orderId,
        status: status,
        token:
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjlkMDc1YzIxLTkxNDItNGQyMC1hM2Q4LWQ5NDljZWMxYTFmMSIsIlRva2VuSWQiOiJhNzdlYWM1Mi0xNWNlLTQzZjktODAzYi00Mjg1YTFkZjI2YjMiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9tb2JpbGVwaG9uZSI6IisyMDEyMDU2MzcyNjIiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJDbGllbnQiLCJleHAiOjE3ODMyNjMwMjQsImlzcyI6Imh0dHBzOi8vaGVyYWZ5LnJ1bmFzcC5uZXQvIiwiYXVkIjoiaHR0cHM6Ly9oZXJhZnkucnVuYXNwLm5ldC8ifQ.rtQrr_ACTwv1fN8pO2ofQr8dcNCKE0ayPZZxzCRf5n4",
      );

      emit(ChangeStatusOrderSuccess());
    } catch (e) {
      emit(ChangeStatusOrderError(e.toString()));
      print("Error changing order status: $e");
    }
  }
}
