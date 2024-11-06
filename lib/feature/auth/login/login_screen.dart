import 'package:ecommercee/core/resources/assets_manager.dart';
import 'package:ecommercee/core/resources/color_manager.dart';
import 'package:ecommercee/core/routes_manager/routes.dart';
import 'package:ecommercee/core/widget/custom_elevated_button.dart';
import 'package:ecommercee/core/widget/dialog_utils.dart';
import 'package:ecommercee/core/widget/shared_preference_utils.dart';
import 'package:ecommercee/core/widget/validators.dart';
import 'package:ecommercee/feature/auth/login/cubit/login_view_model.dart';
import 'package:ecommercee/feature/auth/register/cubit/register_states.dart';
import 'package:ecommercee/feature/auth/register/cubit/register_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import '../../../core/widget/custom_text_form_field.dart';
import '../../../domain/di/di.dart';
import 'cubit/login_states.dart';

class LoginScreen extends StatelessWidget {
  LoginViewModel loginViewModel = getIt<LoginViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginViewModel, LoginStates>(
      bloc: loginViewModel,
      listener: (context, state) {
        if (state is LoginLoadingState) {
          DialogUtils.showLoading(context: context, message: 'loading');
          // SnackBar(content: Text('Loading'));
        } else if (state is LoginErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context: context, message: state.failures.errorMessage);
          // SnackBar(content: Text(state.failures.errorMessage));
        } else if (state is LoginSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
            context: context,
            message: 'Login Successfully',
            title: 'Success',
            posActionName: 'Ok',
          );
          //todo: save token
          SharedPreferenceUtils.saveData(
              'token', state.loginResponseEntity.token);
          //todo: navigate to home
          Navigator.of(context).pushNamed(Routes.mainRoute);
        }
      },
      child: Scaffold(
        backgroundColor: ColorManager.primary,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 71.7.h,
                ),
                Center(
                  child: Image.asset(ImageAssets.login),
                ),
                SizedBox(
                  height: 35.h,
                ),
                CustomTextFormField(
                  text: 'User Name',
                  label: 'enter your emil',
                  color: ColorManager.white,
                  controller: loginViewModel.emilController,
                  keyboard: TextInputType.number,
                  validator: AppValidators.validateUsername,
                ),
                CustomTextFormField(
                  text: 'password',
                  label: 'enter your password',
                  color: ColorManager.white,
                  controller: loginViewModel.passwordController,
                  keyboard: TextInputType.number,
                  validator: AppValidators.validatePassword,
                  obscure: true,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forget Password',
                          style: TextStyle(
                              color: ColorManager.white, fontSize: 18),
                        )),
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomElevatedButton(
                      label: 'Log In',
                      onTap: () {
                        loginViewModel.login();
                      }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.signUpRoute);
                        },
                        child: Text(
                          'Don’t have an account? Create Account',
                          style: TextStyle(
                              color: ColorManager.white, fontSize: 18),
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
