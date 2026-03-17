import 'dart:async';
import 'package:flutter/material.dart';
import 'package:herafy/core/widgets/dots_indicator.dart';
import 'package:herafy/features/home/ui/widget/promo_card.dart';

class PromoSlider extends StatefulWidget {
  const PromoSlider({super.key});

  @override
  State<PromoSlider> createState() => _PromoSliderState();
}

class _PromoSliderState extends State<PromoSlider> {
  final PageController _controller = PageController(initialPage: 0);

  int currentPage = 0;

  Timer? _timer;

  final List<Color> banners = [Colors.blue, Colors.orange, Colors.green];

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
            height: 160,
            child: PageView.builder(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index % banners.length;
                });
              },
              itemBuilder: (context, index) {
                final banner = banners[index % banners.length];
                return PromoCard(color: banner);
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
