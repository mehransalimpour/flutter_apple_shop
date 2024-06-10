import 'package:flutter/widgets.dart';
import 'package:flutter_apple_shop/data/model/banner_campain.dart';

import 'banner_Slider.dart';

class Getbanners extends StatelessWidget {
  const Getbanners({required this.bannerCampain, super.key});
  final List<BannerCampain> bannerCampain;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BannerSlider(bannerList: bannerCampain),
    );
  }
}
