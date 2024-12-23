import 'package:fluttertoast/fluttertoast.dart';

import 'color_helper.dart';

Future<bool?> buildShowToast(String message) {
  return Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,

    backgroundColor: ColorHelper.darkColor,
    textColor: ColorHelper.mainColor,
    fontSize: 15.0,
  );
}