import 'package:flutter/material.dart';
import 'package:flutter_apple_shop/ui/Home/bloc/Home/home_bloc.dart';
import 'package:flutter_apple_shop/ui/Home/home_screen.dart';
import 'package:flutter_apple_shop/ui/bottom_navigation_bar/bloc/bottom_navigation_bloc.dart';
import 'package:flutter_apple_shop/ui/bottom_navigation_bar/bloc/bottom_navigation_state.dart';
import 'package:flutter_apple_shop/ui/landing/landing_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppleShop extends StatelessWidget {
  const AppleShop({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BottomNavigationBloc(
            BottomNavigationState(value: 0),
          ),
        ),
        BlocProvider(
          create: (context) => HomeBloc(),
          child: const HomeScreen(),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LandingPage(),
      ),
    );
  }
}
