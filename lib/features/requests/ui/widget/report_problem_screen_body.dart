import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herafy/core/theme/app_colors.dart';
import 'package:herafy/core/theme/app_text_styles.dart';
import 'package:herafy/core/widgets/custom_button.dart';
import 'package:herafy/core/widgets/custom_text_form_field.dart';
import 'package:herafy/features/requests/cubit/create_complaint_cubit.dart';
import 'package:herafy/features/requests/cubit/create_complaint_state.dart';

class ReportProblemScreenBody extends StatefulWidget {
  const ReportProblemScreenBody({super.key, required this.orderId});

  final int orderId;

  @override
  State<ReportProblemScreenBody> createState() =>
      _ReportProblemScreenBodyState();
}

class _ReportProblemScreenBodyState extends State<ReportProblemScreenBody> {
  final _formKey = GlobalKey<FormState>();

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateComplaintCubit, CreateComplaintState>(
      listener: (context, state) {
        if (state is CreateComplaintSuccess) {
          titleController.clear();
          descriptionController.clear();

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("تم إرسال الشكوى بنجاح")),
          );
        }

        if (state is CreateComplaintError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),

              Row(
                children: [
                  Icon(
                    Icons.headphones,
                    color: AppColors.primaryColor,
                    size: 30,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "نحن هنا للاستماع، أخبرنا تفاصيل المشكلة",
                      style: AppTextStyles.regular16Black,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              Text("عنوان الشكوى", style: AppTextStyles.regular16Black),

              const SizedBox(height: 8),
              CustomTextFormField(
                controller: titleController,
                hintText: "اكتب عنوانًا مختصرًا للشكوى",
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "يرجى إدخال عنوان الشكوى";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              Text("تفاصيل المشكلة", style: AppTextStyles.regular16Black),

              const SizedBox(height: 8),

              CustomTextFormField(
                controller: descriptionController,
                hintText: "يرجى وصف المشكلة التي واجهتك بالتفصيل...",
                maxLines: 8,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "يرجى كتابة وصف المشكلة";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 24),

              CustomButton(
                onPressed: state is CreateComplaintLoading
                    ? null
                    : () {
                        if (_formKey.currentState!.validate()) {
                          context.read<CreateComplaintCubit>().createComplaint(
                            orderId: widget.orderId,
                            title: titleController.text.trim(),
                            description: descriptionController.text.trim(),
                          );
                        }
                      },
                child: state is CreateComplaintLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : Text("إرسال الشكوى", style: AppTextStyles.regular16White),
              ),
            ],
          ),
        );
      },
    );
  }
}
