import 'package:flutter/material.dart';
import 'package:flutter_apple_shop/data/model/product.dart';
import 'package:flutter_apple_shop/data/model/product_varint.dart';
import 'package:flutter_apple_shop/data/model/variant_type.dart';
import 'package:flutter_apple_shop/ui/Home/Widget/gallery_widget.dart';
import 'package:flutter_apple_shop/ui/Home/bloc/product/product_bloc.dart';
import 'package:flutter_apple_shop/ui/Home/bloc/product/product_event.dart';
import 'package:flutter_apple_shop/ui/Home/bloc/product/product_state.dart';
import 'package:flutter_apple_shop/ui/widgets/loading_animation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Widget/color_variant_widget.dart';
import 'Widget/storage_variant_widget.dart';

class ProductDetailScreen extends StatefulWidget {
  final ProductModel product;

  const ProductDetailScreen(this.product, {super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: ((context) {
        var bloc = ProductBloc();
        bloc.add(ProductInitializeEvent(
            widget.product.id, widget.product.categoryId));
        return bloc;
      }),
      child: DetailContentWidget(
        parentWidget: widget,
      ),
    );
  }
}

class DetailContentWidget extends StatelessWidget {
  const DetailContentWidget({
    super.key,
    required this.parentWidget,
  });

  final ProductDetailScreen parentWidget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: ((context, state) {
          if (state is ProductDetailLoadingState) {
            return const Center(child: LoadingAnimation());
          }
          return SafeArea(
            child: CustomScrollView(
              slivers: [
                if (state is ProductDetailResponseState) ...{
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 44, right: 44, bottom: 32),
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
                            Expanded(
                                child: state.productCategory.fold((l) {
                              return const Text(
                                'اطلاعات محصول',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'sb',
                                    fontSize: 16,
                                    color: Colors.blue),
                              );
                            }, (productCategory) {
                              return Text(
                                productCategory.title!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontFamily: 'sb',
                                    fontSize: 16,
                                    color: Colors.blue),
                              );
                            })),
                            Image.asset('assets/images/icon_back.png'),
                            const SizedBox(
                              width: 16,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                },
                if (state is ProductDetailResponseState) ...{
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Text(
                        parentWidget.product.name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontFamily: 'sb',
                            fontSize: 16,
                            color: Colors.black),
                      ),
                    ),
                  )
                },
                if (state is ProductDetailResponseState) ...{
                  state.productImages.fold((l) {
                    return SliverToBoxAdapter(
                      child: Text(l),
                    );
                  }, (productImageList) {
                    return GalleryWidget(
                      productImageList: productImageList,
                      defaultProductThumbnail: parentWidget.product.thumbnail,
                    );
                  })
                },
                if (state is ProductDetailResponseState) ...{
                  state.productVariant.fold((l) {
                    return SliverToBoxAdapter(
                      child: Text(l),
                    );
                  }, (productVariantList) {
                    return VariantContainerGenerator(productVariantList);
                  }),
                },
              ],
            ),
          );
        }),
      ),
    );
  }
}

class VariantContainerGenerator extends StatelessWidget {
  final List<ProductVarint> productVariantList;
  const VariantContainerGenerator(
    this.productVariantList, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(children: [
        for (var productVariant in productVariantList) ...{
          if (productVariant.variantList.isNotEmpty) ...{
            VariantGeneratorChild(productVariant)
          }
        }
      ]),
    );
  }
}

class VariantGeneratorChild extends StatelessWidget {
  final ProductVarint productVariant;
  const VariantGeneratorChild(this.productVariant, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 44, left: 44),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            productVariant.variantType.title!,
            style: const TextStyle(fontFamily: 'sm', fontSize: 12),
          ),
          const SizedBox(
            height: 10,
          ),
          if (productVariant.variantType.type == VariantTypeEnum.cOLOR) ...{
            ColorVarinantList(productVariant.variantList)
          },
          if (productVariant.variantType.type == VariantTypeEnum.sTORAGE) ...{
            SotrageVariantList(productVariant.variantList)
          }
        ],
      ),
    );
  }
}
