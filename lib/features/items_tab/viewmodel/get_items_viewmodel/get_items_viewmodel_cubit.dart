import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nwara_strore_sql/core/db/init_sqflite.dart';

import '../../../../core/models/item_model.dart';

part 'get_items_viewmodel_state.dart';

class GetItemsCubit extends Cubit<GetItemsState> {
  GetItemsCubit() : super(GetItemsInitial());
  //List<ItemModel> items = [];
  SqlDB db = SqlDB();
  getItems()async{
    emit(GetItemsLoading());
    try{
      final List<Map<String, dynamic>> jsonData  = await db.readData(
          query: '''
          SELECT * FROM `items`
          '''
      );
      List<ItemModel> items = jsonData.map((e) => ItemModel.fromJson(e)).toList();
      emit(GetItemsSuccess(items));
    }catch(e){
      emit(GetItemsFailed("Error : ${e.toString()}"));
    }
  }
}
