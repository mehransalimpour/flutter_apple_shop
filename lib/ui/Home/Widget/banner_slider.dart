import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_apple_shop/data/model/banner_campain.dart';
import 'package:flutter_apple_shop/ui/widgets/cached_image.dart';
import 'package:flutter_apple_shop/ui/widgets/smoth_indicator.dart';

class BannerSlider extends StatelessWidget {
  const BannerSlider({required this.bannerList, super.key});
  final List<BannerCampain> bannerList;

  @override
  Widget build(BuildContext context) {
    var pageController = PageController(viewportFraction: 0.9);
    return SizedBox(
      height: 210,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Center(
            child: SizedBox(
              height: 177,
              child: PageView.builder(
                itemCount: bannerList.length,
                controller: pageController,
                itemBuilder: (context, index) {
                  return Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(15)),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 6),
                      child: CachedImage(
                        imageUrl: bannerList[index].thumbnail,
                        radius: 15,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: smothIndicatorWidget(
                controller: pageController, context, count: bannerList.length),
          )
        ],
      ),
    );
  }
}
