import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herafy/core/theme/app_colors.dart';
import 'package:herafy/core/theme/app_text_styles.dart';
import 'package:herafy/core/utils/app_constants.dart';
import 'package:herafy/core/widgets/base_card_container.dart';
import 'package:herafy/features/service_request/widget/check_screen_widget/info_widget.dart';
import 'package:herafy/features/technical_task/cubit/order_details_technician_cubit.dart';
import 'package:herafy/features/technical_task/cubit/order_details_technician_state.dart';

class TaskDetailsbody extends StatelessWidget {
  const TaskDetailsbody({super.key, required this.height, required this.width});

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      OrderDetailsTechnicianCubit,
      OrderDetailsTechnicianState
    >(
      builder: (context, state) {
        if (state is OrderDetailsTechnicianLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is OrderDetailsTechnicianError) {
          return Center(child: Text(state.error));
        }

        if (state is OrderDetailsTechnicianSuccess) {
          final order = state.orderDetails;

          return Padding(
            padding: const EdgeInsets.all(kHorizontalPadding),
            child: Column(
              children: [
                BaseCard(
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: height * 0.04,
                        backgroundImage: NetworkImage(order.imageCliURL),
                      ),
                      SizedBox(width: width * 0.03),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              order.nameClient,
                              style: AppTextStyles.semiBold20Black,
                            ),
                            Text(
                              order.placeDetails,
                              style: AppTextStyles.regular16GrayBlue,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: height * 0.02),

                BaseCard(
                  padding: EdgeInsets.all(height * 0.02),
                  child: Column(
                    spacing: height * 0.01,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InfoItem(
                        icon: order.icon,
                        title: "نوع الخدمة",
                        value: order.serviceName,
                        width: width,
                      ),

                      const Divider(),

                      InfoItem(
                        icon: Icons.calendar_today,
                        title: "التاريخ والوقت",
                        value:
                            "${order.scheduledDate.toString().split(' ')[0]}\n${order.scheduledTime}",
                        width: width,
                      ),

                      const Divider(),

                      Text("وصف العطل", style: AppTextStyles.semiBold20Black),

                      Text(
                        order.problemDetails,
                        style: AppTextStyles.regular16GrayBlue,
                      ),

                      SizedBox(height: height * 0.01),

                      Row(
                        children: [
                          Text(
                            "سعر المعاينة",
                            style: AppTextStyles.semiBold20Black,
                          ),
                          const Spacer(),
                          Text(
                            "${order.inspectedPrice} ج.م",
                            style: AppTextStyles.semiBold20Black.copyWith(
                              color: AppColors.primaryColor,
                              fontSize: width * 0.06,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}
