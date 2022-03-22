import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical/shared/styles/app_colors.dart';
import 'package:medical/shared/styles/font_styles.dart';

class NavigationDrawerWidget extends StatelessWidget {
  const NavigationDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const name = 'علي أحمد';
    const email = '@aliahmed';
    const rate = '4.5';
    const urlImage =
        'https://image.freepik.com/free-photo/medium-shot-happy-man-smiling_23-2148221808.jpg';

    return Drawer(
      child: Material(
        child: ListView(
          children: <Widget>[
            buildDrawerHeader(
              urlImage: urlImage,
              name: name,
              email: email,
              rate: rate,
              onClicked: () {

                //TODO navigate to  user profile

                // navigateTo(context, const VendorSettingsScreen()),

              }
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  buildMenuItem(
                    text: 'الرئيسية',
                    icon: Icons.home_outlined,
                    onClicked: () => selectedItem(context, 0),
                  ),
                  buildMenuItem(
                    text: 'إنشاء جديد',
                    icon: Icons.create_new_folder_outlined,
                    onClicked: () => selectedItem(context, 1),
                  ),
                  buildMenuItem(
                    text: 'منتجاتي',
                    icon: Icons.now_widgets_outlined,
                    onClicked: () => selectedItem(context, 2),
                  ),
                  buildMenuItem(
                    text: 'الاشعارات',
                    icon: Icons.notifications_outlined,
                    onClicked: () => selectedItem(context, 3),
                  ),
                  buildMenuItem(
                    text: 'طلب مساعدة',
                    icon: Icons.help_outline,
                    onClicked: () => selectedItem(context, 4),
                  ),
                  buildMenuItem(
                    text: 'الدعم والخصوصية',
                    icon: Icons.privacy_tip_outlined,
                    onClicked: () => selectedItem(context, 5),
                  ),
                  buildMenuItem(
                    text: 'عنا',
                    icon: Icons.report_gmailerrorred_outlined,
                    onClicked: () => selectedItem(context, 6),
                  ),
                  buildMenuItem(
                    text: 'الضبط',
                    icon: Icons.settings_outlined,
                    onClicked: () => selectedItem(context, 7),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDrawerHeader({
    required String urlImage,
    required String name,
    required String email,
    required String rate,
    required Function()? onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          height: 195.h,
          width: 294.w,
          color: AppColors.primaryColor,
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 64.h,
                width: 64.h,
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      height: 64.h,
                      width: 64.w,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: Colors.grey.shade100,
                      ),
                      child: Image.network(
                        urlImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      height: 21.h,
                      width: 21.w,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(12.r)),
                        color: const Color(0xff3ACCE1),
                      ),
                      child: Center(
                        child: Text(
                          rate,
                          style: subTextStyle().copyWith(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                name,
                style: headersTextStyle()
                    .copyWith(color: Colors.white, fontSize: 24.sp),
              ),
              Text(
                email,
                style: thirdTextStyle().copyWith(
                    color: Colors.white, fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
      );

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(
        text,
        style: thirdTextStyle().copyWith(fontWeight: FontWeight.w500),
      ),
      hoverColor: Colors.white70,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        // navigateTo(context, const VendorLayout());
        break;
      case 1:
        // navigateTo(context, VendorAddNewProductScreen());
        break;
      case 2:
        // navigateTo(context, VendorProductsScreen());
        break;
      case 3:
        // navigateTo(context, const VendorOffersScreen());
        break;
      case 4:
        // navigateTo(context, const VendorOffersScreen());
        break;
      case 5:
        // navigateTo(context, const VendorOffersScreen());
        break;
      case 6:
        // navigateTo(context, const VendorSettingsScreen());
        break;
      case 7:
        // navigateTo(context, const VendorSettingsScreen());
        break;
    }
  }
}
