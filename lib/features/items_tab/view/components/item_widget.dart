import 'package:flutter/material.dart';

import '../../../../core/general_components/color_helper.dart';
import '../../../../core/general_components/dialog.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({
    super.key,
    required this.name,
    required this.quantity,
    required this.originalPrice,
    required this.sellPrice,
    required this.onPressed,
  });

  final String name;
  final int quantity;
  final num originalPrice;
  final num sellPrice;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        ElevatedButton(
          style: const ButtonStyle(
              shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(13)))
              )
          ),
          onPressed: onPressed,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              spacing: 5,
              children: [
                Text(
                  name,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: ColorHelper.darkColor,
                    fontSize: 20,
                    //fontWeight: FontWeight.w500
                  ),
                ),
                Text(
                  " الكميه : $quantity",
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color:quantity == 0 ? Colors.red :
                    ColorHelper.darkColor,
                    fontSize: 13,
                    //fontWeight: FontWeight.w500
                  ),
                ),
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "سعر البيع : $sellPrice",
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: ColorHelper.darkColor,
                        fontSize: 17,
                        //fontWeight: FontWeight.w500
                      ),
                    ),
                    Text(
                      "السعر الاصلي : $originalPrice",
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: ColorHelper.darkColor,
                        fontSize: 17,
                        //fontWeight: FontWeight.w500
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Visibility(
          visible: quantity == 0,
          child: IconButton(
            onPressed: () {
              DialogUtilities.showMessage(
                context,
                "\nانتهت الكميه لهذا العنص\n",
                posstiveActionName: "حسنا",
              );
            },
            icon: Icon (
              Icons.error_outline,
              size: 30,
              color: quantity == 0 ?
              Colors.red : Colors.transparent,),

          ),
        )
      ],
    );
  }
}
