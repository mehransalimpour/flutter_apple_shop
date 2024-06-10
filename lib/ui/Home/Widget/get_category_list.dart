import 'package:flutter/widgets.dart';
import 'package:flutter_apple_shop/data/model/category.dart';
import 'package:flutter_apple_shop/ui/Home/Widget/get_category_item.dart';

class GetCategoryList extends StatelessWidget {
  const GetCategoryList({required this.list, super.key});
  final List<Category> list;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(right: 25, top: 20),
        child: SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            reverse: true,
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(left: 20),
                child: GetCategoryItem(list[index]),
              );
            },
          ),
        ),
      ),
    );
  }
}
