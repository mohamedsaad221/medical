import 'dart:async';
import 'dart:io';
import 'dart:ui';
import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical/data/local_data.dart';
import 'package:medical/model/user_model.dart';
import 'package:medical/modules/doctors_screen/doctors_screen.dart';
import 'package:medical/modules/home/home_screen.dart';
import 'package:medical/shared/helper/constance.dart';
import 'package:medical/shared/helper/enum.dart';
import 'package:medical/shared/network/local/shared_pref.dart';
import 'package:medical/shared/widgets/components.dart';
import 'package:meta/meta.dart';


part 'control_state.dart';

class ControlCubit extends Cubit<ControlState> {
  ControlCubit() : super(ControlInitial());

  static ControlCubit get(context) => BlocProvider.of(context);

  Locale? localeApp = Locale(lang ?? 'en');

  void changeLocaleApp(String languageCode) async {
    if (localeApp!.countryCode != languageCode) {
      lang = languageCode;
      localeApp = Locale(languageCode);
      await CacheHelper.saveData(key: 'lang', value: languageCode);
      emit(ChangeLanguageState());
    }
  }

  void clearLocale() {
    localeApp = null;
    emit(ClearLanguageState());
  }

  final Connectivity _connectivity = Connectivity();

  bool _isOnline = true;

  bool get isOnline => _isOnline;

  Future<void> startMonitoring() async {
    await initConnectivity();
    _connectivity.onConnectivityChanged.listen(
      (ConnectivityResult result) async {
        if (result == ConnectivityResult.none) {
          _isOnline = false;
          emit(ControlConnectionFailed());
        } else {
          await _updateConnectionStatus().then(
            (bool isConnected) {
              _isOnline = isConnected;
              emit(ControlConnectionSuccess());
            },
          );
        }
      },
    );
  }

  Future<void> initConnectivity() async {
    try {
      var status = await _connectivity.checkConnectivity();

      if (status == ConnectivityResult.none) {
        _isOnline = false;
        emit(ControlConnectionFailed());
      } else {
        _isOnline = true;
        emit(ControlConnectionSuccess());
      }
    } on PlatformException catch (e) {
      debugPrint("PlatformException: " + e.toString());
    }
  }

  Future<bool> _updateConnectionStatus() async {
    bool isConnected = false;
    try {
      final List<InternetAddress> result =
          await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        isConnected = true;
      }
    } on SocketException catch (_) {
      isConnected = false;
      //return false;
    }
    return isConnected;
  }

  bool isPassword = true;
  IconData suffix = Icons.visibility_off_rounded;

  void changePasswordVisibility() {
    isPassword = !isPassword;

    suffix =
        isPassword ? Icons.visibility_off_rounded : Icons.visibility_outlined;

    emit(LoginPasswordVisibility());
  }

  final db = LocalDB.instance;

  Future<void> loginUser({
    required LocalUserModel userModel,
    required BuildContext context,
  }) async {
    emit(LoginLoadingState());
    await db
        .saveUserData(
      localUserModel: userModel,
    )
        .then((value) {
      emit(LoginSuccessState());
      navigateAndFinish(context,
          userModel.gender == Gender.user.toString() ? const HomeScreen() : const DoctorsScreen());
    }).catchError((error) {
      debugPrint('error: ${error.toString()}');
      emit(LoginErrorState());
    });
  }
}
