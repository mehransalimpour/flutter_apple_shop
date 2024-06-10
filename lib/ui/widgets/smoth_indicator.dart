import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

Widget smothIndicatorWidget(
  BuildContext context, {
  required PageController controller,
  required int count,
}) {
  return SmoothPageIndicator(
    controller: controller,
    count: count,
    effect: const ExpandingDotsEffect(
        expansionFactor: 4,
        dotHeight: 6,
        dotWidth: 6,
        dotColor: Color.fromARGB(255, 228, 99, 99),
        activeDotColor: Colors.blue),
  );
}
