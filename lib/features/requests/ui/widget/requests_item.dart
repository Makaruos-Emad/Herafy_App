import 'package:flutter/material.dart';
import 'package:herafy/core/routing/routes.dart';
import 'package:herafy/core/theme/app_colors.dart';
import 'package:herafy/core/theme/app_text_styles.dart';
import 'package:herafy/core/widgets/custom_button.dart';
import 'package:herafy/core/widgets/custom_container.dart';
import 'package:herafy/features/requests/model/requests_model.dart';
import 'package:intl/intl.dart';

enum OrderStatus { inProgress, confirmed, completed }

class RequestsItem extends StatelessWidget {
  const RequestsItem({super.key, required this.request});

  final RequestsModel request;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(request.icon, color: AppColors.primaryColor),
              SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      request.title,
                      style: AppTextStyles.regular16Black,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      request.id.toString(),
                      style: AppTextStyles.regular16GrayBlue,
                    ),
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: request.status == "مكتمل"
                      ? AppColors.primaryColor
                      : (request.status == "قيد الانتظار")
                      ? Colors.orange
                      : (request.status == "مرفوض" || request.status == "ملغي")
                      ? Colors.red
                      : Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  request.status,
                  style: AppTextStyles.regular16Black.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 24),

          Row(
            children: [
              Icon(Icons.calendar_today, color: AppColors.black),
              SizedBox(width: 8),
              Text(
                DateFormat('d MMMM', 'ar').format(request.time),
                style: AppTextStyles.regular16GrayBlue,
              ),
              SizedBox(width: 16),
              Icon(
                Icons.account_balance_wallet_outlined,
                color: AppColors.black,
              ),
              SizedBox(width: 8),
              Text(
                "${request.price} ج.م",
                style: AppTextStyles.regular16GrayBlue,
              ),
            ],
          ),
          SizedBox(height: 24),
          request.status == "مكتمل" ||
                  request.status == "مرفوض" ||
                  request.status == "ملغي"
              ? CustomButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      Routes.invoiceDetailsScreen,
                      arguments: request.id, // أو أي id عندك
                    );
                  },
                  text: "عرض الفاتورة",
                )
              : CustomButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      Routes.invoiceDetailsScreen,
                      arguments: request.id,
                    );
                  },
                  text: "عرض التفاصيل",
                ),
        ],
      ),
    );
  }
}
