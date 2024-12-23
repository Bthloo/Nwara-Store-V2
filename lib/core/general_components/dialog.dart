import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DialogUtilities {
  static void showLoadingDialog(BuildContext context, String message) {
    showDialog(
        context: context,
        builder: (buildContext) {
          return AlertDialog.adaptive(
            content: Row(
              children: [
                const CircularProgressIndicator(),
                SizedBox(
                  width: 10.w,
                ),
                Text(message)
              ],
            ),
          );
        },
        barrierDismissible: false);
  }

  static void hideDialog(BuildContext context) {
    Navigator.pop(context);
  }

  static void showMessage(BuildContext context, String message,
      {String? posstiveActionName,
      VoidCallback? posstiveAction,
      String? nigaiveActionName,
      VoidCallback? nigaiveAction,
      bool dismissible = true}) {
    List<Widget> actions = [];
    if (posstiveActionName != null) {
      actions.add(
          TextButton(

          onPressed: () {
            Navigator.pop(context);
            posstiveAction?.call();
          },
          child: Text(
            posstiveActionName,
            style: const TextStyle(color: Colors.blue),
          )));
    }
    if (nigaiveActionName != null) {
      actions.add(TextButton(
          style: const ButtonStyle(
              foregroundColor: WidgetStatePropertyAll(Colors.red),
              ),
          onPressed: () {
            Navigator.pop(context);
            nigaiveAction?.call();
          },
          child: Text(nigaiveActionName)));
    }
    showDialog(
      context: context,
      builder: (buildContext) {
        return AlertDialog.adaptive(
          content: Text(message,style: const TextStyle(
            fontFamily: "Cairo",
          ),textAlign: TextAlign.center,),
          actions: actions,
        );
      },
    );
  }
}
