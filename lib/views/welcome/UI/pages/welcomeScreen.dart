import 'package:flutter/cupertino.dart';
import 'package:fruits_app/Core/commonImports/commonImports.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/views/welcome/Cubit/cubit/auth_cubit_cubit.dart';
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
                forceMaterialTransparency: true,
                elevation: 0,
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
                          fontSize:
                              deviceInfo.orientation == Orientation.portrait
                                  ? width * 0.11
                                  : width * 0.06,
                          color: AppColors.title_text,
                        ),
                        size.height(height * 0.01),
                        TitleText(
                          text: "Welcome to Our app",
                          fontSize:
                              deviceInfo.orientation == Orientation.portrait
                                  ? width * 0.07
                                  : width * 0.03,
                          color: AppColors.blackColor,
                        ),
                        size.height(height * 0.1),
                        ButtonStyleWidget(
                          height: height,
                          width: width,
                          borderColor: AppColors.grayColor.withOpacity(0.4),
                          textColor: AppColors.blackColor,
                          buttonText: 'Sign in with Phone Number',
                          IconPath: "assets/images/call.png",
                        ),
                        size.height(height * 0.03),
                        ButtonStyleWidget(
                          height: height,
                          width: width,
                          borderColor: AppColors.grayColor.withOpacity(0.4),
                          textColor: AppColors.blackColor,
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
                            width:
                                deviceInfo.orientation == Orientation.portrait
                                    ? width
                                    : width * 0.5,
                            text: "Already member ? ",
                            buttonText: "Sign In"),
                        size.height(height * 0.02),
                        CopyRight(
                          width: deviceInfo.orientation == Orientation.portrait
                              ? width
                              : width * 0.5,
                        ),
                        size.height(height * 0.02),
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
