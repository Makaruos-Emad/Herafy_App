import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herafy/core/api/api_service.dart';
import 'package:herafy/features/requests/cubit/technician_orders_state.dart';
import 'package:herafy/features/requests/model/technician_order_model.dart';

class TechnicianOrdersCubit extends Cubit<TechnicianOrdersState> {
  TechnicianOrdersCubit() : super(TechnicianOrdersInitial());

  final api = ApiService();

  void getTechnicianOrders({required String techId, required int state}) async {
    emit(TechnicianOrdersLoading());

    try {
      final orders = await api.getTechnicianOrders(
        token:
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6ImVmMGExMjU2LTM4OTctNGY5Ni1iOWNjLTFkODk4ODk2NWVlMSIsIlRva2VuSWQiOiJkZDc0NjE0OS01YzFmLTQxNTgtYTRjNS1mYzZhYTc0OGFlZTUiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9tb2JpbGVwaG9uZSI6IisyMDEwMjQ4NDk2OTkiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJUZWNobmljaWFuIiwiZXhwIjoxNzgzMzE3MTc0LCJpc3MiOiJodHRwczovL2hlcmFmeS5ydW5hc3AubmV0LyIsImF1ZCI6Imh0dHBzOi8vaGVyYWZ5LnJ1bmFzcC5uZXQvIn0.WlMr98kNdVMbxNDvY9_BRvE61T93dZ0j2QdFNR1wGyQ",
        techId: techId,
        state: state,
      );

      final result = splitOrders(orders);

      emit(
        TechnicianOrdersSuccessSplit(
          newTechnicianRequests: result.newTechnicianRequests,
          upcomingTechnicianRequests: result.upcomingTechnicianRequests,
          historyTechnicianRequests: result.historyTechnicianRequests,
        ),
      );
    } catch (e) {
      emit(TechnicianOrdersError(e.toString()));
    }
  }
}

class TechnicianOrdersSplitResult {
  final List<TechnicianOrderModel> newTechnicianRequests;
  final List<TechnicianOrderModel> upcomingTechnicianRequests;
  final List<TechnicianOrderModel> historyTechnicianRequests;

  TechnicianOrdersSplitResult({
    required this.newTechnicianRequests,
    required this.upcomingTechnicianRequests,
    required this.historyTechnicianRequests,
  });
}

TechnicianOrdersSplitResult splitOrders(List<TechnicianOrderModel> orders) {
  const historyStatuses = ["مكتمل", "مرفوض", "ملغي"];

  const upcomingStatuses = ["تم القبول", "قيد التنفيذ"];

  const newStatuses = ["قيد الانتظار"];

  final history = orders
      .where((o) => historyStatuses.contains(o.state))
      .toList();

  final upcoming = orders
      .where((o) => upcomingStatuses.contains(o.state))
      .toList();

  final newRequests = orders
      .where((o) => newStatuses.contains(o.state))
      .toList();

  return TechnicianOrdersSplitResult(
    newTechnicianRequests: newRequests,
    upcomingTechnicianRequests: upcoming,
    historyTechnicianRequests: history,
  );
}
