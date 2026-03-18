import 'package:flutter/material.dart';
import 'package:herafy/core/widgets/custom_app_bar.dart';
import 'package:herafy/features/auth/ui/widgets/user_type_selection_body.dart';

class UserTypeSelectionScreen extends StatelessWidget {
  const UserTypeSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: '',
        onpress: () {
          Navigator.pop(context);
        },
      ),
      body: UserTypeSelectionBody()
    );
  }
}
