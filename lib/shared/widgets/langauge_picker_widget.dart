import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical/l10n/l10n.dart';
import 'package:medical/modules/controlView/cubit/control_cubit.dart';

import 'custom_text.dart';

class LanguagePickerWidget extends StatelessWidget {

  const LanguagePickerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = ControlCubit.get(context);
    final locale = cubit.localeApp ?? const Locale('en');

    return DropdownButtonHideUnderline(
      child: DropdownButton(
        value: locale,
        icon: Container(width: 12),
        items: L10n.all.map(
              (locale) {
            final flag = L10n.getFlag(locale.languageCode);
            return DropdownMenuItem(
              child: Center(
                child: Row(
                  children: [
                    CustomText(text: locale.languageCode),
                    SizedBox(width: 10.w),
                    Text(
                      flag,
                      style: const TextStyle(fontSize: 32),
                    ),
                  ],
                ),
              ),
              value: locale,
              onTap: () {
                ControlCubit.get(context).changeLocaleApp(locale.languageCode);
              },
            );
          },
        ).toList(),
        onChanged: (_) {},
      ),
    );
  }
}