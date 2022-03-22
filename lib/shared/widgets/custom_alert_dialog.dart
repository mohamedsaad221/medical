import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical/shared/styles/font_styles.dart';

import 'custom_button.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title, description, imageUrl;
  final  Function() okOnPressed;

  const CustomAlertDialog({
    Key? key,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.okOnPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 350.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 300.h,
            padding: EdgeInsets.only(
                top: 100.h, bottom: 16.h, left: 16.w, right: 16.w),
            margin: EdgeInsets.only(top: 16.h),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(17.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.r,
                  offset: const Offset(0.0, 10.0),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: headersTextStyle()
                        .copyWith(fontSize: 24.sp, fontWeight: FontWeight.w700),
                  ),
                ),
                Expanded(
                  child: Text(
                    description,
                    style: secondaryTextStyle().copyWith(height: 1.2),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20.h),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: CustomButton(
                            height: 40.h,
                            onPressed: (){
                              Navigator.pop(context);
                            },
                            text: 'cancel',
                          ),
                        ),
                        SizedBox(width: 20.w),
                        Expanded(
                          child: CustomButton(
                            height: 40.h,
                            onPressed: okOnPressed,
                            text: 'ok',
                            color: Colors.red,
                            borderColor: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0.h,
            left: 16.w,
            right: 16.w,
            child: CircleAvatar(
              radius: 60.r,
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage(imageUrl),
            ),
          ),
        ],
      ),
    );
  }
}
