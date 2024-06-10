import 'package:flutter/material.dart';
import 'package:flutter_apple_shop/ui/category/bloc/categoryProduct/category_product_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/category.dart';
import '../../Home/product_category_list_screen.dart';
import '../../widgets/cached_image.dart';

class GetCategory extends StatelessWidget {
  const GetCategory({required this.listcategory, super.key});
  final List<Category>? listcategory;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 44),
      sliver: SliverGrid(
          delegate: SliverChildBuilderDelegate((context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => BlocProvider(
                      create: ((context) => CategoryProductBloc()),
                      child: ProductListScreen(listcategory![index]),
                    ),
                  ),
                );
              },
              child: CachedImage(
                imageUrl: listcategory?[index].thumbnail ?? '',
              ),
            );
          }, childCount: listcategory?.length ?? 0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20)),
    );
  }
}
