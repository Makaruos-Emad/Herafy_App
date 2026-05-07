import 'package:flutter/material.dart';
import 'package:herafy/core/theme/app_text_styles.dart';
import 'package:herafy/core/utils/app_constants.dart';
import 'package:herafy/core/utils/app_images.dart';
import 'package:herafy/features/service_request/widget/rating_star_items.dart';

class CommentWidget extends StatelessWidget {
  const CommentWidget({super.key, required this.review});
  final Map<String, dynamic> review;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade200,
      ),
      child: Padding(
        padding: const EdgeInsets.all(kHorizontalPadding),
        child: Column(
          children: [
            Row(
              spacing: 10,
              children: [
                CircleAvatar(
                  radius: 30,

                  backgroundImage:
                      (review["imageURLClient"] != null &&
                          review["imageURLClient"].toString().isNotEmpty)
                      ? NetworkImage(review["imageURLClient"])
                      : const AssetImage(Assets.imagesNoImage) as ImageProvider,
                ),
                Column(
                  children: [
                    Text(
                      review["nameClient"],
                      style: AppTextStyles.semiBold20Black,
                    ),
                    RatingStars(rating: review["rating"]),
                  ],
                ),
              ],
            ),
            Text(review["comment"], style: AppTextStyles.regular16GrayBlue),
          ],
        ),
      ),
    );
  }
}
