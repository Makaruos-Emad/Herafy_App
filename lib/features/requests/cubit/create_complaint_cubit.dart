import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herafy/features/requests/data/requests_api_service.dart';
import 'create_complaint_state.dart';

class CreateComplaintCubit extends Cubit<CreateComplaintState> {
  CreateComplaintCubit() : super(CreateComplaintInitial());

  final api = RequestsApiService();

  void createComplaint({
    required int orderId,
    required String title,
    required String description,
  }) async {
    emit(CreateComplaintLoading());

    try {
      await api.createComplaint(
        token:
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjlkMDc1YzIxLTkxNDItNGQyMC1hM2Q4LWQ5NDljZWMxYTFmMSIsIlRva2VuSWQiOiJhNzdlYWM1Mi0xNWNlLTQzZjktODAzYi00Mjg1YTFkZjI2YjMiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9tb2JpbGVwaG9uZSI6IisyMDEyMDU2MzcyNjIiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJDbGllbnQiLCJleHAiOjE3ODMyNjMwMjQsImlzcyI6Imh0dHBzOi8vaGVyYWZ5LnJ1bmFzcC5uZXQvIiwiYXVkIjoiaHR0cHM6Ly9oZXJhZnkucnVuYXNwLm5ldC8ifQ.rtQrr_ACTwv1fN8pO2ofQr8dcNCKE0ayPZZxzCRf5n4",
        orderId: orderId,
        title: title,
        description: description,
      );

      emit(CreateComplaintSuccess());
    } catch (e) {
      emit(CreateComplaintError(e.toString()));
    }
  }
}
