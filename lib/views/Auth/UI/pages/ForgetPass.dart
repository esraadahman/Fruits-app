import 'package:fruits_app/Core/commonImports/commonImports.dart';
import 'package:fruits_app/views/Auth/UI/pages/otp_code.dart';
import 'package:fruits_app/views/Auth/UI/widgets/CustomAuthButton.dart';
import 'package:fruits_app/views/Auth/UI/widgets/PhoneWidget.dart';

class Forgetpass extends StatelessWidget {
  const Forgetpass({super.key});

  @override
  Widget build(BuildContext context) {
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
                      //  key: cubit.formKey_login,
                      child: Column(children: [
                    size.height(height * 0.05),
                    TitleText(
                      text: "Fruit Market",
                      fontSize: width * 0.11,
                      color: AppColors.title_text,
                    ),
                    size.height(height * 0.01),
                    TitleText(
                      text: "Enter your phone ",
                      fontSize: width * 0.07,
                      color: Colors.black,
                    ),
                    size.height(height * 0.04),
                    Phonewidget(
                      labelText_top: "Phone Number",
                      width: width,
                      onChanged: (value) {
                        // cubit.phone_login = value;
                        // print('User entered: ${cubit.phone_login}');
                      },
                    ),
                    size.height(height * 0.02),
                    Customauthbutton(
                      textColor: AppColors.whiteColor,
                      buttonText: "Submit",
                      buttonColor: AppColors.button_Color,
                      height: height,
                      width: width,
                      onTap: () {
                        //cubit.login();
                        context.navigateTo(OtpCode());
                      },
                    ),
                  ]))));
        })));
  }
}
