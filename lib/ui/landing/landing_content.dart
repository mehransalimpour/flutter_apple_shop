import 'package:flutter/material.dart';
import 'package:flutter_apple_shop/ui/Home/bloc/Home/home_bloc.dart';
import 'package:flutter_apple_shop/ui/Home/home_screen.dart';
import 'package:flutter_apple_shop/ui/bottom_navigation_bar/bloc/bottom_navigation_state.dart';
import 'package:flutter_apple_shop/ui/category/bloc/category_bloc.dart';
import 'package:flutter_apple_shop/ui/category/category_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bottom_navigation_bar/bloc/bottom_navigation_bloc.dart';

class LandingContent extends StatelessWidget {
  const LandingContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
      builder: (context, state) {
        switch (state.value) {
          case 0:
            return BlocProvider(
              create: (context) => HomeBloc(),
              child: const HomeScreen(),
            );
          case 1:
            return BlocProvider(
              create: (context) => CategoryBloc(),
              child: const CategoryScreen(),
            );
          case 2:
            return Container();
          case 3:
            return Container();
          case 4:
            return Container();
        }
        return const SizedBox.shrink();
      },
    );
  }
}
