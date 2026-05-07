import 'package:flutter/material.dart';
import 'package:herafy/features/home/ui/widget/home_app_bar.dart';
import 'package:herafy/features/home/ui/widget/most_requested_services.dart';
import 'package:herafy/features/home/ui/widget/promo_slider.dart';
import 'package:herafy/features/home/ui/widget/services_section.dart';

class HomeClientScreenBody extends StatelessWidget {
  const HomeClientScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeAppBar(),
        const SizedBox(height: 16),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 16),
                PromoSlider(),
                const SizedBox(height: 16),
                ServicesSection(),
                const SizedBox(height: 16),
                MostRequestedServices(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
