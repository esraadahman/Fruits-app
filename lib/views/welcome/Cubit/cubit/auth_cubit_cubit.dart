import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app/data/repositories/AuthRepo.dart';
import 'package:meta/meta.dart';

part 'auth_cubit_state.dart';

class AuthCubitCubit extends Cubit<AuthCubitState> {
  AuthCubitCubit() : super(AuthCubitInitial());

  signInWithGoogle(BuildContext context) async {
    emit(GoogleSignInLoading());
    try {
      await Authrepo.signInWithGoogle(context);
      emit(GoogleSignInSuccess());
    } catch (e) {
      emit(GoogleSignInFailure(e.toString()));
    }
  }
}
