import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nwara_strore_sql/features/receipts_tab/view/components/add_receipt_bottom_sheet.dart';
import 'package:nwara_strore_sql/features/receipts_tab/viewmodel/add_receipt_viewmodel/add_receipt_cubit.dart';
import 'package:nwara_strore_sql/features/receipts_tab/viewmodel/get_receipts_viewmodel/get_receipts_cubit.dart';

import '../components/receipt_widget.dart';

class ReceiptsScreen extends StatelessWidget {
  const ReceiptsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetReceiptsCubit()..getReceipts(),
      child: BlocBuilder<GetReceiptsCubit, GetReceiptsState>(
        builder: (context, state) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                  enableDrag: true,
                  isDismissible: true,
                  isScrollControlled: true,
                  showDragHandle: true,
                    builder: (context) {
                      return AddReceiptBottomSheet();
                    },
                ).then((value) {
                  if(context.mounted){
                    context.read<GetReceiptsCubit>().getReceipts();
                  }
                },);
              },
              child: const Icon(Icons.add),
            ),
            body: Builder(
              builder: (context) {
                if(state is GetReceiptsLoading){
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }else if(state is GetReceiptsSuccess){
                  if(state.receipts.isEmpty) {
                    return const Center(
                      child: Text("لا يوجد فواتير"),
                    );
                  }else{
                    return ListView.separated(
                      itemBuilder: (context, index) {
                        return ReceiptWidget(
                          receipt: state.receipts[index],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 10,);
                      },
                      itemCount: state.receipts.length,
                    );
                  }
                }else if(state is GetReceiptsFailed){
                  return Center(
                    child: Text(state.message),
                  );
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
