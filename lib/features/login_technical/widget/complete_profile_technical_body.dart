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
import 'package:herafy/features/login_technical/data/specialties_model_list.dart';
import 'package:herafy/features/login_technical/model/specialties_model.dart';

class BodyCompleteTechnicalProfileScreen extends StatefulWidget {
  const BodyCompleteTechnicalProfileScreen({super.key});

  @override
  State<BodyCompleteTechnicalProfileScreen> createState() =>
      _BodyCompleteTechnicalProfileScreenState();
}

class _BodyCompleteTechnicalProfileScreenState
    extends State<BodyCompleteTechnicalProfileScreen> {
  final TextEditingController _fullNameController = TextEditingController();
  Country? _selectedGovernorate;
  String? _selectedCenter;
  String? selectedSpecialty;

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
                    AddImageProfileWidget(
                      onImageSelected: (p0) {},
                    ),
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
                    const SizedBox(height: 12),
                    Text(
                      "التخصص",
                      style: AppTextStyles.semiBold20Black,
                      textAlign: TextAlign.right,
                    ),
                    const SizedBox(height: 10),
                    CustomListTitleFormField<Specialty>(
                      items: specialties,
                      titleBuilder: (s) => s.name,
                      placeholderText: "اختار التخصص",
                      validator: (value) {
                        if (value == null) {
                          return "من فضلك اختار التخصص";
                        }
                        return null;
                      },
                      onSelected: (value) {
                        setState(() {
                          selectedSpecialty = value.name;
                        });
                        print(value.name);
                        // handle selection
                      },
                    ),
                    if (selectedSpecialty == "آخري") ...[
                      const SizedBox(height: 10),
                      CustomTextFormField(
                        hintText: " أدخل التخصص الاخر",
                        hintStyle: AppTextStyles.regular16GrayBlue,
                        prefixIcon: const FaIcon(
                          FontAwesomeIcons.screwdriverWrench,
                        ),
                        textInputType: TextInputType.name,
                      ),
                    ],

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
                          print(governorate.title);
                        });
                      },
                    ),
                    const SizedBox(height: 12),
                    if (_selectedGovernorate != null) ...[
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
                            print(center);
                          });
                        },
                      ),
                    ],
                    SizedBox(height: 10),
                    Text(
                      "سنوات الخبرة",
                      style: AppTextStyles.semiBold20Black,
                      textAlign: TextAlign.right,
                    ),
                    SizedBox(height: 10),
                    CustomTextFormField(
                      hintText: " أدخل عدد سنوات الخبرة",
                      hintStyle: AppTextStyles.regular16GrayBlue,
                      prefixIcon: const FaIcon(FontAwesomeIcons.clock),
                      textInputType: TextInputType.number,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "سعر المعاينة",
                      style: AppTextStyles.semiBold20Black,
                      textAlign: TextAlign.right,
                    ),
                    SizedBox(height: 10),
                    CustomTextFormField(
                      hintText: "ادخل سعر المعاينة",
                      hintStyle: AppTextStyles.regular16GrayBlue,
                      prefixIcon: const FaIcon(FontAwesomeIcons.moneyBillWave),
                      textInputType: TextInputType.number,
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
                    Navigator.pushNamed(
                      context,
                      Routes.uploadIdTechnicialScreen,
                    );
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
