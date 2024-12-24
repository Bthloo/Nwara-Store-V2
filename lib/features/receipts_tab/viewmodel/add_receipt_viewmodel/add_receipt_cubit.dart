import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:nwara_strore_sql/core/db/init_sqflite.dart';

part 'add_receipt_state.dart';

class AddReceiptCubit extends Cubit<AddReceiptState> {
  AddReceiptCubit() : super(AddReceiptInitial());
  final TextEditingController nameController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  SqlDB db = SqlDB();
  addReceipt() async {
    if(!formKey.currentState!.validate()){
      return;
    }else{
      emit(AddReceiptLoading());
      try {
        await db.insertData(
            tableName: "receipts",
            values: {
              'name': nameController.text,
              'originalPrice': 0,
              'sellPrice': 0,
              'netIncome': 0,
            });
        emit(AddReceiptSuccess("تم الاضافه بنجاح"));
      } catch (e) {
        emit(AddReceiptFailed("Error : ${e.toString()}"));
      }
    }
  }

  @override
  Future<void> close() {
    nameController.dispose();
    return super.close();
  }
}
