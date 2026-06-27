import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herafy/core/routing/routes.dart';
import 'package:herafy/core/widgets/custom_app_bar.dart';
import 'package:herafy/core/widgets/custom_button.dart';
import 'package:herafy/core/widgets/custom_outlined_button.dart';
import 'package:herafy/features/requests/cubit/change_status_order_cubit.dart';
import 'package:herafy/features/requests/cubit/change_status_order_state.dart';
import 'package:herafy/features/technical_task/cubit/order_details_technician_cubit.dart';
import 'package:herafy/features/technical_task/widget/task_details_body.dart';

class TaskDetailsScreen extends StatefulWidget {
  const TaskDetailsScreen({
    super.key,
    required this.orderId,
    required this.orderStatus,
    required this.price,
  });

  final int orderId;
  final String orderStatus;
  final double price;
  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  int? selectedStatus;

  Future<bool?> _showConfirmDialog(
    BuildContext context, {
    required String title,
    required String content,
  }) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: const Text("إلغاء"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: const Text("تأكيد"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              OrderDetailsTechnicianCubit()
                ..getOrderDetails(orderId: widget.orderId),
        ),
        BlocProvider(create: (_) => ChangeStatusOrderCubit()),
      ],
      child: BlocListener<ChangeStatusOrderCubit, ChangeStatusOrderState>(
        listener: (context, state) {
          if (state is ChangeStatusOrderSuccess) {
            final message = selectedStatus == 1
                ? "تم قبول الطلب بنجاح"
                : "تم رفض الطلب بنجاح";

            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(message)));

            Navigator.pop(context, true);
          }

          if (state is ChangeStatusOrderError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        child: Scaffold(
          appBar: CustomAppBar(
            title: "تفاصيل المهمة",
            onpress: () {
              Navigator.pop(context);
            },
          ),
          body: TaskDetailsbody(height: height, width: width),
          bottomNavigationBar:
              BlocBuilder<ChangeStatusOrderCubit, ChangeStatusOrderState>(
                builder: (context, state) {
                  if (state is ChangeStatusOrderLoading) {
                    return const Padding(
                      padding: EdgeInsets.all(20),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }

                  return SafeArea(
                    child: Padding(
                      padding: EdgeInsets.all(height * 0.01),
                      child: widget.orderStatus == "Pending"
                          ? Row(
                              children: [
                                Expanded(
                                  child: CustomButton(
                                    text: "قبول الطلب",
                                    onPressed: () async {
                                      final confirm = await _showConfirmDialog(
                                        context,
                                        title: "قبول الطلب",
                                        content:
                                            "هل أنت متأكد من قبول هذا الطلب؟",
                                      );
                                      if (confirm == true) {
                                        selectedStatus = 1;
                                        // ignore: use_build_context_synchronously
                                        context
                                            .read<ChangeStatusOrderCubit>()
                                            .changeStatusOrder(
                                              orderId: widget.orderId,
                                              status: 1,
                                            );
                                      }
                                    },
                                  ),
                                ),
                                SizedBox(width: width * 0.02),
                                Expanded(
                                  child: CustomOutlinedButton(
                                    text: "رفض الطلب",
                                    onPressed: () async {
                                      final confirm = await _showConfirmDialog(
                                        context,
                                        title: "رفض الطلب",
                                        content:
                                            "هل أنت متأكد من رفض هذا الطلب؟",
                                      );
                                      if (confirm == true) {
                                        selectedStatus = 5;
                                        // ignore: use_build_context_synchronously
                                        context
                                            .read<ChangeStatusOrderCubit>()
                                            .changeStatusOrder(
                                              orderId: widget.orderId,
                                              status: 5,
                                            );
                                      }
                                    },
                                  ),
                                ),
                              ],
                            )
                          : CustomButton(
                              text: "بدء العمل",
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  Routes.finishTaskScreen,
                                  arguments: {
                                    'orderId': widget.orderId,
                                    'price': widget.price,
                                  },
                                );
                              },
                            ),
                    ),
                  );
                },
              ),
        ),
      ),
    );
  }
}
