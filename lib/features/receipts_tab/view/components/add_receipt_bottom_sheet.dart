import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/general_components/build_show_toast.dart';
import '../../../../core/general_components/custom_form_field.dart';
import '../../viewmodel/add_receipt_viewmodel/add_receipt_cubit.dart';

class AddReceiptBottomSheet extends StatelessWidget {
  const AddReceiptBottomSheet({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => AddReceiptCubit(),
  child: BlocConsumer<AddReceiptCubit, AddReceiptState>(
  listener: (context, state) {
    if(state is AddReceiptSuccess){
      buildShowToast("تم الاضافه بنجاح");
      Navigator.pop(context);
    }else if(state is AddReceiptFailed){

      buildShowToast(" حدث خطأ ${state.message} ");
    }
  },
  builder: (context, state) {
    return BottomSheet(
      showDragHandle: false,
      enableDrag: false,
        onClosing: () {

        },
        builder: (context) {
          return SingleChildScrollView(
            child: Form(
              key: context.read<AddReceiptCubit>().formKey,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 10,
                  children: [
                    const Text(
                      "اضافه فاتوره جديده",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomFormField(
                      hintText: "الاسم",
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return "قم باضافه اسم الفاتوره";
                        } else {
                          return null;
                        }
                      },
                      controller: context.read<AddReceiptCubit>().nameController,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Builder(
                        builder: (context) {
                          if (state is AddReceiptLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return  ElevatedButton(
                              onPressed: () {
                                context.read<AddReceiptCubit>().addReceipt();
                              },
                              child: const Text("اضافه"),
                            );
                          }
                        },
                    ),
                   SizedBox(height: 30,)
                  ],
                ),
              ),
            ),
          );
        },
    );
  },
),
);
  }
}
