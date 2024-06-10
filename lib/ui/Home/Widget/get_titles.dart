import 'package:flutter/material.dart';

Widget getTitles({required String texttitle1, required String texttitle2}) {
  return SliverToBoxAdapter(
    child: Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, bottom: 20, top: 20),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          Text(
            texttitle1,
            style: const TextStyle(
                fontFamily: 'sb', fontSize: 12, color: Colors.blue),
          ),
          const Spacer(),
          Text(
            texttitle2,
            style: const TextStyle(fontFamily: 'sb', color: Colors.blue),
          ),
          const SizedBox(
            width: 10,
          ),
          Image.asset('assets/images/icon_left_categroy.png'),
        ],
      ),
    ),
  );
}
