import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herafy/core/utils/app_constants.dart';
import 'package:herafy/core/widgets/custom_app_bar.dart';
import 'package:herafy/features/requests/cubit/order_details_cubit.dart';
import 'package:herafy/features/requests/ui/widget/view_invoice_screen_body.dart';

class InvoiceDetailsScreen extends StatelessWidget {
  const InvoiceDetailsScreen({super.key, required this.orderId});
  final int orderId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) =>
              OrderDetailsCubit()..getOrderDetails(orderId: orderId),
          child: Column(
            children: [
              CustomAppBar(
                title: "تفاصيل الفاتورة",
                onpress: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: 24),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: kHorizontalPadding,
                  ),
                  child: InvoiceDetailsScreenBody(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
