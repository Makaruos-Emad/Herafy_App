import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herafy/core/widgets/custom_button.dart';
import 'package:herafy/features/requests/cubit/order_details_cubit.dart';
import 'package:herafy/features/requests/cubit/order_details_state.dart';
import 'package:herafy/features/requests/ui/widget/cost_details.dart';
import 'package:herafy/features/requests/ui/widget/request_card.dart';
import 'package:herafy/features/requests/ui/widget/service_port.dart';

class InvoiceDetailsScreenBody extends StatelessWidget {
  const InvoiceDetailsScreenBody({super.key, required this.orderId});
  final int orderId; // Replace with actual request ID

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderDetailsCubit, OrderDetailsState>(
      builder: (context, state) {
        if (state is OrderDetailsLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is OrderDetailsSuccess) {
          return Column(
            children: [
              RequestCard(
                serviceName: state.orderDetalis.serviceName,
                date: state.orderDetalis.scheduledDate,
                serviceIcon: state.orderDetalis.icon,
              ),
              SizedBox(height: 24),
              CostDetails(inspectedPrice: state.orderDetalis.inspectedPrice),
              SizedBox(height: 24),
              ServicePort(
                nameTechnician: state.orderDetalis.nameTechnician,
                ratingAvg: state.orderDetalis.ratingAvg,
                imageTecURL: state.orderDetalis.imageTecURL,
              ),
              Spacer(),
              CustomButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    "reportProblemScreen",
                    arguments: orderId,
                  );
                },
                text: "الإبلاغ عن مشكلة",
              ),
            ],
          );
        }
        if (state is OrderDetailsError) {
          return Center(child: Text(state.error));
        }
        return const SizedBox();
      },
    );
  }
}
