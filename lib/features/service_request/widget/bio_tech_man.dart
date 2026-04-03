
import 'package:flutter/material.dart';
import 'package:herafy/core/theme/app_text_styles.dart';
import 'package:herafy/core/utils/app_constants.dart';
import 'package:readmore/readmore.dart';

class BioTechnicialMan extends StatelessWidget {
  const BioTechnicialMan({
    super.key,
  });

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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "نبذة عني",
                style: AppTextStyles.semiBold20Black,
              ),
            ),
            ReadMoreText(
              "سباك محترف متخصص في السباكة الحديثة وصيانة المواتير والخزانات. أستخدم أحدث المعدات والأدوات لضمان أفضل جودة في العمل...سباك محترف متخصص في السباكة الحديثة وصيانة المواتير والخزانات. أستخدم أحدث المعدات والأدوات لضمان أفضل جودة في العمل...سباك محترف متخصص في السباكة الحديثة وصيانة المواتير والخزانات. أستخدم أحدث المعدات والأدوات لضمان أفضل جودة في العمل...",
              trimLines: 3,
              trimMode: TrimMode.Line,
              trimCollapsedText: 'قراءة المزيد',
              trimExpandedText: ' عرض أقل',
              style: AppTextStyles.regular16GrayBlue,
              moreStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
              lessStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
