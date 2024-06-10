import 'package:flutter/material.dart';
import 'package:flutter_apple_shop/apple_shop.dart';
import 'package:flutter_apple_shop/di/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await getitinit();

  runApp(const AppleShop());
}
