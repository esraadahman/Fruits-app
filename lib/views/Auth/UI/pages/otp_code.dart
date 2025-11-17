import 'package:fruits_app/Core/commonImports/commonImports.dart';

class OtpCode extends StatefulWidget {
  const OtpCode({super.key});

  @override
  State<OtpCode> createState() => _OtpCodeState();
}

class _OtpCodeState extends State<OtpCode> {
  @override
  Widget build(BuildContext context) {
    TextEditingController otpController = TextEditingController();
    String currentText = "";
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
                  child: Column(children: [
                    size.height(height * 0.05),
                    TitleText(
                      text: "Fruit Market",
                      fontSize: deviceInfo.orientation == Orientation.portrait
                          ? width * 0.11
                          : width * 0.06,
                      color: AppColors.title_text,
                    ),
                    size.height(height * 0.01),
                    TitleText(
                      text: "Enter Received OTP",
                      fontSize: deviceInfo.orientation == Orientation.portrait
                          ? width * 0.07
                          : width * 0.03,
                      color: Colors.black,
                    ),
                    size.height(height * 0.04),
                    // otp fields

                    PinCodeTextField(
                      appContext: context,
                      length: 4,
                      controller: otpController,
                      autoFocus: true,
                      keyboardType: TextInputType.number,
                      animationType: AnimationType.fade,
                      cursorColor: Colors.blue,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.circle,
                        borderRadius: BorderRadius.circular(8),
                        fieldHeight:
                            deviceInfo.orientation == Orientation.portrait
                                ? width * 0.15
                                : width * 0.08,
                        fieldWidth: width * 0.13,
                        activeFillColor: Colors.white,
                        selectedFillColor: Colors.white,
                        inactiveFillColor: Colors.white,
                        activeColor: Colors.blue,
                        selectedColor: Colors.blueAccent,
                        inactiveColor: Colors.grey,
                      ),
                      enableActiveFill: true,
                      animationDuration: const Duration(milliseconds: 300),
                      onChanged: (value) {
                        setState(() => currentText = value);
                      },
                      onCompleted: (value) {
                        debugPrint("OTP Entered: $value");
                      },
                    ),
                    size.height(height * 0.04),
                    Customauthbutton(
                      textColor: AppColors.whiteColor,
                      buttonText: "Confirm",
                      orientation: deviceInfo.orientation,
                      buttonColor: AppColors.button_Color,
                      height: height,
                      width: width,
                      onTap: () {
                        //cubit.login();
                        // context.navigateTo(OtpCode());
                      },
                    ),
                    size.height(height * 0.04),
                    TextUnder(
                        onTap: () {},
                        width: deviceInfo.orientation == Orientation.portrait
                            ? width
                            : width * 0.5,
                        text: "Not received OTP?   ",
                        buttonText: "Send again"),
                  ])));
        })));
  }
}
