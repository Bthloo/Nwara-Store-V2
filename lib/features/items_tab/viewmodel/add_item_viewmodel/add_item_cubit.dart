import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nwara_strore_sql/core/db/init_sqflite.dart';

part 'add_item_state.dart';

class AddItemCubit extends Cubit<AddItemState> {
  AddItemCubit() : super(AddItemInitial());
 final TextEditingController nameController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController originalPriceController = TextEditingController();
  final TextEditingController sellPriceController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  SqlDB db = SqlDB();
  addItem()async{

    if(!formKey.currentState!.validate()){
      return;
    }else{
      emit(AddItemLoading());
      try{
        await db.insertData(
            tableName: "items",
            values: {
              "name":nameController.text,
              "quantity":quantityController.text,
              "originalPrice":originalPriceController.text,
              "sellPrice":sellPriceController.text
            }
        );

        // await db.insertData(
        //     query: '''
        // INSERT INTO items (name,quantity,originalPrice,sellPrice) VALUES ('${nameController.text}','${quantityController.text}','${originalPriceController.text}','${sellPriceController.text}')
        // ''');
        emit(AddItemSuccess("تم الاضافه بنجاح"));
      }catch(e){
        emit(AddItemFailed("Error : ${e.toString()}"));
        debugPrint("Error : ${e.toString()}");
      }
    }


  }
  @override
  Future<void> close() {
    nameController.dispose();
    quantityController.dispose();
    originalPriceController.dispose();
    sellPriceController.dispose();
    return super.close();
  }
}
