import 'package:flutter_apple_shop/data/model/variant_type.dart';
import 'package:flutter_apple_shop/data/model/variants.dart';

class ProductVarint {
  VariantType variantType;
  List<Variant> variantList;

  ProductVarint(this.variantType, this.variantList);
}
