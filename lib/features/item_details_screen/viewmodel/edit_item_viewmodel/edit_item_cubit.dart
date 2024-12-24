import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nwara_strore_sql/core/db/init_sqflite.dart';
import 'package:nwara_strore_sql/core/models/item_model.dart';

part 'edit_item_state.dart';

class EditItemCubit extends Cubit<EditItemState> {
  EditItemCubit() : super(EditItemInitial());
  SqlDB db = SqlDB();
  editItem({required ItemModel item})async{
    emit(EditItemLoading());
    try{

      await db.updateData(
          tableName: "items",
          values: {
            'name': item.name,
            'originalPrice': item.originalPrice,
            'sellPrice': item.sellPrice,
            'quantity': item.quantity,
            'id' : item.id
          },
      );
      emit(EditItemSuccess("تم تعديل العنصر بنجاح"));
    }catch(e){
      emit(EditItemFailed("Error : ${e.toString()}"));
    }
  }
}
