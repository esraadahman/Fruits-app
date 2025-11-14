import 'package:flutter/cupertino.dart';
import 'package:fruits_app/Core/commonImports/commonImports.dart';
import 'package:fruits_app/views/Auth/UI/widgets/CustomAuthButton.dart';
import 'package:fruits_app/views/Favorite/UI/page/Favorite.dart';
import 'package:fruits_app/views/Home/UI/widgets/AppBarWidget.dart';
import 'package:fruits_app/views/More/UI/page/ContactUs.dart';
import 'package:fruits_app/views/More/UI/page/ProfileScreen.dart';
import 'package:fruits_app/views/More/UI/page/Terms&Conditions.dart';
import 'package:fruits_app/views/More/UI/widgets/LanguageDialog.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key, this.onNavItemSelected});
  final Function(int)? onNavItemSelected;

  @override
  Widget build(BuildContext context) {
    final String image = "";
    return Infowidget(builder: (context, deviceInfo) {
      double width = deviceInfo.localWidth;
      double height = deviceInfo.localHeight;
      return Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBarWidget(
          width: width,
          title: "Fruit Market",
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                context.goBack();
              },
              icon: const Icon(Icons.arrow_back_ios_new)),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  size.height(height * 0.01),
                  ProfileImage(width: width, image: image),
                  size.height(height * 0.01),
                  TextLineWidget(width: width),
                  size.height(height * 0.022),
                  SizedBox(
                    width: width * 0.8,
                    height: height * 0.06,
                    child: Customauthbutton(
                      textColor: AppColors.whiteColor,
                      buttonText: "Login",
                      buttonColor: AppColors.button_Color,
                      height: height,
                      width: width,
                      onTap: () {},
                    ),
                  ),
                ],
              ),
              ContainerWidget(
                width: width,
                height: height,
                onClick: () {
                  context.navigateTo(ProfileScreen());
                },
                icon: Icons.person_2_outlined,
                text: "Profile",
              ),
              ContainerWidget(
                width: width,
                height: height,
                onClick: () {
                  onNavItemSelected?.call(1);
                },
                icon: Icons.format_list_numbered,
                text: "My Orders",
              ),
              ContainerWidget(
                width: width,
                height: height,
                onClick: () {
                  //  context.navigateTo(Favorite());
                  onNavItemSelected?.call(3);
                },
                icon: Icons.favorite_border,
                text: "Favorite",
              ),
              ContainerWidget(
                width: width,
                height: height,
                onClick: () {
                  showDialog(
                    context: context,
                    builder: (context) => LanguageDialog(
                      height: height,
                      width: width,
                      initialLanguage: "en",
                      onLanguageSelected: (lang) {
                        print("Selected Language: $lang");
                      },
                    ),
                  );
                },
                icon: Icons.language,
                text: "Language",
              ),
              ContainerWidget(
                width: width,
                height: height,
                onClick: () {
                  context.navigateTo(ContactUsScreen());
                },
                icon: Icons.headphones_outlined,
                text: "Support",
              ),
              ContainerWidget(
                width: width,
                height: height,
                onClick: () {
                  context.navigateTo(TermsAndConditions());
                },
                icon: Icons.handshake_outlined,
                text: "Terms & Conditions",
              ),
              ContainerWidget(
                width: width,
                height: height,
                onClick: () {
                  // About Us page
                },
                icon: Icons.info_outline,
                text: "About Us",
              ),
            ],
          ),
        ),
      );
    });
  }
}

class TextLineWidget extends StatelessWidget {
  const TextLineWidget({
    super.key,
    required this.width,
    this.text = "Welcome, Fruit Market",
  });

  final double width;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: width * 0.05,
        color: AppColors.blackColor,
      ),
    );
  }
}

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
    required this.width,
    required this.image,
  });

  final double width;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.24,
      height: width * 0.24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.grayColor.withOpacity(.5),
          width: 2,
        ),
        image: image.isNotEmpty
            ? DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: image.isEmpty
          ? Icon(
              Icons.person_2_outlined,
              size: width * 0.12,
              color: AppColors.grayColor.withOpacity(.5),
            )
          : null,
    );
  }
}

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({
    super.key,
    required this.width,
    required this.height,
    required this.onClick,
    required this.icon,
    required this.text,
  });

  final double width;
  final double height;
  final VoidCallback onClick;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        height: height * 0.07,
        width: width * 0.9,
        margin: EdgeInsets.symmetric(
            vertical: height * 0.008, horizontal: width * .04),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
        ),
        child: ListTile(
          leading:
              Icon(icon, color: AppColors.button_Color, size: width * 0.08),
          title: Text(
            text,
            style: TextStyle(
              fontSize: width * 0.04,
              color: AppColors.blackColor,
            ),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: AppColors.button_Color,
            size: width * 0.04,
          ),
          onTap: onClick,
        ),
      ),
    );
  }
}
