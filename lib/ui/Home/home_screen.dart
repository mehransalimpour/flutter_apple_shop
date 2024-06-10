import 'package:flutter/material.dart';
import 'package:flutter_apple_shop/ui/Home/bloc/Home/home_bloc.dart';
import 'package:flutter_apple_shop/ui/Home/bloc/Home/home_event.dart';
import 'package:flutter_apple_shop/ui/Home/bloc/Home/home_state.dart';
import 'package:flutter_apple_shop/ui/Home/Widget/get_banner_image.dart';
import 'package:flutter_apple_shop/ui/Home/Widget/get_category_list.dart';
import 'package:flutter_apple_shop/ui/Home/Widget/get_most_view_product.dart';
import 'package:flutter_apple_shop/ui/Home/Widget/get_titles.dart';
import 'package:flutter_apple_shop/ui/Home/Widget/search_box.dart';
import 'package:flutter_apple_shop/ui/widgets/loading_animation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Widget/get_best_seller_product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(HomeEventGetData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return _getHomeScreenContent(state, context);
        },
      )),
    );
  }

  Widget _getHomeScreenContent(HomeState state, BuildContext context) {
    if (state is HomeLoadingState) {
      return const Center(
        child: LoadingAnimation(),
      );
    } else if (state is HomeRequestSuccessState) {
      return RefreshIndicator(
        onRefresh: () async {
          context.read<HomeBloc>().add(HomeEventGetData());
        },
        child: CustomScrollView(
          slivers: [
            const SliverPadding(padding: EdgeInsets.only(top: 24)),
            const GetSearchBox(),
            state.bannerlist.fold((exceptionMessage) {
              return SliverToBoxAdapter(child: Text(exceptionMessage));
            }, (listBanners) {
              return Getbanners(
                bannerCampain: listBanners,
              );
            }),
            //        getTitles(texttitle: 'دسته بندی'),
            state.categoryList.fold((exceptionMessage) {
              return SliverToBoxAdapter(child: Text(exceptionMessage));
            }, (listcategories) {
              return GetCategoryList(
                list: listcategories,
              );
            }),
            getTitles(
                texttitle1: 'پر قروش تزین ها', texttitle2: 'مشاهده ی همه'),
            state.bestSellerProductList.fold((exceptionMessage) {
              return SliverToBoxAdapter(child: Text(exceptionMessage));
            }, (listProduct) {
              return Getbestsellerproducts(listProduct);
            }),
            getTitles(
                texttitle1: 'پربازدیدترین ها', texttitle2: 'مشاهده ی همه'),
            state.hotestProductList.fold((exceptionMessage) {
              return SliverToBoxAdapter(child: Text(exceptionMessage));
            }, (listProduct) {
              return GetMostViewedProduct(listProduct);
            }),
          ],
        ),
      );
    } else {
      return const Center(
        child: Text('خطایی در دریافت اطلاعات به وجود آمده!'),
      );
    }
  }
}
