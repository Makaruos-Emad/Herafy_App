import 'package:flutter/material.dart';
import 'package:herafy/core/routing/routes.dart';
import 'package:herafy/core/theme/app_text_styles.dart';
import 'package:herafy/core/widgets/custom_button.dart';
import 'package:herafy/features/login_technical/widget/check_tech_id_success_body.dart';
import 'package:herafy/features/profile/data/profile_api_service.dart';

class CheckTechIdSuccessScreen extends StatelessWidget {
  const CheckTechIdSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final ProfileApiService profileApiService = ProfileApiService();

    return Scaffold(
      appBar: AppBar(
        title: const Text("حالة الطلب", style: AppTextStyles.semiBold20Black),
      ),

      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(height * 0.01),
          child: CustomButton(
            onPressed: () async {
              final response = await profileApiService.getTechnicianProfile();

              if (!context.mounted) return;

              final state = response.data['state'];

              switch (state) {
                case 'Active':
                  _showSnackBar(
                    context,
                    message: 'تم تفعيل حسابك بنجاح ✅',
                    color: Colors.green,
                  );

                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    Routes.homeTechnicianScreen,
                    (_) => false,
                  );
                  break;

                case 'Pending':
                  _showSnackBar(
                    context,
                    message: 'لم يتم تفعيل حسابك بعد ❌\nيرجى المحاولة لاحقًا',
                    color: Colors.red,
                  );
                  break;

                default:
                  _showSnackBar(
                    context,
                    message: 'لم يتم تفعيل حسابك ❌\nيرجى المحاولة من جديد',
                    color: Colors.red,
                  );

                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    Routes.loginNumberScreen,
                    (_) => false,
                  );
              }
            },
            text: "اعادة التحيل الصفحة",
          ),
        ),
      ),
      body: CheckTechIdSuccessBody(height: height),
    );
  }
}

void _showSnackBar(
  BuildContext context, {
  required String message,
  required Color color,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      backgroundColor: color,
      content: Text(
        message,
        style: AppTextStyles.semiBold16White,
        textAlign: TextAlign.center,
      ),
    ),
  );
}
