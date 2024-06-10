import 'package:flutter/material.dart';
import 'package:flutter_apple_shop/ui/category/bloc/category_bloc.dart';
import 'package:flutter_apple_shop/ui/category/bloc/category_event.dart';
import 'package:flutter_apple_shop/ui/category/bloc/category_state.dart';
import 'package:flutter_apple_shop/ui/widgets/loading_animation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widget/category_head_title.dart';
import 'widget/get_category.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CategoryBloc>(context).add(CategoryEventGetData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          return getCategorycreenContent(state, context);
        },
      )),
    );
  }
}

Widget getCategorycreenContent(CategoryState state, BuildContext context) {
  if (state is CategoryLoadingState) {
    return const Center(
      child: LoadingAnimation(),
    );
  } else if (state is CategoryRequestSuccessState) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<CategoryBloc>().add(CategoryEventGetData());
      },
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: CategoryHeadTitle(),
          ),
          const SliverPadding(padding: EdgeInsets.only(top: 24)),
          state.response.fold((exceptionMessage) {
            return SliverToBoxAdapter(child: Text(exceptionMessage));
          }, (category) {
            return GetCategory(
              listcategory: category,
            );
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
