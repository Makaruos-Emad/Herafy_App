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
    return LayoutBuilder(
      builder: (context, constraints) {
        final horizontalPadding = constraints.maxWidth < 360
            ? 12.0
            : kHorizontalPadding;
        final showCardsInColumn = constraints.maxWidth < 380;

        final cards = [
          UserTypeSelectItem(
            title: "فني",
            description: "أقدم خدمات الصيانة وأبحث عن عمل.",
            image: Assets.imagesSelectTech,
            onTap: () {
              setState(() => _selectedUserType = UserType.technician);
            },
            selected: _selectedUserType == UserType.technician,
          ),
          UserTypeSelectItem(
            title: "عميل",
            description: "أبحث عن فنيين لخدمات الصيانة.",
            image: Assets.imagesSelectClient,
            onTap: () {
              setState(() => _selectedUserType = UserType.client);
            },
            selected: _selectedUserType == UserType.client,
          ),
        ];

        return Padding(
          padding: EdgeInsets.all(horizontalPadding),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight - 70,
                    ),
                    child: Column(
                      children: [
                        Text("من أنت ؟", style: AppTextStyles.bold24DarkBlue),
                        const SizedBox(height: 8),
                        Text(
                          "من فضلك حدد هويتك علشان نقدر نخدمك بشكل أفضل.",
                          style: AppTextStyles.regular16GrayBlue,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: constraints.maxHeight < 650 ? 24 : 50),
                        if (showCardsInColumn)
                          Column(
                            children: [
                              cards[0],
                              const SizedBox(height: 16),
                              cards[1],
                            ],
                          )
                        else
                          Row(
                            children: [
                              Expanded(child: cards[0]),
                              const SizedBox(width: 12),
                              Expanded(child: cards[1]),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              SafeArea(
                top: false,
                child: CustomButton(
                  onPressed: _selectedUserType == null
                      ? null
                      : () {
                          context.read<AuthCubit>().selectUserType(
                            _selectedUserType!,
                          );
                        },
                  text: "التالي",
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
