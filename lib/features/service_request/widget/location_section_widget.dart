import 'package:flutter/material.dart';
import 'package:herafy/core/theme/app_text_styles.dart';
import 'package:herafy/features/auth/data/country_name.dart';
import 'package:herafy/features/auth/models/list_contry.dart';
import 'package:herafy/features/auth/ui/widgets/custom_list_title.dart';

class LocationSection extends StatelessWidget {
  final Country? selectedGovernorate;
  final String? selectedCenter;
  final Function(Country) onGovernorateSelected;
  final Function(String?) onCenterSelected;

  const LocationSection({
    super.key,
    required this.selectedGovernorate,
    required this.selectedCenter,
    required this.onGovernorateSelected,
    required this.onCenterSelected,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final centers = selectedGovernorate?.centers ?? const <String>[];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("اختار اسم المحافظة", style: AppTextStyles.semiBold20Black),
        SizedBox(height: height * 0.015),

        CustomListTitleFormField<Country>(
          items: governorates,
          titleBuilder: (g) => g.title,
          initialValue: selectedGovernorate,
          leading: const Icon(Icons.location_city),
          placeholderText: "اختار محافظة من فضلك",

          validator: (value) {
            if (value == null) {
              return "من فضلك اختار المحافظة";
            }
            return null;
          },

          onSelected: (governorate) {
            onGovernorateSelected(governorate);

            /// 🔥 reset للمركز
            onCenterSelected(null);
          },
        ),

        SizedBox(height: height * 0.02),

        
          Text("المركز", style: AppTextStyles.semiBold20Black),
          SizedBox(height: height * 0.015),

          CustomListTitleFormField<String>(
            items: centers,
            titleBuilder: (c) => c,
            initialValue: selectedCenter,
            leading: const Icon(Icons.location_on_outlined),
            placeholderText: "اختار مركز من فضلك",

            validator: (value) {
              if (value == null) {
                return "من فضلك اختار المركز";
              }
              return null;
            },

            onSelected: (center) {
              onCenterSelected(center);
            },
          ),
        ],
      
    );
  }
}
