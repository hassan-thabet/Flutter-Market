import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_store/api/authentication.dart';
import 'package:flutter/material.dart';
import 'login_states.dart';


class LoginBloc extends Cubit<LoginStates>
{
  LoginBloc() : super(LoginInitialState());
  static LoginBloc get(context) => BlocProvider.of(context);

  Authentication authentication = Authentication();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool visibility = true;


  void visibilityOnTap() async
  {
    visibility = !visibility;
    emit((LoginVisibilityState()));
  }

  void onLoginPressed() async
  {
    if (emailController.text.trim().toLowerCase().isNotEmpty &&
        passwordController.text.isNotEmpty) {
      await authentication
          .login(emailController.text, passwordController.text)
          .whenComplete(() => {
        if (authentication.status != 200)
          {
            emit((LoginErrorState())),
          }
        else
          {
            emit((LoginSuccessState())),
          }
      });
    } else {
      emit((LoginEmptyState()));
    }
  }

}
