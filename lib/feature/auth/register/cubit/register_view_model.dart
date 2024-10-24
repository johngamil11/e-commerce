import 'package:ecommercee/domain/use_cases/register_use_case.dart';
import 'package:ecommercee/feature/auth/register/cubit/register_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterViewModel extends Cubit<RegisterStates> {
  RegisterUseCase registerUseCase;

  RegisterViewModel({required this.registerUseCase})
      : super(RegisterInitialState());
  TextEditingController nameController = TextEditingController();
  TextEditingController emilController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();

  //todo : hold data - handle logic
  void register() async {
    emit(RegisterLoadingState());
    var either = await registerUseCase.invoke(
        nameController.text,
        emilController.text,
        passwordController.text,
        rePasswordController.text,
        phoneNumberController.text);
    either.fold((l) {
      emit(RegisterErrorState(failures: l));
    }, (response) {
      emit(RegisterSuccessState(registerResponseEntity: response));
    });
  }
}
