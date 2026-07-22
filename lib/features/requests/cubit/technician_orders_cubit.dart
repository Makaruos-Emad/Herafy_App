import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herafy/core/api/api_service.dart';
import 'package:herafy/features/requests/cubit/technician_orders_state.dart';
import 'package:herafy/features/requests/model/technician_order_model.dart';

class TechnicianOrdersCubit extends Cubit<TechnicianOrdersState> {
  TechnicianOrdersCubit() : super(TechnicianOrdersInitial());

  final api = ProfileApiService();

  Future<void> getTechnicianOrders() async {
    emit(TechnicianOrdersLoading());

    try {
      final List<TechnicianOrderModel> newTechnicianRequests = [];
      final List<TechnicianOrderModel> upcomingTechnicianRequests = [];
      final List<TechnicianOrderModel> historyTechnicianRequests = [];

      for (int state = 0; state <= 5; state++) {
        final orders = await api.getTechnicianOrders(
          state: state,
        );

        switch (state) {
          case 0:
            newTechnicianRequests.addAll(orders);
            break;

          case 1:
          case 3:
            upcomingTechnicianRequests.addAll(orders);
            break;

          case 2:
          case 4:
          case 5:
            historyTechnicianRequests.addAll(orders);
            break;
        }
      }

      emit(
        TechnicianOrdersSuccessSplit(
          newTechnicianRequests: newTechnicianRequests,
          upcomingTechnicianRequests: upcomingTechnicianRequests,
          historyTechnicianRequests: historyTechnicianRequests,
        ),
      );
    } catch (e) {
      emit(TechnicianOrdersError(e.toString()));
    }
  }
}
