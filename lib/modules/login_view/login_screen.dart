import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical/modules/controlView/cubit/control_cubit.dart';
import 'package:medical/modules/home/home_screen.dart';
import 'package:medical/modules/signup_view/signup_screen.dart';
import 'package:medical/shared/helper/constance.dart';
import 'package:medical/shared/widgets/components.dart';
import 'package:medical/shared/widgets/custom_button.dart';
import 'package:medical/shared/widgets/custom_text.dart';
import 'package:medical/shared/widgets/custom_text_form_field.dart';



class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ControlCubit, ControlState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
                children: [
              Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 200,
                  height: 200,
                ),
              ),
              Padding(
                  padding:
                      const EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomText(
                          text: 'Welcome,',
                        ),
                        GestureDetector(
                          onTap: () {
                            // navigate to register screen
                            navigateTo(context,  SignUpScreen());
                          },
                          child: const CustomText(
                            text: 'Sign Up',
                            textStyle:
                                TextStyle(fontSize: 18, color: Color.fromRGBO(80, 203, 244, 1.0)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    CustomTextFormField(
                      controller: emailController,
                      type: TextInputType.emailAddress,
                      validate: (value) {
                        if (value.isEmpty) {
                          return 'email must not be empty';
                        }
                        return null;
                      },
                      hint: 'name@example.com',
                      text: 'Email',
                    ),
                    const SizedBox(height: 40.0),
                    CustomTextFormField(
                      controller: passwordController,
                      type: TextInputType.visiblePassword,
                      validate: (value) {
                        if (value.isEmpty) {
                          return 'password must not be empty';
                        }
                        return null;
                      },
                      hint: '********',
                      text: 'Password',
                      isPassword: ControlCubit.get(context).isPassword,
                      suffixIcon: ControlCubit.get(context).suffix,
                      suffixPressed: () => ControlCubit.get(context)
                          .changePasswordVisibility(),
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      text: 'SIGN IN',
                      onPressed: () {
                        navigateTo(context, const HomeScreen());
                      },
                      color: primaryColor,
                    )
                  ],
                    ),
                  ))
            ]),
          ),
        );
      },
    );
  }
}
