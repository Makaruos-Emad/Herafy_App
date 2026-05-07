import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:herafy/core/api/api_service.dart';
import 'package:herafy/features/service_request/data/best_tech_model.dart';
import 'package:herafy/features/service_request/data/sorted_type_tech.dart';
import 'service_requist_state.dart';

class ServiceRequestCubit extends Cubit<ServiceRequestState> {
  ServiceRequestCubit(this.apiService, this.serviceId)
      : super(ServiceRequestInitial());

  final ApiService apiService;
  final int serviceId;

  Future<void> getTechnicians(SortType type) async {
    emit(ServiceRequestLoading());

    try {
      final sortingNumber = _mapSortType(type);

      final response = await apiService.getTechnicians(
        token: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjMxOTVmMDAyLWU2ZjktNGNiNy05YzYxLTZjZGIzNmViZDk1NSIsIlRva2VuSWQiOiIzM2EzYmVhNy1mOTQ5LTQ3NTktYjYzZS1kMzdkMzIwN2EwZjIiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9tb2JpbGVwaG9uZSI6IisyMDEyNzExMDA0OTQiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJDbGllbnQiLCJleHAiOjE3Nzk3NjgwMDYsImlzcyI6Imh0dHBzOi8vaGVyYWZ5LnJ1bmFzcC5uZXQvIiwiYXVkIjoiaHR0cHM6Ly9oZXJhZnkucnVuYXNwLm5ldC8ifQ.Qcb8by4bS9IL9tBWPSaC9AQRlPuQjOqVm6cxpiRrN94", // 👈 حط التوكن هنا
        sorting: sortingNumber,
        serviceId: serviceId,
      );

      final List list = response.data;

      final technicians = list
          .map((e) => BestTechnicalModel.fromJson(e))
          .toList();

      emit(ServiceRequestSuccess(
        technicians: technicians,
        selectedSort: type,
      ));
    } on DioException catch (e) {
      emit(ServiceRequestError(
        e.response?.data.toString() ?? "حدث خطأ",
      ));
    }
  }

  int _mapSortType(SortType type) {
    switch (type) {
      case SortType.topRated:
        return 1;
      case SortType.nearest:
        return 2;
      case SortType.lowestPrice:
        return 3;
      case SortType.availableNow:
        return 4;
    }
  }
}