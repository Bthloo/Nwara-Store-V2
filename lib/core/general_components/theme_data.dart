import 'package:flutter/material.dart';

import 'color_helper.dart';

ThemeData themeData(BuildContext context) {
  return ThemeData(
    textTheme: const TextTheme(
      titleMedium:  TextStyle(
          color: ColorHelper.mainColor,
          fontSize: 25,
          fontFamily: "Cairo",
          fontWeight: FontWeight.bold
      ),
    ),
    dialogTheme: const DialogTheme(
      titleTextStyle: TextStyle(
          color: ColorHelper.mainColor,
          fontSize: 20,

      ),
      backgroundColor: ColorHelper.darkColor,
      contentTextStyle: TextStyle(
          color: Colors.white
      ),

    ),
    fontFamily: "Cairo",
    elevatedButtonTheme:  ElevatedButtonThemeData(

      style: ButtonStyle(
        backgroundColor: const WidgetStatePropertyAll(
            ColorHelper.mainColor
        ),
        shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13)
            )

      ),
    ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      dragHandleColor: ColorHelper.mainColor,
      backgroundColor: ColorHelper.darkColor,
      dragHandleSize: Size(200,7),
      showDragHandle: true,
      shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
        labelTextStyle: WidgetStatePropertyAll(
            TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: ColorHelper.darkColor.withOpacity(.85)
            )
        )
    ),
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: ColorHelper.mainColor,
      ),
        color: ColorHelper.darkColor,
        centerTitle: true,
        titleTextStyle: TextStyle(
            color: ColorHelper.mainColor,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          fontFamily: "Cairo"
        )
    ),
    scaffoldBackgroundColor: ColorHelper.darkColor,
    colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(100, 255,191,82)),
    useMaterial3: true,
  );
}
