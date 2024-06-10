import 'package:flutter/material.dart';
import 'package:flutter_apple_shop/data/model/variants.dart';

class SotrageVariantList extends StatefulWidget {
  final List<Variant> storageVarinats;
  const SotrageVariantList(this.storageVarinats, {super.key});

  @override
  State<SotrageVariantList> createState() => _SotrageVariantListState();
}

class _SotrageVariantListState extends State<SotrageVariantList> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SizedBox(
        height: 26,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.storageVarinats.length,
            itemBuilder: ((context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 10),
                  height: 25,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    border: (_selectedIndex == index)
                        ? Border.all(width: 2, color: Colors.blue)
                        : Border.all(width: 1, color: Colors.grey),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Center(
                        child: Text(
                      widget.storageVarinats[index].value!,
                      style: const TextStyle(fontFamily: 'sb', fontSize: 12),
                    )),
                  ),
                ),
              );
            })),
      ),
    );
  }
}
