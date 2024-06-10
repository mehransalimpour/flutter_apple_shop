import 'package:flutter/material.dart';
import 'package:flutter_apple_shop/ui/bottom_navigation_bar/bloc/bottom_navigation_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bottom_navigation_bloc.dart';
import 'bloc/bottom_navigation_state.dart';
import 'my_bottom_navigation_bar_item.dart';

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
      builder: (context, state) => BottomNavigationBar(
        currentIndex: state.value,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedIconTheme: IconThemeData(
          color: Theme.of(context).iconTheme.color,
        ),
        unselectedIconTheme: IconThemeData(
          color: Theme.of(context).iconTheme.color?.withOpacity(0.8),
        ),
        onTap: (value) => context.read<BottomNavigationBloc>().add(
              BottomNavigationChangeValue(
                newValue: value,
              ),
            ),
        items: [
          const MyBottomNavigationBarItem(
            iconData: Icons.shopping_basket_outlined,
            activeIconData: Icons.shopping_basket,
            title: 'home',
          ).item,
          const MyBottomNavigationBarItem(
            iconData: Icons.search_outlined,
            activeIconData: Icons.saved_search,
            title: 'search',
          ).item,
          const MyBottomNavigationBarItem(
            iconData: Icons.add_box_outlined,
            activeIconData: Icons.add_box,
            title: '',
          ).item,
          const MyBottomNavigationBarItem(
            iconData: Icons.play_circle_outline,
            activeIconData: Icons.play_circle_fill,
            title: 'play',
          ).item,
          const MyBottomNavigationBarItem(
            iconData: Icons.account_circle_outlined,
            activeIconData: Icons.account_circle_rounded,
            title: 'profile',
          ).item,
        ],
      ),
    );
  }
}
