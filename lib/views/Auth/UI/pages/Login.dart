import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/Core/commonImports/commonImports.dart';
import 'package:fruits_app/views/Auth/UI/pages/ForgetPass.dart';
import 'package:fruits_app/views/Auth/UI/widgets/CustomAuthButton.dart';
import 'package:fruits_app/views/Auth/UI/widgets/PhoneWidget.dart';
import 'package:fruits_app/views/Auth/cubit/cubit/auth2_cubit.dart';
import 'package:fruits_app/views/navi/NavBar.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Auth2Cubit(),
      child: BlocConsumer<Auth2Cubit, Auth2State>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          final cubit = BlocProvider.of<Auth2Cubit>(context);
          return Scaffold(
              backgroundColor: AppColors.whiteColor,
              appBar: AppBar(
                backgroundColor: AppColors.whiteColor,
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                  ),
                  onPressed: () {
                    context.goBack();
                  },
                ),
              ),
              body: SafeArea(child: Infowidget(builder: (context, deviceInfo) {
                double width = deviceInfo.localWidth;
                double height = deviceInfo.localHeight;
                return SingleChildScrollView(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                        child: Form(
                          key: cubit.formKey_login,
                          child: Column(children: [
                            size.height(height * 0.05),
                            TitleText(
                              text: "Fruit Market",
                              fontSize: width * 0.11,
                              color: AppColors.title_text,
                            ),
                            size.height(height * 0.01),
                            TitleText(
                              text: "Login to Wikala",
                              fontSize: width * 0.07,
                              color: Colors.black,
                            ),
                            size.height(height * 0.04),
                            Phonewidget(
                              labelText_top: "Phone Number",
                              width: width,
                              onChanged: (value) {
                                cubit.phone_login = value;
                                print('User entered: ${cubit.phone_login}');
                              },
                            ),
                            Customtextfiled(
                              hintText: "Password",
                              labelText: "Password",
                              prefixIcon: null,
                              obscureText: true,
                              labelText_top: "Password",
                              width: width,
                              onChanged: (value) {
                                cubit.password_login = value;
                                print(cubit.password_login);
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter your password";
                                } else if (value.length < 6) {
                                  return "Password must be at least 6 characters";
                                } else {
                                  return null;
                                }
                              },
                            ),
                            size.height(height * 0.02),
                            Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                onTap: () {
                                  context.navigateTo(Forgetpass());
                                },
                                child: Text(
                                  "Forgot Password ?",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline,
                                    decorationColor: Colors.blue,
                                    fontSize: width * 0.04,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            size.height(height * 0.02),
                            Customauthbutton(
                              textColor: AppColors.whiteColor,
                              buttonText: "Login",
                              buttonColor: AppColors.button_Color,
                              height: height,
                              width: width,
                              onTap: () {
                                cubit.login();
                                context
                                    .navigateToAndClearStack(NavBarSection());
                              },
                            ),
                            size.height(height * 0.04),
                            TextUnder(
                                onTap: () {
                                  context.navigateToEasy(Signup());
                                },
                                width: width,
                                text: "Don't have account ? ",
                                buttonText: "sign Up"),
                          ]),
                        )));
              })));
        },
      ),
    );
  }
}
