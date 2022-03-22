import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical/shared/styles/font_styles.dart';

import 'custom_text.dart';

class CustomListTile extends StatelessWidget {
  final Function()? onPress;
  final String? text;
  final String? imageName;

  const CustomListTile({
    Key? key,
    this.onPress,
    this.text,
    this.imageName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 0),
        onTap: onPress,
        leading: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.r),
            color: const Color(0x1200c569),
          ),
          child: Image.asset('assets/menu_icons/$imageName', fit: BoxFit.cover,),
        ),
        title: CustomText(
          text: text,
          textStyle: primaryTextStyle(),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_outlined,
          size: 30.r,
        ),
      ),
    );
  }
}
