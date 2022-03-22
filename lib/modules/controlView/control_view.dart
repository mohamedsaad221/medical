import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical/layouts/home_layout/home_layout_screen.dart';
import 'package:medical/modules/login_view/login_screen.dart';
import 'package:medical/shared/helper/constance.dart';



import 'cubit/control_cubit.dart';
import 'no_internet_view.dart';

class ControlView extends StatelessWidget {
  const ControlView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ControlCubit, ControlState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var controlCubit = ControlCubit.get(context);
        return uId == null
            ?  LoginScreen()
            : controlCubit.isOnline
                ? const HomeLayoutScreen()
                : const NoInternet();
      },
    );
  }
}
