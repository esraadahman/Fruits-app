import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/Core/commonImports/commonImports.dart';

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
              appBar: AppBar(
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
                              fontSize:
                                  deviceInfo.orientation == Orientation.portrait
                                      ? width * 0.11
                                      : width * 0.06,
                              color: AppColors.title_text,
                            ),
                            size.height(height * 0.01),
                            TitleText(
                              text: "Login to Wikala",
                              fontSize:
                                  deviceInfo.orientation == Orientation.portrait
                                      ? width * 0.07
                                      : width * 0.03,
                              color: Colors.black,
                            ),
                            size.height(height * 0.04),
                            Phonewidget(
                              labelText_top: "Phone Number",
                              orientation: deviceInfo.orientation,
                              width: width,
                              onChanged: (value) {
                                cubit.phone_login = value;
                                print('User entered: ${cubit.phone_login}');
                              },
                            ),
                            Customtextfiled(
                              hintText: "Password",
                              labelText: "Password",
                              orientation: deviceInfo.orientation,
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
                                    fontSize: deviceInfo.orientation ==
                                            Orientation.portrait
                                        ? width * 0.04
                                        : width * 0.025,
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
                              orientation: deviceInfo.orientation,
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
                                width: deviceInfo.orientation ==
                                        Orientation.portrait
                                    ? width
                                    : width * 0.5,
                                text: "Don't have account ? ",
                                buttonText: "sign Up"),
                            size.height(height * .02)
                          ]),
                        )));
              })));
        },
      ),
    );
  }
}
