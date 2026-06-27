import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herafy/core/utils/app_constants.dart';
import 'package:herafy/features/chat/ui/chat_screen_body.dart';
import 'package:herafy/features/home/logic/navigation_cubit.dart';
import 'package:herafy/features/home/ui/widget/custom_bottom_navigation_bar.dart';
import 'package:herafy/features/home/ui/widget/home_client_screen_body.dart';
import 'package:herafy/features/profile/cubit/profile_cubit.dart';
import 'package:herafy/features/profile/cubit/profile_state.dart';
import 'package:herafy/features/profile/ui/profile_screen_body.dart';
import 'package:herafy/features/requests/ui/requests_screen_body.dart';

class HomeClientScreen extends StatelessWidget {
  const HomeClientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      const HomeClientScreenBody(),
      const RequestsScreenBody(),
      const ChatScreenBody(),
      BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return ProfileScreenBody(
            accepteRequest: false,

            isLoading: state is ProfileLoading,

            error: state is ProfileError ? state.error : null,

            data: state is ProfileSuccess ? state.profile : null,
          );
          
        },
      ),
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
