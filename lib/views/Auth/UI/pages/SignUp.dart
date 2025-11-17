import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/Core/commonImports/commonImports.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

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
              appBar: AppBar(
                forceMaterialTransparency: true,
                elevation: 0,
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
                          key: cubit.formKey_signUp,
                          child: Column(children: [
                            size.height(height * 0.05),
                            TitleText(
                              text: "Fruit Market",
                              fontSize:
                                  deviceInfo.orientation == Orientation.portrait
                                      ? width * 0.11
                                      : width * 0.06,
                              color: AppColors.title_text,
                            ),
                            size.height(height * 0.01),
                            TitleText(
                              text: "Sign Up to Wikala",
                              fontSize:
                                  deviceInfo.orientation == Orientation.portrait
                                      ? width * 0.07
                                      : width * 0.03,
                              color: Colors.black,
                            ),
                            size.height(height * 0.04),
                            Customtextfiled(
                              hintText: "FullName",
                              labelText: "First and Last Name",
                              prefixIcon: null,
                              keyboardType: TextInputType.name,
                              labelText_top: "Full Name",
                              width: width,
                              orientation: deviceInfo.orientation,
                              onChanged: (value) {
                                cubit.fullname = value;
                                print(cubit.fullname);
                              },
                              validator: (value) {
                                return value!.isEmpty
                                    ? "Please enter your name"
                                    : value.trim().length < 5
                                        ? "Name must be at least 5 characters"
                                        : !RegExp(r"^[a-zA-Z\s]+$")
                                                .hasMatch(value.trim())
                                            ? "Name can only contain letters and spaces"
                                            : null;
                              },
                            ),
                            size.height(height * 0.02),
                            Phonewidget(
                              labelText_top: "Phone Number",
                              orientation: deviceInfo.orientation,
                              width: width,
                              onChanged: (value) {
                                cubit.phone_signup = value;
                                print('User entered: ${cubit.phone_signup}');
                              },
                            ),
                            Customtextfiled(
                              hintText: "Password",
                              labelText: "Password",
                              prefixIcon: null,
                              obscureText: true,
                              labelText_top: "Password",
                              orientation: deviceInfo.orientation,
                              width: width,
                              onChanged: (value) {
                                cubit.password_signup = value;
                                print(cubit.password_signup);
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
                            size.height(height * 0.03),
                            Customauthbutton(
                              textColor: AppColors.whiteColor,
                              buttonText: "Sign Up",
                              buttonColor: AppColors.button_Color,
                              height: height,
                              orientation: deviceInfo.orientation,
                              width: width,
                              onTap: () {
                                cubit.signup();
                                context
                                    .navigateToAndClearStack(NavBarSection());
                              },
                            ),
                            size.height(height * 0.04),
                            TextUnder(
                                onTap: () {
                                  context.navigateToEasy(Login());
                                },
                                width: deviceInfo.orientation ==
                                        Orientation.portrait
                                    ? width
                                    : width * 0.5,
                                text: "Already have an Account ? ",
                                buttonText: "Login"),
                            size.height(height * 0.02),
                          ]),
                        )));
              })));
        },
      ),
    );
  }
}
