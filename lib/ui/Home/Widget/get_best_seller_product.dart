import 'package:flutter/material.dart';

import '../../../data/model/product.dart';
import 'product_item.dart';

class Getbestsellerproducts extends StatelessWidget {
  final List<ProductModel> productList;
  const Getbestsellerproducts(this.productList, {super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(right: 22),
        child: SizedBox(
          height: 200,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: productList.length,
              reverse: true,
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
