import 'package:flutter/material.dart';
import 'package:herafy/core/theme/app_text_styles.dart';
import 'package:herafy/core/utils/app_constants.dart';
import 'package:herafy/core/utils/app_images.dart';
import 'package:herafy/features/service_request/widget/rating_star_items.dart';

class CommentWidget extends StatelessWidget {
  const CommentWidget({super.key , required this.daysAgo , required this.rating });
  final String daysAgo ;
  final double rating ;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
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
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: Image.asset(Assets.imagesUserImage).image,
                ),
                Column(
                  children: [
                    Text("محمد علي", style: AppTextStyles.semiBold20Black),
                    RatingStars(rating: rating),
                  ],
                ),
                const Spacer(),
                Text("منذ $daysAgo", style: AppTextStyles.regular16GrayBlue),
              ],
            ),
            Text(
              "تسلم ايدك يا أسطى، شغل نضيف وسريع. كشف التسريب في دقائق وحل المشكلة بدون ما يكسر حاجة.",
              style: AppTextStyles.regular16GrayBlue,
            ),
          ],
        ),
      ),
    );
  }
}
