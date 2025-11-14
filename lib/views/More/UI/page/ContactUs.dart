import 'package:fruits_app/Core/commonImports/commonImports.dart';
import 'package:fruits_app/Core/constants/Lists.dart';
import 'package:fruits_app/views/Auth/UI/widgets/CustomAuthButton.dart';
import 'package:fruits_app/views/Auth/UI/widgets/PhoneWidget.dart';
import 'package:fruits_app/views/Home/UI/widgets/AppBarWidget.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Infowidget(builder: (context, deviceInfo) {
      double width = deviceInfo.localWidth;
      double height = deviceInfo.localHeight;
      return Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBarWidget(
          width: width,
          centerTitle: true,
          title: "Contact Us",
          leading: IconButton(
              onPressed: () {
                context.goBack();
              },
              icon: const Icon(Icons.arrow_back_ios_new)),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.045),
          child: Column(
            children: [
              size.height(height * 0.02),
              Customtextfiled(
                hintText: "Name",
                labelText: "",
                prefixIcon: null,
                keyboardType: TextInputType.name,
                labelText_top: "Full Name",
                width: width,
                onChanged: (value) {},
                validator: (value) {
                  return value!.isEmpty
                      ? "Please enter your name"
                      : value.trim().length < 5
                          ? "Name must be at least 5 characters"
                          : !RegExp(r"^[a-zA-Z\s]+$").hasMatch(value.trim())
                              ? "Name can only contain letters and spaces"
                              : null;
                },
              ),
              size.height(height * 0.02),
              Phonewidget(
                labelText_top: "Mobile Number",
                width: width,
                onChanged: (value) {},
              ),
              Customtextfiled(
                hintText: "Write your message...",
                labelText: "Message",
                labelText_top: "Message",
                width: width,
                maxLength: 120,
                maxLines: 4,
              ),
              size.height(height * 0.07),
              Customauthbutton(
                textColor: AppColors.whiteColor,
                buttonText: "Submit",
                buttonColor: AppColors.button_Color,
                height: height,
                width: width,
                onTap: () {},
              ),
              size.height(height * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: socialImages
                    .map((image) => Padding(
                          padding: EdgeInsets.only(right: width * 0.04),
                          child: socialWidget(
                            width: width,
                            image: image,
                          ),
                        ))
                    .toList(),
              )
            ],
          ),
        ),
      );
    });
  }
}

class socialWidget extends StatelessWidget {
  const socialWidget({
    super.key,
    required this.width,
    required this.image,
  });

  final double width;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.15,
      height: width * 0.15,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.grayColor,
        ),
      ),
      child: Image(
        width: width * 0.15,
        height: width * 0.15,
        image: AssetImage(
          image,
        ),
        //   fit: BoxFit.scaleDown,
      ),
    );
  }
}
