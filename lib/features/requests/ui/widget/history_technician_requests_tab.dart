import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herafy/features/requests/cubit/technician_orders_cubit.dart';
import 'package:herafy/features/requests/cubit/technician_orders_state.dart';
import 'package:herafy/features/requests/ui/widget/history_technician_requests_item.dart';

class HistoryTechnicianRequestsTab extends StatelessWidget {
  const HistoryTechnicianRequestsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TechnicianOrdersCubit, TechnicianOrdersState>(
      builder: (context, state) {
        if (state is TechnicianOrdersLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is TechnicianOrdersSuccessSplit) {
          return ListView.builder(
            itemCount: state.historyTechnicianRequests.length,
            itemBuilder: (context, index) {
              return HistoryTechnicianRequestsItem(
                request: state.historyTechnicianRequests[index],
              );
            },
          );
        }

        if (state is TechnicianOrdersError) {
          return Center(child: Text(state.error));
        }

        return const SizedBox();
      },
    );
  }
}
