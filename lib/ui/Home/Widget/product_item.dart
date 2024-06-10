import 'package:flutter/material.dart';
import 'package:flutter_apple_shop/data/model/product.dart';
import 'package:flutter_apple_shop/ui/Home/product_detail_screen.dart';
import 'package:flutter_apple_shop/util/extention/extention.dart';

import '../../widgets/cached_image.dart';

class ProductItem extends StatelessWidget {
  final ProductModel product;
  const ProductItem(
    this.product, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProductDetailScreen(
            product,
          ),
        ));
      },
      child: Container(
        height: 216,
        width: 160,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                SizedBox(
                  height: 98,
                  width: 98,
                  child: CachedImage(
                    imageUrl: product.thumbnail,
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 10,
                  child: SizedBox(
                      width: 24,
                      height: 24,
                      child:
                          Image.asset('assets/images/active_fav_product.png')),
                ),
                Positioned(
                  bottom: 0,
                  left: 5,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 6),
                      child: Text(
                        '${product.persent!.round().toString()} ٪',
                        style: const TextStyle(
                            fontFamily: 'sb',
                            fontSize: 12,
                            color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10, right: 10),
                  child: Text(
                    product.name,
                    maxLines: 1,
                    style: const TextStyle(fontFamily: 'sm', fontSize: 14),
                  ),
                ),
                Container(
                  height: 53,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.blue,
                          blurRadius: 25,
                          spreadRadius: -12,
                          offset: Offset(0.0, 15))
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Text(
                          'تومان',
                          style: TextStyle(
                              fontFamily: 'sm',
                              fontSize: 12,
                              color: Colors.white),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.price.convertToPrice(),
                              style: const TextStyle(
                                  fontFamily: 'sm',
                                  fontSize: 12,
                                  color: Colors.white,
                                  decoration: TextDecoration.lineThrough),
                            ),
                            Text(
                              product.realPrice.convertToPrice(),
                              style: const TextStyle(
                                fontFamily: 'sm',
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        SizedBox(
                            width: 24,
                            child: Image.asset(
                                'assets/images/icon_right_arrow_cricle.png'))
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
