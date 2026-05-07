import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herafy/core/theme/app_colors.dart';
import 'package:herafy/core/theme/app_text_styles.dart';
import 'package:herafy/core/utils/app_constants.dart';
import 'package:herafy/core/utils/app_images.dart';
import 'package:herafy/features/service_request/cubit/cubit_technical_details/technical_details_cubit.dart';
import 'package:herafy/features/service_request/widget/bio_tech_man.dart';
import 'package:herafy/features/service_request/widget/comment_clinte_to_tech.dart';
import 'package:herafy/features/service_request/widget/information_work_item.dart';
import 'package:herafy/features/service_request/widget/previous_work_item.dart';

class TechSelectedProfileBody extends StatelessWidget {
  const TechSelectedProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TechnicalDetailsCubit, TechnicalDetailsState>(
      builder: (context, state) {
        if (state is TechnicalDetailsLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is TechnicalDetailsSuccess) {
          final details = state.details;
          final reviews = state.reviews;
          final previousWork = state.previousWork;

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(kHorizontalPadding),
              child: Center(
                child: Column(
                  spacing: 12,
                  children: [
                    CircleAvatar(
                      radius: 70,
                      backgroundColor: Colors.blue,
                      child: CircleAvatar(
                        radius: 68,
                        backgroundImage:
                            (details["profileImageURL"] != null &&
                                details["profileImageURL"]
                                    .toString()
                                    .isNotEmpty)
                            ? NetworkImage(details["profileImageURL"])
                            : const AssetImage(Assets.imagesNoImage)
                                  as ImageProvider,
                      ),
                    ),

                    Text(
                      details["fullname"] ?? "",
                      style: AppTextStyles.semiBold20Black,
                    ),
                    Text(
                      details["serviceCategory"] ?? "",
                      style: AppTextStyles.regular16GrayBlue,
                    ),

                    Row(
                      spacing: 20,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InformationWorkWidget(
                          text: details["ratingAvg"].toStringAsFixed(1),
                          icon: Icons.star,
                          iconColor: Colors.amber,
                        ),

                        InformationWorkWidget(
                          text: "120 عملية",
                          icon: Icons.work,
                          iconColor: AppColors.primaryColor,
                        ),

                        InformationWorkWidget(
                          text: "${details["experienceYears"]} سنوات",
                          icon: Icons.workspace_premium,
                          iconColor: AppColors.primaryColor,
                        ),
                      ],
                    ),

                    BioTechnicialMan(bio: details["bio"] ?? "",
                      city: details["city"] ?? "",
                      governorate: details["government"] ?? "",),

                    const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "أعمال سابقة",
                        style: AppTextStyles.semiBold20Black,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    if (previousWork.isEmpty)
                      const Text(
                        "لا يوجد أعمال سابقة",
                        style: AppTextStyles.regular16GrayBlue,
                      ),
                    PreviousWork(previousWork: previousWork),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: reviews.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                      itemBuilder: (context, index) {
                        return CommentWidget(review: reviews[index]);
                      },
                    ),

                    SizedBox(height: 60),
                  ],
                ),
              ),
            ),
          );
        }
        if (state is TechnicalDetailsError) {
          return Center(child: Text(state.message));
        }

        return const SizedBox();
      },
    );
  }
}
