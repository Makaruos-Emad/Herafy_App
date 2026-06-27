import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herafy/core/routing/routes.dart';
import 'package:herafy/core/theme/app_colors.dart';
import 'package:herafy/core/theme/app_text_styles.dart';
import 'package:herafy/core/utils/time_formatting.dart';
import 'package:herafy/core/widgets/custom_button.dart';
import 'package:herafy/core/widgets/custom_container.dart';
import 'package:herafy/core/widgets/icon_box.dart';
import 'package:herafy/features/requests/cubit/technician_orders_cubit.dart';
import 'package:herafy/features/requests/model/technician_order_model.dart';
import 'package:herafy/features/requests/ui/widget/info_row.dart';

class NewTechnicianRequestsItem extends StatelessWidget {
  const NewTechnicianRequestsItem({
    super.key,
    required this.newTechnicianRequestsModel,
  });

  final TechnicianOrderModel newTechnicianRequestsModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomContainer(
          child: Column(
            children: [
              Row(
                children: [
                  IconBox(icon: newTechnicianRequestsModel.icon),
                  const SizedBox(width: 10),
                  Text(
                    newTechnicianRequestsModel.serviceName,
                    style: AppTextStyles.regular16Black,
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.access_time,
                    size: 20,
                    color: AppColors.grayBlue,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    timeAgo(newTechnicianRequestsModel.scheduledTime),
                    style: TextStyle(color: Colors.orange),
                  ),
                ],
              ),

              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 16),

              InfoRow(
                icon: Icons.location_on_outlined,
                title: newTechnicianRequestsModel.placeDetails,
                subtitle: "",
              ),
              const SizedBox(height: 16),
              InfoRow(
                icon: Icons.calendar_today_outlined,
                title: formatDate(
                  newTechnicianRequestsModel.scheduledDate.toString(),
                ),
              ),
              const SizedBox(height: 16),
              InfoRow(
                icon: Icons.attach_money,
                title: "${newTechnicianRequestsModel.inspectedPrice} ج.م",
                subtitle: "معاينة",
                isPrice: true,
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),
        CustomButton(
          text: "عرض التفاصيل",
          onPressed: () async {
            final result = await Navigator.pushNamed(
              context,
              Routes.taskDetailsScreen,
              arguments: {
                'orderId': newTechnicianRequestsModel.id,
                'orderStatus': newTechnicianRequestsModel.state,
                'price': newTechnicianRequestsModel.inspectedPrice,
              },
            );

            if (result == true && context.mounted) {
              context.read<TechnicianOrdersCubit>().getTechnicianOrders();
            }
          },
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
