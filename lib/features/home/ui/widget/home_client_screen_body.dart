import 'package:flutter/material.dart';
import 'package:herafy/features/home/ui/widget/home_app_bar.dart';

class HomeClientScreenBody extends StatelessWidget {
  const HomeClientScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [HomeAppBar()]);
  }
}
