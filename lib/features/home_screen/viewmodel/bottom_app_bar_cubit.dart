import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nwara_strore_sql/features/receipts_tab/view/pages/receipts_screen.dart';

import '../../items_tab/view/pages/items_tab.dart';

part 'bottom_app_bar_state.dart';
class BottomAppBarCubit extends Cubit<BottomAppBarState> {
  BottomAppBarCubit() : super(BottomAppBarInitial());
  static BottomAppBarCubit get(context) => BlocProvider.of(context);
  int currentTapIndex = 0;
  List<Widget> tabs = [
    ReceiptsScreen(),
    ItemsTab(),
  ];
  void changeIndex(int index) {
    currentTapIndex = index;
    emit(ChangeBottomAppbarState());
  }
}
