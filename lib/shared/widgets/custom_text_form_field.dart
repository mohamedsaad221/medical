import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical/shared/helper/constance.dart';
import 'package:medical/shared/styles/font_styles.dart';

import 'custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? type;
  final String? text;
  final String? hint;
  final Function(String)? onSubmit;
  final Function(String)? onChange;
  final FormFieldValidator? validate;
  final String? labelText;
  final IconData? prefixIcon;
  final Function()? onTap;
  final IconData? suffixIcon;
  final bool isPassword;
  final Function? suffixPressed;
  final Function(String?)? onSaved;
  final FocusNode? focusNode;

  const CustomTextFormField({
    Key? key,
    this.controller,
    required this.type,
    required this.text,
    required this.hint,
    this.onSubmit,
    this.onChange,
    required this.validate,
    this.labelText,
    this.prefixIcon,
    this.onTap,
    this.suffixIcon,
    this.isPassword = false,
    this.suffixPressed,
    this.onSaved,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: text,
            textStyle: thirdTextStyle().copyWith(color: Colors.grey.shade900),
          ),
          TextFormField(
            focusNode: focusNode,
            textAlignVertical: TextAlignVertical.center,
            textAlign: TextAlign.start,
            controller: controller,
            keyboardType: type,
            onFieldSubmitted: onSubmit,
            onChanged: onChange,
            onTap: onTap,
            onSaved: onSaved,
            validator: validate,
            obscureText: isPassword,
            textDirection: lang == 'ar' ? TextDirection.rtl : TextDirection.ltr,
            style: TextStyle(
              fontSize: 18.sp,
              color: Colors.black,
            ),
            decoration: InputDecoration(
              hintTextDirection: lang == 'ar' ? TextDirection.rtl : TextDirection.ltr,
              labelText: labelText,
              labelStyle: TextStyle(
                fontSize: 18.sp,
              ),
              hintText: hint,
              hintStyle: TextStyle(
                color: Colors.black,
                fontSize: 18.sp,
              ),
              suffixIcon:
              IconButton(
                icon: Icon(suffixIcon),
                onPressed: () {
                  if(suffixIcon != null){
                    suffixPressed!();
                  }

                },
                // color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
