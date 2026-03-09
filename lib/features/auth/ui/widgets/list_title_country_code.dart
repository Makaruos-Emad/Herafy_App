import 'package:flutter/material.dart';
import 'package:herafy/core/theme/app_colors.dart';
import 'package:herafy/features/auth/data/models/list_contry_code.dart';

class WidgetListTitleCountryCode extends StatelessWidget {
  const WidgetListTitleCountryCode({
    super.key,
    required this.selectedCountry,
    required this.onCountrySelected,
  });

  final Country selectedCountry;
  final ValueChanged<Country> onCountrySelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (_) {
            return ListView.builder(
              itemCount: countries.length,
              itemBuilder: (context, index) {
                final country = countries[index];
                return ListTile(
                  leading: Text(country.flag, style: const TextStyle(fontSize: 20)),
                  title: Text(country.name, style: const TextStyle(fontSize: 20)),
                  trailing: Text(
                    country.code,
                    textDirection: TextDirection.ltr,
                    style: const TextStyle(fontSize: 16),
                  ),
                  onTap: () {
                    onCountrySelected(country);
                    Navigator.pop(context);
                  },
                );
              },
            );
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Text(selectedCountry.flag, style: const TextStyle(fontSize: 20)),
            const SizedBox(width: 6),
            const Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }
}
