import 'package:flutter/material.dart';
import 'package:flutter_apple_shop/data/model/product.dart';
import 'package:flutter_apple_shop/ui/Home/Widget/product_item.dart';

class GetMostViewedProduct extends StatelessWidget {
  final List<ProductModel> productList;
  const GetMostViewedProduct(
    this.productList, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(right: 44),
        child: SizedBox(
          height: 200,
          child: ListView.builder(
              reverse: true,
              scrollDirection: Axis.horizontal,
              itemCount: productList.length,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: ProductItem(productList[index]),
                );
              })),
        ),
      ),
    );
  }
}
