import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/general_components/color_helper.dart';
import '../../viewmodel/bottom_app_bar_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const routeName = "home-screen";

  @override
  Widget build(BuildContext context) {
    debugPrint("home rebuild");
    return BlocProvider(
      create: (context) => BottomAppBarCubit(),
      child: BlocBuilder< BottomAppBarCubit, BottomAppBarState>(
        builder: (context, state) {
          return Scaffold(
            bottomNavigationBar: NavigationBar(
              selectedIndex: BottomAppBarCubit.get(context).currentTapIndex,
              onDestinationSelected: (value) {
                BottomAppBarCubit.get(context).changeIndex(value);
              },
              backgroundColor: ColorHelper.mainColor,
              indicatorColor: ColorHelper.darkColor,

              destinations: const [
                NavigationDestination(
                  selectedIcon: Icon(Icons.receipt_long, color: ColorHelper.mainColor,),
                  icon: Icon(Icons.receipt_long_outlined),
                  label: 'الفواتير',
                ),
                NavigationDestination(
                  selectedIcon: Icon(Icons.warehouse, color: ColorHelper.mainColor,),
                  icon: Icon(Icons.warehouse_outlined),
                  label: 'المخزن',
                ),

              ],
            ),

            appBar: AppBar(
                title:  Hero(
                  tag: "logo",
                  child: Text("Nwara Store",style:  Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: ColorHelper.mainColor,
                      fontFamily: "Cairo"
                  ),),
                )
            ),
            body: BottomAppBarCubit.get(context).tabs
            [BottomAppBarCubit.get(context).currentTapIndex],
          );
        },
      ),
    );
  }



}

