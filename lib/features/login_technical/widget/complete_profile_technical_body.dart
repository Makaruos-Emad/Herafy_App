import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:herafy/core/routing/routes.dart';
import 'package:herafy/core/theme/app_text_styles.dart';
import 'package:herafy/core/utils/app_constants.dart';
import 'package:herafy/core/widgets/custom_button.dart';
import 'package:herafy/core/widgets/custom_text_form_field.dart';
import 'package:herafy/features/auth/data/country_name.dart';
import 'package:herafy/features/auth/logic/get_location_logic.dart';
import 'package:herafy/features/auth/models/list_contry.dart';
import 'package:herafy/features/auth/ui/widgets/add_image_profile_widget.dart';
import 'package:herafy/features/auth/ui/widgets/custom_list_title.dart';
import 'package:herafy/features/login_technical/data/api_login_tech.dart';
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
  final TextEditingController _experienceYearsController =
      TextEditingController();
  final TextEditingController _inspectedPriceController =
      TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final LoginTechApi _loginTechApi = LoginTechApi();
  Country? _selectedGovernorate;
  String? _selectedCenter;
  Specialty? _selectedSpecialty;
  File? _profileImage;
  bool _isLoading = false;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _fullNameController.addListener(_onFormChanged);
    _experienceYearsController.addListener(_onFormChanged);
    _inspectedPriceController.addListener(_onFormChanged);
    _bioController.addListener(_onFormChanged);
  }

  @override
  void dispose() {
    _fullNameController.removeListener(_onFormChanged);
    _experienceYearsController.removeListener(_onFormChanged);
    _inspectedPriceController.removeListener(_onFormChanged);
    _bioController.removeListener(_onFormChanged);
    _fullNameController.dispose();
    _experienceYearsController.dispose();
    _inspectedPriceController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  void _onFormChanged() {
    if (!mounted) return;
    setState(() {});
  }

  Future<void> _submit() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid || _isLoading) return;

    if (_profileImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("من فضلك اختار صورة شخصية")),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final position = await getLocation();
      if (!mounted) return;

      if (position == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("من فضلك فعل الموقع واسمح بالوصول")),
        );
        return;
      }

      await _loginTechApi.addTechnical(
        fullName: _fullNameController.text.trim(),
        profileImage: _profileImage!,
        city: _selectedCenter!,
        government: _selectedGovernorate!.title,
        latitude: position.latitude,
        longitude: position.longitude,
        serviceCategoryId: _selectedSpecialty!.id,
        experienceYears: int.parse(_experienceYearsController.text.trim()),
        inspectedPrice: double.parse(_inspectedPriceController.text.trim()),
        bio: _bioController.text.trim(),
      );

      if (!mounted) return;
      Navigator.pushNamed(context, Routes.uploadIdTechnicialScreen);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
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
                      onImageSelected: (image) {
                        setState(() {
                          _profileImage = image;
                        });
                      },
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
                          _selectedSpecialty = value;
                        });
                      },
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
                      controller: _experienceYearsController,
                      validator: (value) {
                        final experienceYears = int.tryParse(value ?? '');
                        if (experienceYears == null || experienceYears < 0) {
                          return "من فضلك أدخل عدد سنوات خبرة صحيح";
                        }
                        return null;
                      },
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
                      controller: _inspectedPriceController,
                      validator: (value) {
                        final inspectedPrice = double.tryParse(value ?? '');
                        if (inspectedPrice == null || inspectedPrice <= 0) {
                          return "من فضلك أدخل سعر معاينة صحيح";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    Text(
                      "نبذة عنك",
                      style: AppTextStyles.semiBold20Black,
                      textAlign: TextAlign.right,
                    ),
                    SizedBox(height: 10),
                    CustomTextFormField(
                      hintText: "اكتب نبذة قصيرة عن خبرتك",
                      hintStyle: AppTextStyles.regular16GrayBlue,
                      prefixIcon: const FaIcon(FontAwesomeIcons.pen),
                      textInputType: TextInputType.multiline,
                      controller: _bioController,
                      maxLines: 3,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            SafeArea(
              top: false,
              child: CustomButton(
                onPressed: _isLoading ? null : _submit,
                text: 'استمرار',
                child: _isLoading
                    ? const SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
