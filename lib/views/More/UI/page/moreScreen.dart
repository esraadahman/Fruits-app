import 'package:fruits_app/Core/commonImports/commonImports.dart';
import 'package:fruits_app/Core/utils/widgets/ResponsiveLayout.dart';
import 'package:fruits_app/views/More/UI/widgets/ContainerWidget.dart';
import 'package:fruits_app/views/More/UI/widgets/ProfileImage.dart';
import 'package:fruits_app/views/More/UI/widgets/TextLineWidget.dart';

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
        appBar: AppBarWidget(
          orientation: deviceInfo.orientation,
          width: width,
          title: "Fruit Market",
          centerTitle: true,
        ),
        body: ResponsiveLayout(
            portrait: PortraitMoreWidget(
                orientation: deviceInfo.orientation,
                height: height,
                width: width,
                image: image,
                onNavItemSelected: onNavItemSelected),
            landscape: landscapeMore(
                orientation: deviceInfo.orientation,
                width: width,
                height: height,
                onNavItemSelected: onNavItemSelected,
                image: image)),
      );
    });
  }
}

class landscapeMore extends StatelessWidget {
  const landscapeMore(
      {super.key,
      required this.width,
      required this.height,
      required this.onNavItemSelected,
      required this.image,
      this.orientation = Orientation.portrait});

  final double width;
  final double height;
  final Function(int p1)? onNavItemSelected;
  final String image;
  final Orientation orientation;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      //  size.height(height * .02),
      Expanded(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: width * .5,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ContainerWidget(
                    height: height * 1.7,
                    width: width * .5,
                    onClick: () {
                      context.navigateTo(ProfileScreen());
                    },
                    icon: Icons.person_2_outlined,
                    text: "Profile",
                  ),
                  ContainerWidget(
                    height: height * 1.7,
                    width: width * .5,
                    onClick: () {
                      onNavItemSelected?.call(1);
                    },
                    icon: Icons.format_list_numbered,
                    text: "My Orders",
                  ),
                  ContainerWidget(
                    height: height * 1.7,
                    width: width * .5,
                    onClick: () {
                      //  context.navigateTo(Favorite());
                      onNavItemSelected?.call(3);
                    },
                    icon: Icons.favorite_border,
                    text: "Favorite",
                  ),
                  ContainerWidget(
                    height: height * 1.7,
                    width: width * .5,
                    onClick: () {
                      showDialog(
                        context: context,
                        builder: (context) => LanguageDialog(
                          height: height,
                          width: width * .5,
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
                    height: height * 1.7,
                    width: width * .5,
                    onClick: () {
                      context.navigateTo(ContactUsScreen());
                    },
                    icon: Icons.headphones_outlined,
                    text: "Support",
                  ),
                  ContainerWidget(
                    height: height * 1.7,
                    width: width * .5,
                    onClick: () {
                      context.navigateTo(TermsAndConditions());
                    },
                    icon: Icons.handshake_outlined,
                    text: "Terms & Conditions",
                  ),
                  ContainerWidget(
                    height: height * 1.7,
                    width: width * .5,
                    onClick: () {
                      // About Us page
                    },
                    icon: Icons.info_outline,
                    text: "About Us",
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: width * .5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ProfileImage(width: width * .5, image: image),
                size.height(height * 0.022),
                TextLineWidget(width: width * .5),
                size.height(height * 0.022),
                SizedBox(
                  width: width * 0.3,
                  height: height * 0.12,
                  child: Customauthbutton(
                    orientation: orientation,
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
          ),
        ],
      ))
    ]);
  }
}

class PortraitMoreWidget extends StatelessWidget {
  const PortraitMoreWidget({
    super.key,
    required this.height,
    required this.width,
    required this.image,
    required this.onNavItemSelected,
    this.orientation = Orientation.portrait,
  });

  final double height;
  final double width;
  final String image;
  final Orientation orientation;
  final Function(int p1)? onNavItemSelected;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                  orientation: orientation,
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
            height: height,
            width: width,
            onClick: () {
              context.navigateTo(ProfileScreen());
            },
            icon: Icons.person_2_outlined,
            text: "Profile",
          ),
          ContainerWidget(
            height: height,
            width: width,
            onClick: () {
              onNavItemSelected?.call(1);
            },
            icon: Icons.format_list_numbered,
            text: "My Orders",
          ),
          ContainerWidget(
            height: height,
            width: width,
            onClick: () {
              //  context.navigateTo(Favorite());
              onNavItemSelected?.call(3);
            },
            icon: Icons.favorite_border,
            text: "Favorite",
          ),
          ContainerWidget(
            height: height,
            width: width,
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
            height: height,
            width: width,
            onClick: () {
              context.navigateTo(ContactUsScreen());
            },
            icon: Icons.headphones_outlined,
            text: "Support",
          ),
          ContainerWidget(
            height: height,
            width: width,
            onClick: () {
              context.navigateTo(TermsAndConditions());
            },
            icon: Icons.handshake_outlined,
            text: "Terms & Conditions",
          ),
          ContainerWidget(
            height: height,
            width: width,
            onClick: () {
              // About Us page
            },
            icon: Icons.info_outline,
            text: "About Us",
          ),
          size.height(height * 0.02),
        ],
      ),
    );
  }
}
