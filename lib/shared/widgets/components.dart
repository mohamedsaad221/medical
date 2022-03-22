import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:medical/modules/login_view/login_screen.dart';
import 'package:medical/shared/network/local/shared_pref.dart';
import 'package:medical/shared/styles/app_colors.dart';
import 'package:medical/shared/styles/font_styles.dart';


import 'custom_button.dart';

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
      (route) => false,
    );

void showToast({
  required String text,
  required ShowToastColor stateColor,
}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      backgroundColor: chooseToastColor(stateColor),
      textColor: Colors.white,
      fontSize: 16.0,
    );

enum ShowToastColor { SUCCESS, ERROR, WARING }

Color chooseToastColor(ShowToastColor state) {
  Color color;

  switch (state) {
    case ShowToastColor.SUCCESS:
      color = Colors.green;
      break;
    case ShowToastColor.ERROR:
      color = Colors.red;
      break;
    case ShowToastColor.WARING:
      color = Colors.amberAccent;
      break;
  }
  return color;
}

void signOut(BuildContext context) {
  CacheHelper.removeData(key: 'uId').then((value) {
    // FirebaseAuth.instance.currentUser!.delete().then((value) {
    // FirebaseAuth.instance.signOut();
    // });

    navigateAndFinish(context, LoginScreen());
  });
}

void showAppFilter({
  required BuildContext context,
  required Widget filterItem,
  required Function() onSearch,
  required Function() onDelete,
}) =>
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      )),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('تصفية حسب'),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10)),
              child: filterItem,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                CustomButton(
                  onPressed: onDelete,
                  text: 'مسح الكل',
                  width: 75,
                  height: 35,
                  color: AppColors.errorColor,
                ),
                const Spacer(),
                CustomButton(
                  onPressed: onSearch,
                  text: 'بحث',
                  width: 75,
                  height: 35,
                ),
              ],
            ),
          ],
        ),
      ),
    );

void showOrderConfirmationDialog(BuildContext context) => showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'تأكيد أمر الشراء',
                style: thirdTextStyle().copyWith(fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 66.h),
              CheckboxListTile(
                value: false,
                checkColor: Colors.white,
                activeColor: AppColors.successColor,
                contentPadding: EdgeInsets.zero,
                onChanged: (value) {},
                title: Text(
                  'هل لديك توصيل خاص ؟',
                  style:
                      thirdTextStyle().copyWith(color: AppColors.primaryColor),
                ),
              ),
              SizedBox(height: 50.h),
              CustomButton(
                onPressed: () {
                  // navigateTo(context, const CheckoutScreen());
                },
                text: 'إرسال أمر الشراء',
                radius: 10,
              ),
              SizedBox(height: 20.h),
              CustomButton(
                onPressed: () {
                  // navigateTo(context, const ShippingOffersScreen());
                },
                text: 'إرسال طلب عرض سعر لشركة نقل',
                color: AppColors.thirdColor,
                radius: 10,
              ),
            ],
          ),
        ),
      ),
    );

// Future<AwesomeDialog> showCustomDialog({
//   required BuildContext context,
//   required DialogType dialogType,
//   required AnimType animType,
//   required String title,
//   required String description,
// }) async {
//   return AwesomeDialog(
//     context: context,
//     headerAnimationLoop: false,
//     dialogType: dialogType,
//     animType: animType,
//     title: title,
//     desc: description,
//     autoHide: Duration(seconds: 4),
//   )..show();
//
//   // AwesomeDialog(
//   //   context: context,
//   //   dialogType: dialogType,
//   //   animType: animType,
//   //   title: title,
//   //   desc: description,
//   //   autoHide: autoHide? Duration(seconds: 4) : null,
//   //   btnCancelOnPress: (){
//   //     Navigator.pop(context);
//   //   },
//   //   btnOkOnPress: (){},
//   // )..show();
//
// // AwesomeDialog(
// //     context: context,
// //     animType: AnimType.LEFTSLIDE,
// //     headerAnimationLoop: false,
// //     dialogType: DialogType.SUCCES,
// //     showCloseIcon: true,
// //     title: 'Succes',
// //     desc:
// //     'Dialog description here..................................................',
// //     btnOkOnPress: () {
// //       debugPrint('OnClcik');
// //     },
// //     btnOkIcon: Icons.check_circle,
// //     onDissmissCallback: (type) {
// //       debugPrint('Dialog Dissmiss from callback $type');
// //     })
// //   ..show();
//
// //  AwesomeDialog(
// //   context: context,
// //   animType: AnimType.SCALE,
// //   dialogType: dialogType,
// //   // body: Center(
// //   //   child: Text(
// //   //     message,
// //   //     style: TextStyle(fontStyle: FontStyle.italic),
// //   //   ),
// //   // ),
// //   title: 'This is Ignored',
// //   desc: 'This is also Ignored',
// //   // autoHide: Duration(microseconds: 6000),
// //   // btnOkOnPress: () {},
// //
// // )..show();
// }
