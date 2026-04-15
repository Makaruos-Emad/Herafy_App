import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:herafy/core/routing/routes.dart';
import 'package:herafy/core/theme/app_text_styles.dart';
import 'package:herafy/core/utils/app_constants.dart';
import 'package:herafy/core/widgets/custom_button.dart';
import 'package:herafy/core/widgets/custom_text_form_field.dart';
import 'package:herafy/features/auth/data/country_name.dart';
import 'package:herafy/features/auth/models/list_contry.dart';
import 'package:herafy/features/auth/ui/widgets/add_image_profile_widget.dart';
import 'package:herafy/features/auth/ui/widgets/custom_list_title.dart';

class BodyCompleteClientProfileScreen extends StatefulWidget {
  const BodyCompleteClientProfileScreen({super.key});

  @override
  State<BodyCompleteClientProfileScreen> createState() =>
      _BodyCompleteClientProfileScreenState();
}

class _BodyCompleteClientProfileScreenState
    extends State<BodyCompleteClientProfileScreen> {
  final TextEditingController _fullNameController = TextEditingController();
  Country? _selectedGovernorate;
  String? _selectedCenter;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _fullNameController.addListener(_onFormChanged);
  }

  @override
  void dispose() {
    _fullNameController.removeListener(_onFormChanged);
    _fullNameController.dispose();
    super.dispose();
  }

  void _onFormChanged() {
    if (!mounted) return;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final centers = _selectedGovernorate?.centers ?? const <String>[];
    return Padding(
      padding: const EdgeInsets.all(kHorizontalPadding),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: Column(
                  textDirection: TextDirection.rtl,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AddImageProfileWidget(),
                    SizedBox(height: 30),
                    Text(
                      "الاسم بالكامل",
                      style: AppTextStyles.semiBold20Black,
                      textAlign: TextAlign.right,
                    ),
                    SizedBox(height: 10),
                    CustomTextFormField(
                      hintText: " ادخل الاسم كما يظهر في الهوية",
                      hintStyle: AppTextStyles.regular16GrayBlue,
                      prefixIcon: const FaIcon(FontAwesomeIcons.user),
                      textInputType: TextInputType.name,
                      controller: _fullNameController,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "المحافظة",
                      style: AppTextStyles.semiBold20Black,
                      textAlign: TextAlign.right,
                    ),
                    SizedBox(height: 10),
                    CustomListTitleFormField<Country>(
                      items: governorates,
                      titleBuilder: (g) => g.title,
                      initialValue: _selectedGovernorate,
                      leading: const Icon(Icons.location_city),
                      placeholderText: "اختار محافظة من فضلك",

                      validator: (value) {
                        if (value == null) {
                          return "من فضلك اختار المحافظة";
                        }
                        return null;
                      },

                      onSelected: (governorate) {
                        setState(() {
                          _selectedGovernorate = governorate;
                          _selectedCenter = null;
                        });
                      },
                    ),
                    const SizedBox(height: 12),

                    Text(
                      "المركز",
                      style: AppTextStyles.semiBold20Black,
                      textAlign: TextAlign.right,
                    ),
                    const SizedBox(height: 10),
                    CustomListTitleFormField<String>(
                      items: centers,
                      titleBuilder: (c) => c,
                      initialValue: _selectedCenter,
                      leading: const Icon(Icons.location_on_outlined),
                      placeholderText: "اختار مركز من فضلك",

                      validator: (value) {
                        if (value == null) {
                          return "من فضلك اختار المركز";
                        }
                        return null;
                      },

                      onSelected: (center) {
                        setState(() {
                          _selectedCenter = center;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            SafeArea(
              top: false,
              child: CustomButton(
                onPressed: () {
                  final isValid = _formKey.currentState!.validate();

                  if (isValid) {
                    Navigator.pushNamed(context, Routes.allowLocationScreen);
                  }
                },
                text: 'استمرار',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
