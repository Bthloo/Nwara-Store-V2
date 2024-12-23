import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bottom_app_bar_state.dart';
class BottomAppBarCubit extends Cubit<BottomAppBarState> {
  BottomAppBarCubit() : super(BottomAppBarInitial());
  static BottomAppBarCubit get(context) => BlocProvider.of(context);
  int currentTapIndex = 0;
  List<Widget> tabs = [

  ];
  void changeIndex(int index) {
    currentTapIndex = index;
    emit(ChangeBottomAppbarState());
  }
}
