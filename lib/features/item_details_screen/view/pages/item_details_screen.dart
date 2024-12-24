import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nwara_strore_sql/features/item_details_screen/viewmodel/delete_item_viewmodel/delete_item_cubit.dart';
import 'package:nwara_strore_sql/features/item_details_screen/viewmodel/edit_item_viewmodel/edit_item_cubit.dart';
import '../../../../core/general_components/build_show_toast.dart';
import '../../../../core/general_components/custom_form_field.dart';
import '../../../../core/general_components/dialog.dart';
import '../../../../core/models/item_model.dart';

class ItemDetailsScreen extends StatelessWidget {
   ItemDetailsScreen({super.key});
   static const String routeName = "details-screen";
   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
   final TextEditingController nameController = TextEditingController();
   final TextEditingController originalPriceController = TextEditingController();
   final TextEditingController sellPriceController = TextEditingController();
   final TextEditingController quantityController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ItemModel argument = ModalRoute.of(context)!.settings.arguments as ItemModel;
    nameController.text = argument.name;
    quantityController.text = argument.quantity.toString();
    originalPriceController.text = argument.originalPrice.toString();
    sellPriceController.text = argument.sellPrice.toString();
    return Scaffold(
      appBar: AppBar(
        title: const Text("تعديل العنصر",style: TextStyle(
          fontFamily: "Cairo"
        ),),
        actions: [
          BlocProvider(
  create: (context) => DeleteItemCubit(),
  child: BlocConsumer<DeleteItemCubit, DeleteItemState>(
  listener: (context, state) {
    if(state is DeleteItemSuccess){
      buildShowToast("تم مسح العنصر بنجاح");
      Navigator.pop(context);
    }else if(state is DeleteItemFailed){
      buildShowToast(state.message);
    }
  },
  builder: (context, state) {
    if(state is DeleteItemLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }else{
      return TextButton.icon(
        onPressed: (){
          HapticFeedback.heavyImpact();
          DialogUtilities.showMessage(
              context, "هل انت متاكد من مسح هذا العنصر؟",
              nigaiveAction: ()async{
                context.read<DeleteItemCubit>().deleteItem(id: argument.id);
              },
              nigaiveActionName: "نعم",
              posstiveActionName: "الغاء"
          );
        },
        icon: const Icon(Icons.delete,color: Colors.red,),
        label: const Text("مسح",style: TextStyle(
            color: Colors.red
        ),),
      );
    }


  },
),
)
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CustomFormField(
                  hintText: "الاسم",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "قم باضافه اسم العنصر";
                    } else {
                      return null;
                    }
                  },
                  controller: nameController,
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomFormField(
                  keyboardType: TextInputType.number,
                  hintText: "الكميه",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "قم باضافه الكميه للعنصر";
                    }else if(value.contains("-")){
                      return "مسموح بادخال ارقام موجبه فقط";
                    } else if(value.contains(",")){
                      return "غير مسموح بادخال الفاصله";
                    }else {
                      return null;
                    }
                  },
                  controller: quantityController,
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomFormField(
                  keyboardType: TextInputType.number,
                  hintText: "السعر الاساسي",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "قم باضافه السعر الاساسي للعنصر";
                    }else if(value.contains("-")){
                      return "مسموح بادخال ارقام موجبه فقط";
                    } else if(value.contains(",")){
                      return "غير مسموح بادخال الفاصله";
                    }else {
                      return null;
                    }
                  },
                  controller:
                  originalPriceController,
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomFormField(
                  keyboardType: TextInputType.number,
                  hintText: "سعر البيع",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "قم باضافه سعر البيع للعنصر";
                    }else if(value.contains("-")){
                      return "مسموح بادخال ارقام موجبه فقط";
                    } else if(value.contains(",")){
                      return "غير مسموح بادخال الفاصله";
                    }else {
                      return null;
                    }
                  },
                  controller:
                  sellPriceController,
                ),
                SizedBox(height: 40.h,),
                BlocProvider(
  create: (context) => EditItemCubit(),
  child: BlocConsumer<EditItemCubit, EditItemState>(
  listener: (context, state) {
    if(state is EditItemSuccess){
      buildShowToast("تم تعديل العنصر بنجاح");
      Navigator.pop(context);
    }else if(state is EditItemFailed){
      buildShowToast(state.message);
    }
  },
  builder: (context, state) {

    if(state is EditItemLoading){
      return const Center(
        child: CircularProgressIndicator(),
      );
    }else{
      return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
            onPressed: () {
              if(_formKey.currentState!.validate()== false) {
                HapticFeedback.heavyImpact();
                return;
              }else{
                context.read<EditItemCubit>().editItem(item: ItemModel(
                  id: argument.id,
                  name: nameController.text,
                  quantity: int.parse(quantityController.text),
                  originalPrice: double.parse(originalPriceController.text),
                  sellPrice: double.parse(sellPriceController.text),
                ));
              }
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "حفظ التغييرات",
                style: TextStyle(
                    color: Colors.white, fontSize: 20),
              ),
            )),
      );
    }


  },
),
),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
