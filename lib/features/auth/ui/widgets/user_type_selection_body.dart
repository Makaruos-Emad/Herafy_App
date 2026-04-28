import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herafy/core/theme/app_text_styles.dart';
import 'package:herafy/core/utils/app_constants.dart';
import 'package:herafy/core/utils/app_images.dart';
import 'package:herafy/core/widgets/custom_button.dart';
import 'package:herafy/features/auth/cubit/auth_cubit/auth_cubit.dart';
import 'package:herafy/features/auth/ui/widgets/user_type_select_item.dart';


class UserTypeSelectionBody extends StatefulWidget {
  const UserTypeSelectionBody({super.key});

  @override
  State<UserTypeSelectionBody> createState() => _UserTypeSelectionBodyState();
}

class _UserTypeSelectionBodyState extends State<UserTypeSelectionBody> {
  UserType? _selectedUserType;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kHorizontalPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("من أنت ؟", style: AppTextStyles.bold24DarkBlue),
          Text(
            "من فضلك حدد هويتك علشان نقدر نخدمك بشكل أفضل.",
            style: AppTextStyles.regular16GrayBlue,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 50),
          Row(
            children: [
              UserTypeSelectItem(
                title: "فني",
                description: " أقدم خدمات الصيانة وأبحث عن عمل.",
                image: Assets.imagesSelectTech,
                onTap: () {
                  setState(() {
                    _selectedUserType = UserType.technician;
                  });
                },
                selected: _selectedUserType == UserType.technician,
              ),
              Spacer(),
              UserTypeSelectItem(
                title: "عميل",
                description: "أبحث عن فنيين لخدمات الصيانة.",
                image: Assets.imagesSelectClient,
                onTap: () {
                  setState(() {
                    _selectedUserType = UserType.client;
                  });
                },
                selected: _selectedUserType == UserType.client,
              ),
            ],
          ),
          Spacer(),
          CustomButton(
            onPressed: _selectedUserType == null
                ? null
                : () {
                    context.read<AuthCubit>().selectUserType(_selectedUserType!);
                  },
            text: "التالي",
          ),
        ],
      ),
    );
  }
}
