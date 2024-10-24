import 'package:ecommercee/domain/use_cases/login_use_case.dart';
import 'package:ecommercee/domain/use_cases/register_use_case.dart';
import 'package:ecommercee/feature/auth/login/cubit/login_states.dart';
import 'package:ecommercee/feature/auth/register/cubit/register_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginViewModel extends Cubit<LoginStates> {
  LoginUseCase loginUseCase;

  LoginViewModel({required this.loginUseCase}) : super(LoginInitialState());
  TextEditingController emilController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //todo : hold data - handle logic
  void login() async {
    emit(LoginLoadingState());
    var either =
        await loginUseCase.invoke(emilController.text, passwordController.text);
    either.fold((l) {
      emit(LoginErrorState(failures: l));
    }, (response) {
      emit(LoginSuccessState(loginResponseEntity: response));
    });
  }
}
