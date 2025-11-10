import 'package:flutter/cupertino.dart';
import 'package:fruits_app/Core/commonImports/commonImports.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/views/Auth/UI/pages/Login.dart';
import 'package:fruits_app/views/welcome/Cubit/cubit/auth_cubit_cubit.dart';
import 'package:fruits_app/views/welcome/UI/widgets/headTitle.dart';
import "package:fruits_app/views/welcome/Cubit/cubit/auth_cubit_cubit.dart"
    as googleSignUp;

class Welcomescreen extends StatelessWidget {
  const Welcomescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubitCubit(),
      child: BlocConsumer<AuthCubitCubit, AuthCubitState>(
        listener: (context, state) {
          handleCubitState(
            context: context,
            state: state,
            successType: googleSignUp.GoogleSignInSuccess,
            failureType: googleSignUp.GoogleSignInFailure,
            successMessage: "Account Created Successfully",
            failureMessage: state is googleSignUp.GoogleSignInFailure
                ? state.error.substring(10)
                : "Something went wrong",
            //   onSuccessNavigate: CustomNavBar(),
          );
        },
        builder: (context, state) {
          final cubit = BlocProvider.of<AuthCubitCubit>(context);
          return Scaffold(
              backgroundColor: AppColors.whiteColor,
              appBar: AppBar(
                backgroundColor: AppColors.whiteColor,
                leading: IconButton(
                  icon: const Icon(
                    CupertinoIcons.xmark,
                  ),
                  onPressed: () {
                    context.navigateTo(Signup());
                  },
                ),
              ),
              body: SafeArea(child: Infowidget(builder: (context, deviceInfo) {
                double width = deviceInfo.localWidth;
                double height = deviceInfo.localHeight;
                return SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                    child: Column(
                      children: [
                        size.height(height * 0.05),
                        TitleText(
                          text: "Fruit Market",
                          fontSize: width * 0.11,
                          color: AppColors.title_text,
                        ),
                        size.height(height * 0.01),
                        TitleText(
                          text: "Welcome to Our app",
                          fontSize: width * 0.07,
                          color: Colors.black,
                        ),
                        size.height(height * 0.2),
                        ButtonStyleWidget(
                          height: height,
                          width: width,
                          borderColor: Colors.grey.shade400,
                          textColor: Colors.black,
                          buttonText: 'Sign in with Phone Number',
                          IconPath: "assets/images/call.png",
                        ),
                        size.height(height * 0.03),
                        ButtonStyleWidget(
                          height: height,
                          width: width,
                          borderColor: Colors.grey.shade400,
                          textColor: Colors.black,
                          buttonText: state is GoogleSignInLoading
                              ? "Loading....."
                              : 'Sign in with Google',
                          IconPath: "assets/images/google.png",
                          onTap: () {
                            cubit.signInWithGoogle(context);
                          },
                        ),
                        size.height(height * 0.03),
                        ButtonStyleWidget(
                          height: height,
                          width: width,
                          buttonColor: AppColors.facebookBlue,
                          textColor: Colors.white,
                          buttonText: 'Sign in with Facebook',
                          IconPath: "assets/images/Group 2.png",
                        ),
                        size.height(height * 0.04),
                        TextUnder(
                            onTap: () {
                              context.navigateTo(Login());
                            },
                            width: width,
                            text: "Already member ? ",
                            buttonText: "Sign In"),
                        size.height(height * 0.02),
                        CopyRight(width: width)
                      ],
                    ),
                  ),
                );
              })));
        },
      ),
    );
  }
}
