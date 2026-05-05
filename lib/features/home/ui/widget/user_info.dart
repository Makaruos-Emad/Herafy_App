import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herafy/core/theme/app_text_styles.dart';
import 'package:herafy/features/home/ui/widget/user_avater.dart';
import 'package:herafy/features/profile/cubit/profile_cubit.dart';
import 'package:herafy/features/profile/cubit/profile_state.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is ProfileSuccess) {
          return Row(
            children: [
              UserAvatar(userImage: state.profile["profileImageURL"] ?? ""),
              SizedBox(width: 8),
              Flexible(
                child: Text(
                  "اهلا، ${state.profile["fullName"] ?? "بك ف حرفي"}",
                  style: AppTextStyles.bold24DarkBlue,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          );
        }
        if (state is ProfileError) {
          return Center(child: Text(state.error));
        }
        return const SizedBox();
      },
    );
  }
}
