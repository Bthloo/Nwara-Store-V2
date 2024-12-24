import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nwara_strore_sql/features/home_screen/view/pages/home_screen.dart';
import 'package:nwara_strore_sql/features/item_details_screen/view/pages/item_details_screen.dart';

import 'core/general_components/theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:  Size(MediaQuery.sizeOf(context).width, MediaQuery.sizeOf(context).height),
      minTextAdapt: true,
      splitScreenMode: true,
      ensureScreenSize: true,
      useInheritedMediaQuery: true,
      child: MaterialApp(
        title: 'Nwara Store',
        themeMode: ThemeMode.dark,
        theme: themeData(context),
        initialRoute: HomeScreen.routeName,
        routes: {
          HomeScreen.routeName: (_) => const HomeScreen(),
          ItemDetailsScreen.routeName: (_) =>  ItemDetailsScreen(),
        },
      ),
    );
  }
}
