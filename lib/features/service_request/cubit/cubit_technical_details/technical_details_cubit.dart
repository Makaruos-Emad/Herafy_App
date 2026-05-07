import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:herafy/core/api/api_service.dart';

part 'technical_details_state.dart';

class TechnicalDetailsCubit extends Cubit<TechnicalDetailsState> {
  TechnicalDetailsCubit()
      : super(TechnicalDetailsInitial());

  final ApiService apiService = ApiService();

   Future<void> getAllData(String id) async {
  emit(TechnicalDetailsLoading());

  try {
    final responses = await Future.wait([
      apiService.getTechnicianDetails(id: id),
      apiService.getTechniciansReviews(id: id),
      apiService.getPreviousWork(id: id),
    ]);

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
}