import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nwara_strore_sql/core/general_components/build_show_toast.dart';
import 'package:nwara_strore_sql/core/general_components/color_helper.dart';
import 'package:nwara_strore_sql/core/general_components/custom_form_field.dart';

import '../../viewmodel/add_item_viewmodel/add_item_cubit.dart';

class AddItemBottomSheet extends StatelessWidget {
  const AddItemBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddItemCubit(),
      child: BlocConsumer<AddItemCubit, AddItemState>(
        listener: (context, state) {
          if(state is AddItemSuccess){
            buildShowToast("تم الاضافه بنجاح");
            Navigator.pop(context);
          }else if(state is AddItemFailed){
            buildShowToast(state.message);
            Navigator.pop(context);
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
              key: context.read<AddItemCubit>().formKey,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 10,
                  children: [
                    const Text(
                      "اضافه عنصر جديد",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomFormField(
                      hintText: "الاسم",
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return "قم باضافه اسم العنصر";
                        } else {
                          return null;
                        }
                      },
                      controller: context.read<AddItemCubit>().nameController,
                    ),
                    CustomFormField(
                      keyboardType: TextInputType.number,
                      hintText: "الكميه",
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return "قم باضافه الكميه للعنصر";
                        } else if (value.contains("-")) {
                          return "مسموح بادخال أرقام موجبه فقط";
                        } else if (value.contains(",")) {
                          return "غير مسموح بادخال الفاصلة";
                        } else if (value.contains(".")) {
                          return "غير مسموح بالارقام العشرية";
                        } else {
                          return null;
                        }
                      },
                      controller: context.read<AddItemCubit>().quantityController,
                    ),
                    CustomFormField(
                      keyboardType: TextInputType.number,
                      hintText: "السعر الاساسي",
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return "قم باضافه السعر الاساسي للعنصر";
                        } else if (value.contains("-")) {
                          return "مسموح بادخال ارقام موجبه فقط";
                        } else if (value.contains(",")) {
                          return "غير مسموح بادخال الفاصله";
                        } else {
                          return null;
                        }
                      },
                      controller: context.read<AddItemCubit>().originalPriceController,
                    ),
                    CustomFormField(
                      keyboardType: TextInputType.number,
                      hintText: "سعر البيع",
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return "قم باضافه سعر البيع للعنصر";
                        } else if (value.contains("-")) {
                          return "مسموح بادخال ارقام موجبه فقط";
                        } else if (value.contains(",")) {
                          return "غير مسموح بادخال الفاصله";
                        } else {
                          return null;
                        }
                      },
                      controller: context.read<AddItemCubit>().sellPriceController,
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    Builder(
                        builder: (context) {
                          if(state is AddItemLoading){
                            return const CircularProgressIndicator();
                          }else{
                            return SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                  onPressed: () {
                                    context.read<AddItemCubit>().addItem();
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "اضافه",
                                      style: TextStyle( fontSize: 20 ),
                                    ),
                                  )),
                            );
                          }
                        },
                    ),

                    SizedBox(height: 20,)
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
