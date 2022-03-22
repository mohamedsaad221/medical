import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical/shared/styles/font_styles.dart';

import 'custom_text.dart';

class CustomSocialButton extends StatelessWidget {
  final String? text;
  final String? imageName;
  final VoidCallback? onPressed;

  const CustomSocialButton({
    Key? key,
    this.text,
    this.imageName,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.07,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        color: Colors.grey.shade100,
      ),
      child: TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 50.w,
              height: 50.h,
              child: Image.asset(
                'assets/images/$imageName',
              ),
            ),
            SizedBox(width: 30.w),
            CustomText(
              text: text,
              textStyle: thirdTextStyle().copyWith(fontWeight: FontWeight.bold),
            ),
            // SizedBox(width: 10.w),
          ],
        ),
      ),
    );
  }
}
