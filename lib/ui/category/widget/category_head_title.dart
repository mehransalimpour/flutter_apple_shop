import 'package:flutter/material.dart';

class CategoryHeadTitle extends StatelessWidget {
  const CategoryHeadTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 44, right: 44, bottom: 20),
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
            Image.asset('assets/images/icon_apple_blue.png'),
            const Expanded(
              child: Text(
                'دسته بندی',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'sb', fontSize: 16, color: Colors.blue),
              ),
            )
          ],
        ),
      ),
    );
  }
}
