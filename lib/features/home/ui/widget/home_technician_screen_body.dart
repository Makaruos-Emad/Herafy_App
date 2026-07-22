import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herafy/core/theme/app_text_styles.dart';
import 'package:herafy/core/utils/app_images.dart';
import 'package:herafy/core/widgets/custom_button.dart';
import 'package:herafy/features/home/logic/navigation_cubit.dart';
import 'package:herafy/features/home/ui/widget/earnings_card.dart';
import 'package:herafy/features/home/ui/widget/home_app_bar.dart';
import 'package:herafy/features/home/ui/widget/list_active_job_card.dart';
import 'package:herafy/features/home/ui/widget/promo_slider.dart';
import 'package:herafy/features/home/ui/widget/task_item.dart';
import 'package:herafy/features/home/ui/widget/view_all.dart';
import 'package:herafy/features/profile/cubit/profile_tech_cubit.dart';
import 'package:herafy/features/profile/cubit/profile_tech_state.dart';

class HomeTechnicianScreenBody extends StatelessWidget {
  const HomeTechnicianScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<ProfileTechCubit, ProfileTechState>(
          builder: (context, state) {
            return HomeAppBar(
              fullName: state is ProfileTechSuccess
                  ? (state.profile["fullname"] ?? "")
                  : "",
              userImage: state is ProfileTechSuccess
                  ? (state.profile["profileImageURL"] ?? "")
                  : "",
            );
          },
        ),
        const SizedBox(height: 24),
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: PromoSlider()),
              const SliverToBoxAdapter(child: SizedBox(height: 16)),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Image.asset(
                            Assets.imagesHerafyIcon,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        const SizedBox(height: 24),
                        const Text(
                          " جاهز للشغل  ؟ 🚀🔥",
                          style: AppTextStyles.semiBold20Black,

                          textAlign: TextAlign.center,
                        ),

                        const SizedBox(height: 32),
                        SizedBox(
                          width: double.infinity,
                          child: CustomButton(
                            text: "انطلاق للعمل",
                            onPressed: () {
                              // Start Working
                              context.read<NavigationCubit>().changePage(1);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
