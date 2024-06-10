import 'package:flutter/material.dart';
import 'package:flutter_apple_shop/data/model/variants.dart';

class ColorVarinantList extends StatefulWidget {
  final List<Variant> variantList;

  const ColorVarinantList(this.variantList, {super.key});

  @override
  State<ColorVarinantList> createState() => _ColorVarinantListState();
}

class _ColorVarinantListState extends State<ColorVarinantList> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SizedBox(
        height: 30,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.variantList.length,
            itemBuilder: ((context, index) {
              String categoryColor = 'ff${widget.variantList[index].value}';
              int hexColor = int.parse(categoryColor, radix: 16);
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 10),
                  padding: const EdgeInsets.all(1),
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    border: (_selectedIndex == index)
                        ? Border.all(
                            width: 1,
                            color: Colors.blue,
                            strokeAlign: BorderSide.strokeAlignOutside)
                        : Border.all(width: 2, color: Colors.white),
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(hexColor),
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                ),
              );
            })),
      ),
    );
  }
}
