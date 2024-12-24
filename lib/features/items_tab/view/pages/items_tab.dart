import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nwara_strore_sql/core/general_components/color_helper.dart';
import 'package:nwara_strore_sql/core/general_components/dialog.dart';
import 'package:nwara_strore_sql/features/item_details_screen/view/pages/item_details_screen.dart';
import 'package:nwara_strore_sql/features/items_tab/view/components/add_item_bottom_sheet.dart';
import 'package:nwara_strore_sql/features/items_tab/view/components/item_widget.dart';
import 'package:nwara_strore_sql/features/items_tab/viewmodel/get_items_viewmodel/get_items_viewmodel_cubit.dart';

class ItemsTab extends StatelessWidget {
  const ItemsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
          create: (context) =>
          GetItemsCubit()
            ..getItems(),
          child: BlocBuilder<GetItemsCubit, GetItemsState>(
            builder: (context, state) {
              return Scaffold(
                floatingActionButton: FloatingActionButton(
                  backgroundColor: ColorHelper.mainColor,
                  child: Icon(Icons.add, color: ColorHelper.darkColor,),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      enableDrag: true,
                      isDismissible: true,
                      isScrollControlled: true,
                      showDragHandle: true,
                      builder: (context) {
                        return AddItemBottomSheet();
                      },
                    ).then((value) {
                      if(context.mounted){
                        context.read<GetItemsCubit>().getItems();
                      }
                    },);
                  },
                ),
                body: Builder(
                    builder: (context) {
                      if(state is GetItemsLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }else if(state is GetItemsFailed){
                        return Center(
                          child: Text(state.message),
                        );
                      }else if(state is GetItemsSuccess){
                        if(state.items.isEmpty){
                          return const Center(
                            child: Text("لا يوجد عناصر"),
                          );
                        }else{
                          return ListView.separated(
                              itemBuilder: (context, index) {
                                return ItemWidget(
                                    name: state.items[index].name,
                                    quantity: state.items[index].quantity,
                                    originalPrice: state.items[index].originalPrice,
                                    sellPrice: state.items[index].sellPrice,
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      ItemDetailsScreen.routeName,
                                      arguments: state.items[index]
                                    ).then((value) {
                                      if(context.mounted){
                                        context.read<GetItemsCubit>().getItems();
                                      }
                                    },);
                                  },
                                );
                              },
                              separatorBuilder: (context, index) =>
                              const SizedBox(height: 10,),
                              itemCount:state.items.length
                          );
                        }
                      }else{
                        return const SizedBox();
                      }
                    },
                ),
              );
            },
          ),
    );
  }
}
