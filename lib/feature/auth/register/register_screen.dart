import 'package:ecommercee/core/resources/assets_managet.dart';
import 'package:ecommercee/core/resources/color_manager.dart';
import 'package:ecommercee/core/widget/custom_elevated_button.dart';
import 'package:ecommercee/core/widget/dialog_utils.dart';
import 'package:ecommercee/core/widget/validators.dart';
import 'package:ecommercee/feature/auth/register/cubit/register_states.dart';
import 'package:ecommercee/feature/auth/register/cubit/register_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import '../../../core/widget/custom_text_form_field.dart';
import '../../../domain/di/di.dart';

class Register_screen extends StatelessWidget {
  RegisterViewModel registerViewModel = getIt<RegisterViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterViewModel, RegisterStates>(
      bloc: registerViewModel,
      listener: (context, state) {
        if (state is RegisterLoadingState) {
          DialogUtils.showLoading(context: context, message: 'loading');
          // SnackBar(content: Text('Loading'));
        } else if (state is RegisterErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context: context, message: state.failures.errorMessage);
          // SnackBar(content: Text(state.failures.errorMessage));
        } else if (state is RegisterSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context: context, message: 'Register Successfully');
          // SnackBar(content: Text('Register Successfully'));
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
                  label: 'enter your full name',
                  color: ColorManager.white,
                  controller: registerViewModel.nameController,
                  keyboard: TextInputType.number,
                  validator: AppValidators.validateUsername,
                ),
                CustomTextFormField(
                  text: 'Phone number',
                  label: 'enter your phone number',
                  color: ColorManager.white,
                  controller: registerViewModel.phoneNumberController,
                  keyboard: TextInputType.number,
                  validator: AppValidators.validatePhoneNumber,
                ),
                CustomTextFormField(
                  text: 'E-mail Address',
                  label: 'enter your emil address',
                  color: ColorManager.white,
                  controller: registerViewModel.emilController,
                  keyboard: TextInputType.number,
                  validator: AppValidators.validateEmail,
                ),
                CustomTextFormField(
                  text: 'password',
                  label: 'enter your password',
                  color: ColorManager.white,
                  controller: registerViewModel.passwordController,
                  keyboard: TextInputType.number,
                  validator: AppValidators.validatePassword,
                  obscure: true,
                ),
                CustomTextFormField(
                  text: 'rePassword',
                  label: 'enter your rePassword',
                  color: ColorManager.white,
                  controller: registerViewModel.rePasswordController,
                  keyboard: TextInputType.number,
                  validator: AppValidators.validatePassword,
                  obscure: true,
                ),
                SizedBox(
                  height: 25.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomElevatedButton(
                      label: 'Sign up',
                      onTap: () {
                        registerViewModel.register();
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
