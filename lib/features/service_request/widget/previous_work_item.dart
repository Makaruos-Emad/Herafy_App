import 'package:flutter/material.dart';
import 'package:herafy/core/theme/app_text_styles.dart';
import 'package:herafy/core/utils/app_images.dart';

class PreviousWork extends StatelessWidget {
  const PreviousWork({super.key, required this.previousWork});
  final List previousWork ;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        itemCount: previousWork.length,
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (context, index) =>  PreviousWorkItem(data:previousWork[index]),
      ),
    );
  }
}

class PreviousWorkItem extends StatelessWidget {
  const PreviousWorkItem({super.key,required this.data});
  final Map<String, dynamic> data ;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            data["imageWorkURL"],
            height: 100,
            width: 200,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Image.asset(
                Assets.imagesNoImage,
                height: 100,
                width: 200,
                fit: BoxFit.cover,
              );
            },
          ),
        ),
        Text(data["problemDetails"], style: AppTextStyles.regular16Black),
      ],
    );
  }
}
