import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nwara_strore_sql/core/db/init_sqflite.dart';

part 'delete_item_state.dart';

class DeleteItemCubit extends Cubit<DeleteItemState> {
  DeleteItemCubit() : super(DeleteItemInitial());
  SqlDB db = SqlDB();
  deleteItem({required int id})async{
    emit(DeleteItemLoading());
    try{
      await db.deleteData(
          tableName: "items",
          id: id
      );
      emit(DeleteItemSuccess("تم حذف العنصر بنجاح"));
    }catch(e){
      emit(DeleteItemFailed("Error : ${e.toString()}"));
    }
  }
}
