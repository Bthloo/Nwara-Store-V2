import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:nwara_strore_sql/core/db/init_sqflite.dart';

import '../../../../core/models/receipt_model.dart';

part 'get_receipts_state.dart';

class GetReceiptsCubit extends Cubit<GetReceiptsState> {
  GetReceiptsCubit() : super(GetReceiptsInitial());
  SqlDB db = SqlDB();
  getReceipts()async{
    emit(GetReceiptsLoading());
    try{
     final List<Map<String, dynamic>> jsonData = await db.readData(tableName: "receipts");
      List<ReceiptModel> receipts = jsonData.map((e) => ReceiptModel.fromJson(e)).toList();
      emit(GetReceiptsSuccess(receipts));
    }catch(e){
      emit(GetReceiptsFailed("Error : ${e.toString()}"));
    }
  }
}
