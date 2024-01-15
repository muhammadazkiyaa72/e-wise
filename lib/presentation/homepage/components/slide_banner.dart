import 'package:carousel_slider/carousel_slider.dart';
import 'package:ewise/core/values/colors.dart';
import 'package:flutter/material.dart';

class SlideBanner extends StatefulWidget {
  static List<Widget> bannerItem = [
    Image.asset('assets/img/banner_1.png'),
    Image.asset('assets/img/banner_2.png'),
    Image.asset('assets/img/banner_3.png'),
  ];

  const SlideBanner({super.key});

  @override
  State<SlideBanner> createState() => _SlideBannerState();
}

class _SlideBannerState extends State<SlideBanner> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OrientationBuilder(
          builder: (context, orientation) {
            double aspectRatio =
                orientation == Orientation.portrait ? 16 / 9 : 3 / 2;
            double viewportFraction =
                orientation == Orientation.portrait ? 1.0 : 0.8;

            return CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 1000),
                enableInfiniteScroll: true,
                enlargeCenterPage: true,
                aspectRatio: aspectRatio,
                viewportFraction: viewportFraction,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                },
              ),
              items: SlideBanner.bannerItem,
            );
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: SlideBanner.bannerItem.map((e) {
            int index = SlideBanner.bannerItem.indexOf(e);
            return Container(
              width: 8,
              height: 8,
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _current == index ? AppColors.white : AppColors.grey3,
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}
