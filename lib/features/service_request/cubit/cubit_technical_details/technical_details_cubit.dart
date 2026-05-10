import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:herafy/core/api/api_service.dart';

part 'technical_details_state.dart';

Map<String, dynamic>? details;
String? idTechnician;

class TechnicalDetailsCubit extends Cubit<TechnicalDetailsState> {
  TechnicalDetailsCubit() : super(TechnicalDetailsInitial());

  final ApiService apiService = ApiService();

  Future<void> getAllData(String id) async {
    emit(TechnicalDetailsLoading());

    try {
      final responses = await Future.wait([
        apiService.getTechnicianDetails(id: id),
        apiService.getTechniciansReviews(id: id),
        apiService.getPreviousWork(id: id),
      ]);
      details = responses[0].data;
      idTechnician = id;

      emit(
        TechnicalDetailsSuccess(
          details: responses[0].data,
          reviews: responses[1].data,
          previousWork: responses[2].data,
        ),
      );
    } catch (e) {
      emit(TechnicalDetailsError(e.toString()));
    }
  }

  Future<void> addOrder({
  required String clientId,
  required int serviceId,
  required String city,
  required String government,
  required String placeDetails,
  required String problemDetails,
  required DateTime scheduledDate,
  required TimeOfDay scheduledTime,
  required double inspectedPrice,
}) async {
  try {
    final formattedTime =
        "${scheduledTime.hour.toString().padLeft(2, '0')}:"
        "${scheduledTime.minute.toString().padLeft(2, '0')}:00";

    final response = await apiService.createOrder(
      clientId: clientId,
      technicianId: idTechnician!,
      serviceId: serviceId,
      city: city,
      government: government,
      placeDetails: placeDetails,
      problemDetails: problemDetails,
      scheduledDate: scheduledDate,
      scheduledTime: formattedTime,
      inspectedPrice: inspectedPrice,
    );

    print(response.data);
  } catch (e) {
    print(e.toString());
  }
}
}