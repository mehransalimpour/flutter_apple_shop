import 'package:flutter/material.dart';
import 'package:flutter_apple_shop/data/model/category.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../category/bloc/categoryProduct/category_product_bloc.dart';
import '../../widgets/cached_image.dart';
import '../product_category_list_screen.dart';

class GetCategoryItem extends StatelessWidget {
  const GetCategoryItem(this.list, {super.key});
  final Category list;
  @override
  Widget build(BuildContext context) {
    String categoryColor = 'ff${list.color ?? ''}';
    int hexColor = int.parse(categoryColor, radix: 16);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: ((context) => CategoryProductBloc()),
              child: ProductListScreen(list),
            ),
          ),
        );
      },
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                height: 56,
                width: 56,
                decoration: ShapeDecoration(
                  color: Color(hexColor),
                  shadows: [
                    BoxShadow(
                        color: Color(hexColor),
                        blurRadius: 25,
                        spreadRadius: -12,
                        offset: const Offset(0.0, 15)),
                  ],
                  shape: const ContinuousRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(40),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 24,
                width: 24,
                child: Center(
                  child: CachedImage(
                    imageUrl: list.icon,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            list.title ?? 'محصول',
            style: const TextStyle(fontFamily: 'SB', fontSize: 12),
          )
        ],
      ),
    );
  }
}
