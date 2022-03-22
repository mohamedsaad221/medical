import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical/shared/helper/constance.dart';
import 'package:overlay_support/overlay_support.dart';
import 'data/local_data.dart';
import 'l10n/l10n.dart';
import 'layouts/home_layout/cubit/home_cubit.dart';
import 'modules/controlView/cubit/control_cubit.dart';
import 'modules/login_view/login_screen.dart';
import 'shared/my_bloc_observer.dart';
import 'shared/network/local/shared_pref.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );

  await CacheHelper.init();

  await LocalDB.instance.database;


  BlocOverrides.runZoned(
        () {
      runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) => ScreenUtilInit(
        designSize: orientation == Orientation.portrait
            ? const Size(375, 812)
            : const Size(812, 375),
        builder: () => OverlaySupport.global(
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (BuildContext context) => ControlCubit()..startMonitoring(),
              ),
              BlocProvider(
                create: (BuildContext context) => HomeCubit(),
              ),
            ],
            child: BlocBuilder<ControlCubit, ControlState>(
              builder: (context, state) {
                return MaterialApp(

                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                    primaryColor: primaryColor,
                    scaffoldBackgroundColor: Colors.white,
                    appBarTheme: AppBarTheme(
                      color: primaryColor
                    )
                  ),
                  supportedLocales: L10n.all,
                  locale: lang != null
                      ? Locale(lang!)
                      : ControlCubit.get(context).localeApp,
                  home:  LoginScreen(),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
