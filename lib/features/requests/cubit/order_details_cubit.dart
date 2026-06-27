import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herafy/features/requests/cubit/order_details_state.dart';
import 'package:herafy/features/requests/data/requests_api_service.dart';

class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  OrderDetailsCubit() : super(OrderDetailsInitial());

  final api = RequestsApiService();

  void getOrderDetails({required int orderId}) async {
    emit(OrderDetailsLoading());

    try {
      final order = await api.getOrderDetails(orderId: orderId);

      emit(OrderDetailsSuccess(order));
    } catch (e) {
      emit(OrderDetailsError(e.toString()));
    }
  }
}
