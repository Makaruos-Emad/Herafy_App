import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herafy/features/requests/cubit/orders_cubit.dart';
import 'package:herafy/features/requests/cubit/orders_state.dart';
import 'package:herafy/features/requests/model/requests_model.dart';
import 'package:herafy/features/requests/ui/widget/requests_item.dart';

class ActiveRequestsTab extends StatelessWidget {
  const ActiveRequestsTab({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersState>(
      builder: (context, state) {
        if (state is OrdersLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is OrdersSuccessSplit) {
          final List<RequestsModel> currentRequests = state.active.toList();
          return ListView.builder(
            itemCount: currentRequests.length,
            itemBuilder: (context, index) {
              return RequestsItem(request: currentRequests[index]);
            },
          );
        }
        if (state is OrdersError) {
          return Center(child: Text(state.error));
        }
        return const SizedBox();
      },
    );
  }
}
