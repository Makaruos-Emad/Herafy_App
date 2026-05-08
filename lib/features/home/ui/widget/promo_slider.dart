import 'dart:async';
import 'package:flutter/material.dart';
import 'package:herafy/core/utils/app_images.dart';
import 'package:herafy/core/widgets/dots_indicator.dart';

class PromoSlider extends StatefulWidget {
  const PromoSlider({super.key});

  @override
  State<PromoSlider> createState() => _PromoSliderState();
}

class _PromoSliderState extends State<PromoSlider> {
  final PageController _controller = PageController(initialPage: 0);

  int currentPage = 0;

  Timer? _timer;

  final List<String> banners = [
    Assets.imagesShowOne,
    Assets.imagesShowTwo,
    Assets.imagesShowThree,
  ];

  @override
  void initState() {
    super.initState();
    startAutoScroll();
  }

  void startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 3), (_) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
  }

  void stopAutoScroll() {
    _timer?.cancel();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Column(
        children: [
          SizedBox(
            height: 180,
            child: PageView.builder(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index % banners.length;
                });
              },
              itemBuilder: (context, index) {
                final banner = banners[index % banners.length];
                return Image.asset(
                  banner,
                  width: double.infinity,
                  fit: BoxFit.fill,
                );
              },
            ),
          ),

          const SizedBox(height: 16),

          DotsIndicator(
            currentPage: currentPage,
            length: banners.length,
            pageController: _controller,
          ),
        ],
      ),
    );
  }
}
