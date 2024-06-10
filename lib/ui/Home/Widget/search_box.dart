import 'package:flutter/material.dart';

class GetSearchBox extends StatelessWidget {
  const GetSearchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 44, right: 44, bottom: 10),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            height: 46,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Row(
              children: [
                const SizedBox(
                  width: 16,
                ),
                Image.asset('assets/images/icon_search.png'),
                const SizedBox(
                  width: 10,
                ),
                const Expanded(
                  child: Text(
                    'جستجوی محصولات',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontFamily: 'sb', fontSize: 16, color: Colors.grey),
                  ),
                ),
                Image.asset('assets/images/icon_apple_blue.png'),
                const SizedBox(
                  width: 16,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
