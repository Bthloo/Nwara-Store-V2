import 'package:flutter/material.dart';
import 'package:nwara_strore_sql/core/models/receipt_model.dart';

class ReceiptWidget extends StatelessWidget {
  const ReceiptWidget({super.key,required this.receipt});
final ReceiptModel receipt;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {

        },
        child:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
          child: Text(
              receipt.name,
            style: const TextStyle(
              fontSize: 20,

            ),
          ),
        )
    );
  }
}
