import 'package:flutter/material.dart';
import 'package:herafy/core/routing/routes.dart';
import 'package:herafy/core/widgets/custom_app_bar.dart';
import 'package:herafy/core/widgets/custom_button.dart';
import 'package:herafy/features/technical_task/widget/task_details_body.dart';

class TaskDetailsScreen extends StatelessWidget {
  const TaskDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(
        title: "تفاصيل المهمة",
        onpress: () {
          Navigator.pop(context);
        },
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(height * 0.01),
          child: CustomButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.finishTaskScreen);
            },
            text: "بدء العمل",
          ),
        ),
      ),
      body: TaskDetailsbody(height: height, width: width),
    );
  }
}
