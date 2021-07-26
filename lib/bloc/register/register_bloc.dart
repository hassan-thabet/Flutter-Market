

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_store/api/authentication.dart';
import 'package:flutter_store/bloc/register/register_states.dart';

class RegisterBloc extends Cubit<RegisterStates> {
  RegisterBloc() : super(RegisterInitialState());


  static RegisterBloc get(context) => BlocProvider.of(context);
  Authentication authentication = Authentication();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool visibility = false;


  void visibilityOnTap() async
  {
    visibility = !visibility;
    emit((RegisterVisibilityState()));
  }
  void onRegisterPressed() async
  {
    if (firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty &&
        emailController.text
            .trim()
            .isNotEmpty &&
        passwordController.text.isNotEmpty) {
      authentication
          .register(firstNameController.text, lastNameController.text,
          emailController.text, passwordController.text)
          .whenComplete(() =>
      {
        if (authentication.status != 201)
          {
            emit((RegisterErrorState())),
          }
        else
          {
            emit((RegisterSuccessState())),
          }
      });
    } else {
      emit((RegisterEmptyState()));
    }
  }

}