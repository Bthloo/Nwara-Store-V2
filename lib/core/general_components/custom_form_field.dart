
import 'package:flutter/material.dart';

typedef MyValidator = String? Function(String?);
typedef OnChange = void Function(String?);
typedef OnTap = void Function();

class CustomFormField extends StatelessWidget {
 final String hintText;
 final MyValidator validator;
 final OnChange? onChange;
 final bool focus;
 final OnTap? onTab;
 final TextEditingController controller;
 final TextInputType keyboardType;
 final IconButton? suffix;
 final Widget? prefix;
 final bool isPassword;
 final FocusNode? passwordFocusNode;
  const CustomFormField(
      {super.key,
      required this.hintText,
      required this.validator,
      required this.controller,
      this.prefix,
      this.keyboardType = TextInputType.text,
      this.suffix,
      this.isPassword = false,
      this.passwordFocusNode,
        this.onChange,
        this.onTab,
        this.focus = false
      });
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
        textDirection: TextDirection.rtl,
        autofocus: focus,
        controller: controller,
        onTap: onTab,
        validator: validator,
        keyboardType: keyboardType,
        obscureText: isPassword,
        focusNode: passwordFocusNode,
        onChanged: onChange,
        //textDirection: TextDirection,
        style: const TextStyle(color: Color(0xffEDEDED)),
        decoration: InputDecoration(
            suffixIcon: suffix,
            prefixIcon: prefix,
            //labelText: 'Email',
            labelText: hintText,
            //suffixIcon: ,
            labelStyle:  const TextStyle(color: Color(0xffEDEDED)),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            fillColor: const Color(0xff444444),
            filled: true),
      ),
    );
  }
}
