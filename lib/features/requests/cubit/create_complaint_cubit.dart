import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herafy/core/api/api_service.dart';
import 'create_complaint_state.dart';

class CreateComplaintCubit extends Cubit<CreateComplaintState> {
  CreateComplaintCubit() : super(CreateComplaintInitial());

  final api = ApiService();

  void createComplaint({
    required int orderId,
    required String title,
    required String description,
  }) async {
    emit(CreateComplaintLoading());

    try {
      await api.createComplaint(
        token: "YOUR_TOKEN",
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
