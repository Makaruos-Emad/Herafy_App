import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herafy/core/utils/app_constants.dart';
import 'package:herafy/features/chat/ui/chat_technician_screen_body.dart';
import 'package:herafy/features/home/logic/navigation_cubit.dart';
import 'package:herafy/features/home/ui/widget/custom_bottom_navigation_bar.dart';
import 'package:herafy/features/home/ui/widget/home_technician_screen_body.dart';
import 'package:herafy/features/profile/ui/profile_technician_screen_body.dart';
import 'package:herafy/features/requests/ui/requests_technician_screen_body.dart';

class HomeTechnicianScreen extends StatelessWidget {
  const HomeTechnicianScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      const HomeTechnicianScreenBody(),
      const RequestsTechnicianScreenBody(),
      const ChatTechnicianScreenBody(),
      const ProfileTechnicianScreenBody(),
    ];
    return BlocProvider(
      create: (_) => NavigationCubit(),
      child: BlocBuilder<NavigationCubit, int>(
        builder: (context, currentIndex) {
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
                child: IndexedStack(index: currentIndex, children: screens),
              ),
            ),
            bottomNavigationBar: CustomBottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (index) {
                context.read<NavigationCubit>().changePage(index);
              },
            ),
          );
        },
      ),
    );
  }
}
