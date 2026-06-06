import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herafy/features/home/ui/widget/home_app_bar.dart';
import 'package:herafy/features/home/ui/widget/promo_slider.dart';
import 'package:herafy/features/home/ui/widget/services_section.dart';
import 'package:herafy/features/profile/cubit/profile_cubit.dart';
import 'package:herafy/features/profile/cubit/profile_state.dart';

class HomeClientScreenBody extends StatelessWidget {
  const HomeClientScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            return HomeAppBar(
              fullName: state is ProfileSuccess
                  ? (state.profile["fullName"] ?? "")
                  : "بك في حرفي",
              userImage: state is ProfileSuccess
                  ? (state.profile["profileImageURL"] ?? "")
                  : "",
            );
          },
        ),
        const SizedBox(height: 16),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 16),
                PromoSlider(),
                const SizedBox(height: 16),
                ServicesSection(),
                // const SizedBox(height: 16),
                // MostRequestedServices(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
