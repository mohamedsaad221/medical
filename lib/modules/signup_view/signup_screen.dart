import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical/model/user_model.dart';
import 'package:medical/modules/controlView/cubit/control_cubit.dart';
import 'package:medical/modules/login_view/login_screen.dart';
import 'package:medical/shared/helper/constance.dart';
import 'package:medical/shared/helper/enum.dart';
import 'package:medical/shared/widgets/components.dart';
import 'package:medical/shared/widgets/custom_button.dart';
import 'package:medical/shared/widgets/custom_text.dart';
import 'package:medical/shared/widgets/custom_text_form_field.dart';


class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();

  var emailController = TextEditingController();

  var phoneController = TextEditingController();

  var passwordController = TextEditingController();

  Gender selectedValue = Gender.user;

  void changeRadio(Gender gender) {
    setState(() {
      selectedValue = gender;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ControlCubit, ControlState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = ControlCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.white,
            toolbarHeight: 80.0,
            leading: GestureDetector(
              onTap: () {
                navigateAndFinish(context, LoginScreen());
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 50.0,
                right: 20.0,
                left: 20.0,
                bottom: 10.0,
              ),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CustomText(
                      text: 'Sign Up',
                      textStyle: TextStyle(fontSize: 30),
                    ),
                    const SizedBox(height: 30),
                    CustomTextFormField(
                      controller: nameController,
                      type: TextInputType.name,
                      validate: (value) {
                        if (value.isEmpty) {
                          return 'name must not be empty';
                        }
                      },
                      hint: 'username',
                      text: 'Name',
                    ),
                    const SizedBox(height: 40.0),
                    CustomTextFormField(
                      controller: emailController,
                      type: TextInputType.emailAddress,
                      validate: (value) {
                        if (value.isEmpty) {
                          return 'email must not be empty';
                        }
                      },
                      hint: 'name@example.com',
                      text: 'Email',
                    ),
                    const SizedBox(height: 40.0),
                    CustomTextFormField(
                      controller: phoneController,
                      type: TextInputType.phone,
                      validate: (value) {
                        if (value.isEmpty) {
                          return 'phone must not be empty';
                        }
                      },
                      hint: '01xxxxxxxxx',
                      text: 'Phone',
                    ),
                    const SizedBox(height: 40.0),
                    CustomTextFormField(
                      controller: passwordController,
                      type: TextInputType.visiblePassword,
                      validate: (value) {
                        if (value.isEmpty) {
                          return 'password must not be empty';
                        }
                      },
                      hint: '********',
                      text: 'Password',
                      isPassword: ControlCubit.get(context).isPassword,
                      suffixIcon: ControlCubit.get(context).suffix,
                      suffixPressed: () =>
                          ControlCubit.get(context).changePasswordVisibility(),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Expanded(
                          flex: 4,
                          child: CustomText(
                            text: 'User',
                            textStyle: TextStyle(fontSize: 18),
                          ),
                        ),
                        Expanded(
                          child: Radio(
                            value: Gender.user,
                            groupValue: selectedValue,
                            onChanged: (Gender? value) {
                              changeRadio(value!);
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Expanded(
                          flex: 4,
                          child: CustomText(
                            text: 'Doctor',
                            textStyle: TextStyle(fontSize: 18),
                          ),
                        ),
                        Expanded(
                          child: Radio(
                            value: Gender.doctor,
                            groupValue: selectedValue,
                            onChanged: (Gender? value) {
                              changeRadio(value!);
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      text: 'SIGN Up',
                      color: primaryColor,
                      onPressed: () async{

                        print('ss: $selectedValue');
                        LocalUserModel userModel = LocalUserModel(
                          userName: nameController.text.trim().toString(),
                          email: emailController.text.trim().toString(),
                          phone: phoneController.text.trim().toString(),
                          password: passwordController.text.trim().toString(),
                          gender: selectedValue.toString(),
                        );
                        formKey.currentState!.save();
                        if (formKey.currentState!.validate()) {
                          await cubit.loginUser(
                            userModel: userModel,
                            context: context,
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
