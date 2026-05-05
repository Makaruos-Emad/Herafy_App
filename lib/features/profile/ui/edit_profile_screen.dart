import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:herafy/core/theme/app_text_styles.dart';
import 'package:herafy/core/widgets/custom_app_bar.dart';
import 'package:herafy/core/widgets/custom_button.dart';
import 'package:herafy/core/widgets/custom_text_form_field.dart';
import 'package:herafy/features/auth/data/country_name.dart';
import 'package:herafy/features/auth/models/list_contry.dart';
import 'package:herafy/features/auth/ui/widgets/add_image_profile_widget.dart';
import 'package:herafy/features/auth/ui/widgets/custom_list_title.dart';
import 'package:herafy/features/profile/cubit/profile_cubit.dart';
import 'package:herafy/features/profile/cubit/profile_state.dart';
import 'package:herafy/features/profile/helper/image_cach_helper.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  Country? selectedGovernorate;
  String? selectedCity;
  File? selectedImage;

  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileSuccess) {
          final data = state.profile;

          /// 🟢 منع إعادة التعيين كل rebuild
          selectedGovernorate ??= governorates.firstWhere(
            (g) =>
                g.title.trim().toLowerCase() ==
                (data["government"] ?? "").toString().trim().toLowerCase(),
            orElse: () => governorates.first,
          );

          /// 🟢 set initial text مرة واحدة
          if (nameController.text.isEmpty) {
            nameController.text = data["fullName"] ?? "";
          }

          return Scaffold(
            appBar: CustomAppBar(
              title: "تعديل البيانات",
              onpress: () => Navigator.pop(context),
            ),

            bottomNavigationBar: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: CustomButton(
                  onPressed: () async {
                    File imageFile;

                    if (selectedImage != null) {
                      imageFile = selectedImage!;
                    } else {
                      imageFile = await ImageCacheHelper.getCachedImage(
                        data["profileImageURL"],
                      );
                    }
                    context.read<ProfileCubit>().updateProfile(
                      name: nameController.text,
                      governorate: selectedGovernorate?.title ?? "",
                      city: selectedCity ?? data["city"] ?? "",
                      image: imageFile,
                    );
                  },
                  text: "حفظ التعديلات",
                ),
              ),
            ),

            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// 🖼️ الصورة
                    AddImageProfileWidget(
                      imageUrl: data["profileImageURL"],
                      onImageSelected: (file) {
                        selectedImage = file;
                      },
                    ),

                    /// 👤 الاسم
                    Text("الاسم بالكامل", style: AppTextStyles.semiBold20Black),

                    CustomTextFormField(
                      controller: nameController,
                      hintText: "ادخل الاسم",
                      prefixIcon: const FaIcon(FontAwesomeIcons.user),
                    ),

                    /// 🏙️ المحافظة
                    Text("المحافظة", style: AppTextStyles.semiBold20Black),

                    CustomListTitleFormField<Country>(
                      items: governorates,
                      titleBuilder: (g) => g.title,
                      initialValue: selectedGovernorate,
                      leading: const Icon(Icons.location_city),
                      placeholderText: "اختار محافظة",

                      onSelected: (value) {
                        setState(() {
                          selectedGovernorate = value;
                          selectedCity = null; // reset city
                        });
                      },
                    ),

                    /// 🏘️ المركز
                    Text("المركز", style: AppTextStyles.semiBold20Black),

                    CustomListTitleFormField<String>(
                      items: selectedGovernorate?.centers ?? [],
                      titleBuilder: (g) => g,
                      initialValue: selectedCity ?? data["city"],
                      leading: const Icon(Icons.location_city),
                      placeholderText: "اختار مركز",

                      onSelected: (value) {
                        selectedCity = value;
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        /// 🔄 Loading
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
