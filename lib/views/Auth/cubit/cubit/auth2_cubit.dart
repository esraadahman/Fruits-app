import 'package:bloc/bloc.dart';
import 'package:fruits_app/Core/commonImports/commonImports.dart';
import 'package:meta/meta.dart';

part 'auth2_state.dart';

class Auth2Cubit extends Cubit<Auth2State> {
  Auth2Cubit() : super(Auth2Initial());

  GlobalKey<FormState> formKey_signUp = GlobalKey<FormState>();
  GlobalKey<FormState> formKey_login = GlobalKey<FormState>();
  String fullname = "";
  String phone_signup = "";

  String password_signup = "";
  String password_login = "";
  String phone_login = "";

  signup() async {
    if (formKey_signUp.currentState!.validate()) {
      print("Validated");
    }
  }

  login() async {
    if (formKey_login.currentState!.validate()) {
      print("Validated");
    }
  }
}
